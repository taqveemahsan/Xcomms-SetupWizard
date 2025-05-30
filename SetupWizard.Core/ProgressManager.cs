using System;
using System.Collections.Generic;
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
                progress?.Report(new ProgressEventArgs(10, "Creating database..."));
                var dbManager = new DatabaseManager();
                await dbManager.CreateDatabase(config.Database.ServerName, config.Database.DatabaseName,
                                             config.Database.Username, config.Database.Password);

                // Step 2: Execute Scripts
                progress?.Report(new ProgressEventArgs(30, "Executing database scripts..."));
                string connectionString = $"Server={config.Database.ServerName};Database={config.Database.DatabaseName};User Id={config.Database.Username};Password={config.Database.Password};";
                string[] scripts = Directory.GetFiles("Scripts", "*.sql");
                await dbManager.ExecuteScripts(connectionString, scripts);

                // Step 3: Setup Backup
                progress?.Report(new ProgressEventArgs(50, "Setting up database backup..."));
                await dbManager.SetupBackup(connectionString, config.Database.DatabaseName, config.Backup.BackupPath);

                // Step 4: Deploy API
                progress?.Report(new ProgressEventArgs(70, "Deploying API to IIS..."));
                var deploymentManager = new DeploymentManager();
                string apiConnectionString = $"Server={config.Database.ServerName};Database={config.Database.DatabaseName};User Id={config.Database.Username};Password={config.Database.Password};TrustServerCertificate=true;";
                deploymentManager.DeployPreBuiltAPI(config.IIS.APISourcePath, config.IIS.APIPath, config.IIS.APIPort, config.IIS.AppPoolName, apiConnectionString);

                // Step 5: Deploy Web App
                progress?.Report(new ProgressEventArgs(90, "Deploying web application..."));
                string apiUrl = $"http://localhost:{config.IIS.APIPort}";
                deploymentManager.DeployPreBuiltWeb(config.IIS.WebSourcePath, config.IIS.WebPath, config.IIS.WebPort, config.IIS.AppPoolName, apiConnectionString, apiUrl);

                // Step 6: Complete
                progress?.Report(new ProgressEventArgs(100, "Setup completed successfully!"));
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
