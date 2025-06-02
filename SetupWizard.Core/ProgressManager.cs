using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static SetupWizard.Core.ConfigurationManager;

namespace SetupWizard.Core
{
    // SetupWizard.Core/ProgressManager.cs
    public class ProgressManager
    {
        public event EventHandler<ProgressEventArgs> ProgressChanged;

        public async Task ExecuteSetupProcess(SetupConfig config, IProgress<ProgressEventArgs> progress)
        {
            try
            {
                // Step 1: Database Setup
                progress?.Report(new ProgressEventArgs(10, "Setting up database..."));
                var dbManager = new DatabaseManager();

                if (!string.IsNullOrEmpty(config.Database.ScriptPath))
                {
                    // Setup database from script if script path is provided
                    progress?.Report(new ProgressEventArgs(20, "Creating database from script..."));
                    await dbManager.SetupDatabaseFromScript(
                        config.Database.ServerName, 
                        config.Database.Username, 
                        config.Database.Password, 
                        config.Database.DatabaseName, 
                        config.Database.ScriptPath);
                }
                else if (!string.IsNullOrEmpty(config.Database.BackupPath))
                {
                    // Fallback to backup if script path is not provided but backup path is
                    progress?.Report(new ProgressEventArgs(20, "Restoring database from backup..."));
                    await dbManager.RestoreDatabaseFromLocalFile(
                        config.Database.ServerName,
                        config.Database.Username,
                        config.Database.Password,
                        config.Database.DatabaseName,
                        config.Database.BackupPath);
                }
                else
                {
                    // Use default script if neither is provided
                    progress?.Report(new ProgressEventArgs(20, "Creating database from default script..."));
                    string defaultScriptPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Database", "setup.sql");
                    
                    await dbManager.SetupDatabaseFromScript(
                        config.Database.ServerName, 
                        config.Database.Username, 
                        config.Database.Password, 
                        config.Database.DatabaseName, 
                        defaultScriptPath);
                }

                // Step 2: Deploy API
                progress?.Report(new ProgressEventArgs(50, "Deploying API to IIS..."));
                var deploymentManager = new DeploymentManager();
                string apiConnectionString = $"Server={config.Database.ServerName};Database={config.Database.DatabaseName};User Id={config.Database.Username};Password={config.Database.Password};TrustServerCertificate=true;";
                var apiResult = deploymentManager.DeployPreBuiltAPI(config.IIS.APISourcePath, config.IIS.APIPath, config.IIS.APIPort, config.IIS.AppPoolName, apiConnectionString);

                // Step 3: Deploy Web App
                progress?.Report(new ProgressEventArgs(80, "Deploying web application..."));
                var webResult = deploymentManager.DeployPreBuiltWeb(config.IIS.WebSourcePath, config.IIS.WebPath, config.IIS.WebPort, config.IIS.AppPoolName, apiConnectionString, apiResult.Url);

                // Step 4: Complete
                progress?.Report(new ProgressEventArgs(100, $"Setup completed successfully!\nAPI: {apiResult.Url}\nWeb: {webResult.Url}"));
            }
            catch (Exception ex)
            {
                progress?.Report(new ProgressEventArgs(-1, $"Setup failed: {ex.Message}"));
                throw;
            }
        }
    }

    public class ProgressEventArgs : EventArgs
    {
        public int PercentComplete { get; }
        public string Message { get; }

        public ProgressEventArgs(int percentComplete, string message)
        {
            PercentComplete = percentComplete;
            Message = message;
        }
    }
}
