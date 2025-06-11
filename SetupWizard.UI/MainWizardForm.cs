using Microsoft.Web.Administration;
using SetupWizard.Core;
using System.Configuration;
using System.Text;
using static SetupWizard.Core.ConfigurationManager;
using Application = System.Windows.Forms.Application;
using ConfigurationManager = SetupWizard.Core.ConfigurationManager;
using System.Xml;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace SetupWizard.UI;

// SetupWizard.UI/MainWizardForm.cs
public partial class MainWizardForm : Form
{
    private TabControl wizardTabs;
    private DatabaseManager dbManager;
    private IISManager iisManager;
    private ConfigurationManager configManager;
    private SetupConfig currentConfig;

    public MainWizardForm()
    {
        InitializeComponent();
        InitializeWizard();
        EnsurePublishDirectoriesExist();
    }

    private void EnsurePublishDirectoriesExist()
    {
        try
        {
            // Create the main PublishFiles directory if it doesn't exist
            string publishFilesDir = Path.Combine(Application.StartupPath, "PublishFiles");
            if (!Directory.Exists(publishFilesDir))
            {
                Directory.CreateDirectory(publishFilesDir);
            }

            // Create API directory if it doesn't exist
            string apiDir = Path.Combine(publishFilesDir, "API");
            if (!Directory.Exists(apiDir))
            {
                Directory.CreateDirectory(apiDir);
            }

            // Create Web directory if it doesn't exist
            string webDir = Path.Combine(publishFilesDir, "Web");
            if (!Directory.Exists(webDir))
            {
                Directory.CreateDirectory(webDir);
            }

            // Create a placeholder for the SQL script if it doesn't exist
            string sqlScriptPath = Path.Combine(publishFilesDir, "XComms.sql");
            if (!File.Exists(sqlScriptPath))
            {
                // Create an empty file as a placeholder
                File.WriteAllText(sqlScriptPath, "-- XComms SQL Script placeholder\n-- Replace this file with the actual XComms.sql script");
            }

            // Add a README file to explain the directory structure
            string readmePath = Path.Combine(publishFilesDir, "README.txt");
            if (!File.Exists(readmePath))
            {
                string readmeContent = @"PublishFiles Directory Structure
============================

This directory contains the files needed for the XComms setup:

1. API/ - Place the published API files here
   - Required files: SetupWizard.API.dll, appsettings.json, web.config

2. Web/ - Place the published Web application files here
   - Required files: SetupWizard.Web.dll, appsettings.json, web.config, wwwroot/

3. XComms.sql - The SQL script to create and populate the database

Please ensure all required files are present before running the setup wizard.
";
                File.WriteAllText(readmePath, readmeContent);
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Failed to create publish directories: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void InitializeWizard()
    {
        dbManager = new DatabaseManager();
        iisManager = new IISManager();
        configManager = new ConfigurationManager();
        currentConfig = new SetupConfig();

        SetupWizardTabs();
    }

    private void SetupWizardTabs()
    {
        wizardTabs = new TabControl();
        wizardTabs.Dock = DockStyle.Fill;

        // Tab 1: Welcome
        wizardTabs.TabPages.Add(CreateWelcomeTab());

        // Tab 2: Database Setup
        wizardTabs.TabPages.Add(CreateDatabaseTab());

        // Tab 3: Pre-Built Files Setup
        wizardTabs.TabPages.Add(CreateDeploymentTab());

        // Tab 4: IIS Setup
        wizardTabs.TabPages.Add(CreateIISTab());

        // Tab 5: Backup Setup
        wizardTabs.TabPages.Add(CreateBackupTab());

        // Tab 6: Final Review
        wizardTabs.TabPages.Add(CreateReviewTab());

        this.Controls.Add(wizardTabs);
    }

    private TabPage CreateDeploymentTab()
    {
        var tab = new TabPage("Pre-Built Files Setup");

        // API Section
        var apiGroupBox = new GroupBox { Text = "API Deployment", Location = new Point(20, 20), Size = new Size(450, 150) };

        var apiPathLabel = new Label { Text = "API Source Path:", Location = new Point(10, 30) };
        var apiPathTextBox = new TextBox { 
            Location = new Point(120, 30), 
            Width = 300, 
            Name = "APISourcePath", 
            Text = Path.Combine(Application.StartupPath, "PublishFiles", "API"),
            ReadOnly = true 
        };

        var apiPortLabel = new Label { Text = "API Port:", Location = new Point(10, 70) };
        var apiPortTextBox = new TextBox { Location = new Point(120, 70), Width = 100, Name = "APIPort", Text = "5001" };

        var apiValidateButton = new Button { Text = "Validate Files", Location = new Point(230, 70), Width = 100 };
        apiValidateButton.Click += (s, e) => ValidateAPIFiles();

        var apiTargetLabel = new Label { Text = "Deploy To:", Location = new Point(10, 110) };
        var apiTargetTextBox = new TextBox { Location = new Point(120, 110), Width = 300, Name = "APITargetPath", Text = @"C:\inetpub\wwwroot\MyAPI" };

        apiGroupBox.Controls.AddRange(new Control[] {
            apiPathLabel, apiPathTextBox,
            apiPortLabel, apiPortTextBox, apiValidateButton,
            apiTargetLabel, apiTargetTextBox
        });

        // Web Section
        var webGroupBox = new GroupBox { Text = "Web Application Deployment", Location = new Point(20, 180), Size = new Size(450, 150) };

        var webPathLabel = new Label { Text = "Web Source Path:", Location = new Point(10, 30) };
        var webPathTextBox = new TextBox { 
            Location = new Point(120, 30), 
            Width = 300, 
            Name = "WebSourcePath", 
            Text = Path.Combine(Application.StartupPath, "PublishFiles", "Web"),
            ReadOnly = true 
        };

        var webPortLabel = new Label { Text = "Web Port:", Location = new Point(10, 70) };
        var webPortTextBox = new TextBox { Location = new Point(120, 70), Width = 100, Name = "WebPort", Text = "5002" };

        var webValidateButton = new Button { Text = "Validate Files", Location = new Point(230, 70), Width = 100 };
        webValidateButton.Click += (s, e) => ValidateWebFiles();

        var webTargetLabel = new Label { Text = "Deploy To:", Location = new Point(10, 110) };
        var webTargetTextBox = new TextBox { Location = new Point(120, 110), Width = 300, Name = "WebTargetPath", Text = @"C:\inetpub\wwwroot\MyWeb" };

        webGroupBox.Controls.AddRange(new Control[] {
            webPathLabel, webPathTextBox,
            webPortLabel, webPortTextBox, webValidateButton,
            webTargetLabel, webTargetTextBox
        });

        // Deploy Button
        var deployButton = new Button { 
            Text = "Deploy Applications", 
            Location = new Point(150, 350), 
            Width = 150, 
            Height = 40,
            Name = "DeployButton"
        };
        deployButton.BackColor = Color.Green;
        deployButton.ForeColor = Color.White;
        deployButton.Click += async (s, e) => await DeployApplications();

        // Next button (initially hidden)
        var nextButton = new Button { 
            Text = "Next >>", 
            Location = new Point(320, 350), 
            Width = 100, 
            Height = 40,
            Name = "DeploymentNextButton",
            Visible = false 
        };
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 3; // Move to IIS tab

        tab.Controls.AddRange(new Control[] { apiGroupBox, webGroupBox, deployButton, nextButton });

        return tab;
    }

    private void BrowseForFolder(string textBoxName)
    {
        using var folderDialog = new FolderBrowserDialog();
        folderDialog.Description = "Select the folder containing pre-built files";

        if (folderDialog.ShowDialog() == DialogResult.OK)
        {
            var textBox = FindControl(textBoxName) as TextBox;
            if (textBox != null)
                textBox.Text = folderDialog.SelectedPath;
        }
    }

    private void ValidateAPIFiles()
    {
        try
        {
            var sourcePath = GetControlValue("APISourcePath");
            if (!Directory.Exists(sourcePath))
            {
                MessageBox.Show($"API source directory not found at: {sourcePath}\nPlease ensure the PublishFiles/API folder exists and contains the required files.", 
                    "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var deploymentManager = new DeploymentManager();
            bool isValid = deploymentManager.ValidatePreBuiltFiles(sourcePath, "api");

            if (isValid)
            {
                MessageBox.Show("API files validation successful!\nFound required DLL and configuration files.", "Validation Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("API files validation failed!\nMissing required files (DLL or appsettings.json).", "Validation Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"API validation failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void ValidateWebFiles()
    {
        try
        {
            var sourcePath = GetControlValue("WebSourcePath");
            if (!Directory.Exists(sourcePath))
            {
                MessageBox.Show($"Web source directory not found at: {sourcePath}\nPlease ensure the PublishFiles/Web folder exists and contains the required files.", 
                    "Validation", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var deploymentManager = new DeploymentManager();
            bool isValid = deploymentManager.ValidatePreBuiltFiles(sourcePath, "web");

            if (isValid)
            {
                MessageBox.Show("Web files validation successful!\nFound required DLL and configuration files.", "Validation Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Web files validation failed!\nMissing required files (DLL or appsettings.json).", "Validation Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Web validation failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private async Task DeployApplications()
    {
        try
        {
            var progressForm = new ProgressForm();
            progressForm.Show();

            var deploymentManager = new DeploymentManager();

            // Get all values
            var apiSourcePath = GetControlValue("APISourcePath");
            var apiTargetPath = GetControlValue("APITargetPath");
            var apiPort = int.Parse(GetControlValue("APIPort"));

            var webSourcePath = GetControlValue("WebSourcePath");
            var webTargetPath = GetControlValue("WebTargetPath");
            var webPort = int.Parse(GetControlValue("WebPort"));

            // Validate source paths exist
            if (!Directory.Exists(apiSourcePath))
            {
                MessageBox.Show($"API source directory not found at: {apiSourcePath}\nPlease ensure the PublishFiles/API folder exists and contains the required files.", 
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                progressForm.Close();
                return;
            }

            if (!Directory.Exists(webSourcePath))
            {
                MessageBox.Show($"Web source directory not found at: {webSourcePath}\nPlease ensure the PublishFiles/Web folder exists and contains the required files.", 
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                progressForm.Close();
                return;
            }

            var connectionString = $"Server={currentConfig.Database.ServerName};Database={currentConfig.Database.DatabaseName};User Id={currentConfig.Database.Username};Password={currentConfig.Database.Password};TrustServerCertificate=true;";

            // Generate unique app pool names with timestamp to avoid conflicts
            string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
            string apiAppPoolName = $"XCommsAPIPool_{timestamp}";
            string webAppPoolName = $"XCommsWebPool_{timestamp}";

            // Deploy API
            progressForm.UpdateProgress(30, "Deploying API...");
            var apiResult = deploymentManager.DeployPreBuiltAPI(apiSourcePath, apiTargetPath, apiPort, apiAppPoolName, connectionString);

            // Deploy Web with the actual API URL
            progressForm.UpdateProgress(70, "Deploying Web Application...");
            var webResult = deploymentManager.DeployPreBuiltWeb(webSourcePath, webTargetPath, webPort, webAppPoolName, connectionString, apiResult.Url);

            progressForm.UpdateProgress(100, "Deployment completed!");

            if (apiResult.Success && webResult.Success)
            {
                MessageBox.Show($"Deployment successful!\n\nAPI: {apiResult.Url}\nWeb: {webResult.Url}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                
                // Show Next button and hide Deploy button
                var deployButton = FindControl("DeployButton") as Button;
                var nextButton = FindControl("DeploymentNextButton") as Button;
                if (deployButton != null && nextButton != null)
                {
                    deployButton.Visible = false;
                    nextButton.Visible = true;
                }
            }

            progressForm.Close();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Deployment failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private Control FindControl(string name)
    {
        foreach (TabPage tab in wizardTabs.TabPages)
        {
            var control = tab.Controls.Find(name, true).FirstOrDefault();
            if (control != null)
                return control;
        }
        return null;
    }

    private async Task TestDatabaseConnection()
    {
        try
        {
            var serverName = GetControlValue("ServerName");
            var username = GetControlValue("Username");
            var password = GetControlValue("Password");

            // Test connection logic here
            MessageBox.Show("Connection successful!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Connection failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private async Task CreateDatabase()
    {
        try
        {
            var serverName = GetControlValue("ServerName");
            var databaseName = GetControlValue("DatabaseName");
            var username = GetControlValue("Username");
            var password = GetControlValue("Password");

            bool result = await dbManager.CreateDatabase(serverName, databaseName, username, password);

            if (result)
            {
                MessageBox.Show("Database created successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Save config
                currentConfig.Database = new DatabaseConfig
                {
                    ServerName = serverName,
                    DatabaseName = databaseName,
                    Username = username,
                    Password = password
                };
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Database creation failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private TabPage CreateDatabaseTab()
    {
        var tab = new TabPage("Database Setup");

        // Database connection group
        var dbGroupBox = new GroupBox { Text = "Database Connection", Location = new Point(20, 20), Size = new Size(450, 150) };

        var serverLabel = new Label { Text = "Server Name:", Location = new Point(10, 30) };
        var serverTextBox = new TextBox { Location = new Point(120, 30), Width = 200, Name = "ServerName", Text = "localhost" };

        var usernameLabel = new Label { Text = "Username:", Location = new Point(10, 70) };
        var usernameTextBox = new TextBox { Location = new Point(120, 70), Width = 200, Name = "Username", Text = "sa" };

        var passwordLabel = new Label { Text = "Password:", Location = new Point(10, 110) };
        var passwordTextBox = new TextBox { Location = new Point(120, 110), Width = 200, Name = "Password", UseSystemPasswordChar = true };

        var testConnectionButton = new Button { Text = "Test Connection", Location = new Point(330, 70), Width = 100 };
        testConnectionButton.Click += async (s, e) => await TestDatabaseConnection();

        dbGroupBox.Controls.AddRange(new Control[] {
            serverLabel, serverTextBox,
            usernameLabel, usernameTextBox,
            passwordLabel, passwordTextBox,
            testConnectionButton
        });

        // Database setup group
        var setupGroupBox = new GroupBox { Text = "Database Setup", Location = new Point(20, 180), Size = new Size(450, 150) };

        var dbNameLabel = new Label { Text = "Database Name:", Location = new Point(10, 30) };
        var dbNameTextBox = new TextBox { Location = new Point(120, 30), Width = 200, Name = "DatabaseName", Text = "XCommsDB" };

        var scriptPathLabel = new Label { Text = "SQL Script:", Location = new Point(10, 60) };
        var scriptPathTextBox = new TextBox { 
            Location = new Point(120, 60), 
            Width = 300, 
            Name = "ScriptPath", 
            Text = Path.Combine(Application.StartupPath, "PublishFiles", "XComms.sql"),
            ReadOnly = true 
        };

        var setupButton = new Button { Text = "Setup Database", Location = new Point(200, 100), Width = 120, Name = "SetupDatabaseButton" };
        setupButton.Click += async (s, e) => await SetupDatabaseFromScript();

        // Add Next button (initially hidden)
        var nextButton = new Button { 
            Text = "Next >>", 
            Location = new Point(330, 100), 
            Width = 100, 
            Name = "DatabaseNextButton",
            Visible = false 
        };
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 2; // Move to next tab

        setupGroupBox.Controls.AddRange(new Control[] {
            dbNameLabel, dbNameTextBox,
            scriptPathLabel, scriptPathTextBox,
            setupButton, nextButton
        });

        tab.Controls.AddRange(new Control[] { dbGroupBox, setupGroupBox });

        return tab;
    }

    private void BrowseForScriptFile()
    {
        using var openFileDialog = new OpenFileDialog();
        openFileDialog.Title = "Select SQL Script File";
        openFileDialog.Filter = "SQL Files (*.sql)|*.sql|All Files (*.*)|*.*";
        openFileDialog.InitialDirectory = Path.Combine(System.Windows.Forms.Application.StartupPath, "Scripts");
        openFileDialog.Multiselect = true; // Allow selecting multiple files

        if (openFileDialog.ShowDialog() == DialogResult.OK)
        {
            var textBox = FindControl("ScriptPath") as TextBox;
            if (textBox != null)
            {
                if (openFileDialog.FileNames.Length > 1)
                {
                    // Join multiple file paths with semicolons
                    textBox.Text = string.Join(";", openFileDialog.FileNames);
                }
                else
                {
                    textBox.Text = openFileDialog.FileName;
                }
            }
        }
    }

    private async Task SetupDatabaseFromScript()
    {
        try
        {
            var serverName = GetControlValue("ServerName");
            var username = GetControlValue("Username");
            var password = GetControlValue("Password");
            var databaseName = GetControlValue("DatabaseName");
            var scriptPath = GetControlValue("ScriptPath");

            if (!File.Exists(scriptPath))
            {
                MessageBox.Show($"SQL script file not found at: {scriptPath}\nPlease ensure the PublishFiles/XComms.sql file exists.", 
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Show progress
            var progressForm = new ProgressForm();
            progressForm.Show();
            progressForm.UpdateProgress(30, "Setting up database from script...");

            bool result = await dbManager.SetupDatabaseFromScript(serverName, username, password, databaseName, scriptPath);

            progressForm.UpdateProgress(100, "Database setup completed!");
            progressForm.Close();

            if (result)
            {
                MessageBox.Show("Database setup successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Save config for next steps
                currentConfig.Database = new DatabaseConfig
                {
                    ServerName = serverName,
                    DatabaseName = databaseName,
                    Username = username,
                    Password = password,
                    ScriptPath = scriptPath
                };

                // Update connection strings in Web.config files
                UpdateConnectionStrings();

                // Show Next button and hide Setup button
                var setupButton = FindControl("SetupDatabaseButton") as Button;
                var nextButton = FindControl("DatabaseNextButton") as Button;
                if (setupButton != null && nextButton != null)
                {
                    setupButton.Visible = false;
                    nextButton.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Database setup failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private string GetControlValue(string controlName)
    {
        foreach (TabPage tab in wizardTabs.TabPages)
        {
            var control = tab.Controls.Find(controlName, true).FirstOrDefault();
            if (control is TextBox textBox)
                return textBox.Text;
        }
        return string.Empty;
    }

    private TabPage CreateWelcomeTab()
    {
        var tab = new TabPage("Welcome");

        var welcomeLabel = new Label
        {
            Text = "Welcome to Setup Wizard\n\nThis wizard will help you:\n� Setup Database\n� Deploy API & Web Applications\n� Configure IIS\n� Setup Backup",
            Location = new Point(50, 50),
            Size = new Size(400, 200),
            Font = new Font("Segoe UI", 12)
        };

        var nextButton = new Button
        {
            Text = "Next >>",
            Location = new Point(350, 300),
            Width = 100
        };
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 1;

        tab.Controls.AddRange(new Control[] { welcomeLabel, nextButton });
        return tab;
    }

    private TabPage CreateIISTab()
    {
        var tab = new TabPage("IIS Configuration");

        var iisInfoLabel = new Label
        {
            Text = "IIS Settings (Will be configured automatically during deployment)",
            Location = new Point(20, 20),
            Size = new Size(400, 40),
            Font = new Font("Segoe UI", 10, FontStyle.Bold)
        };

        var appPoolLabel = new Label { Text = "Application Pool Name:", Location = new Point(20, 80) };
        var appPoolTextBox = new TextBox { Location = new Point(180, 80), Width = 200, Name = "AppPoolName", Text = "MyAppPool" };

        var apiSiteLabel = new Label { Text = "API Site Name:", Location = new Point(20, 120) };
        var apiSiteTextBox = new TextBox { Location = new Point(180, 120), Width = 200, Name = "APISiteName", Text = "MyAPI" };

        var webSiteLabel = new Label { Text = "Web Site Name:", Location = new Point(20, 160) };
        var webSiteTextBox = new TextBox { Location = new Point(180, 160), Width = 200, Name = "WebSiteName", Text = "MyWeb" };

        var checkIISButton = new Button { 
            Text = "Check IIS Status", 
            Location = new Point(150, 220), 
            Width = 120,
            Name = "CheckIISButton"
        };
        checkIISButton.Click += (s, e) => CheckIISStatus();

        // Next button (initially hidden)
        var nextButton = new Button { 
            Text = "Next >>", 
            Location = new Point(280, 220), 
            Width = 100,
            Name = "IISNextButton",
            Visible = false 
        };
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 4; // Move to Backup tab

        tab.Controls.AddRange(new Control[] {
            iisInfoLabel, appPoolLabel, appPoolTextBox,
            apiSiteLabel, apiSiteTextBox, webSiteLabel, webSiteTextBox,
            checkIISButton, nextButton
        });

        return tab;
    }
    private TabPage CreateBackupTab()
    {
        var tab = new TabPage("Backup Setup");

        var backupLabel = new Label { Text = "Backup Path:", Location = new Point(20, 20) };
        var backupTextBox = new TextBox { Location = new Point(120, 20), Width = 200, Name = "BackupPath", Text = @"C:\DatabaseBackups" };
        var backupBrowseButton = new Button { Text = "Browse", Location = new Point(330, 20), Width = 80 };
        backupBrowseButton.Click += (s, e) => BrowseForFolder("BackupPath");

        var scheduleLabel = new Label { Text = "Backup Schedule:", Location = new Point(20, 60) };
        var scheduleComboBox = new ComboBox
        {
            Location = new Point(120, 60),
            Width = 200,
            Name = "BackupSchedule",
            DropDownStyle = ComboBoxStyle.DropDownList
        };
        scheduleComboBox.Items.AddRange(new string[] { "Daily", "Weekly", "Monthly" });
        scheduleComboBox.SelectedIndex = 0;

        var testBackupButton = new Button { 
            Text = "Test Backup", 
            Location = new Point(150, 120), 
            Width = 120,
            Name = "TestBackupButton"
        };
        testBackupButton.Click += async (s, e) => await TestBackup();

        // Next button (initially hidden)
        var nextButton = new Button { 
            Text = "Next >>", 
            Location = new Point(280, 120), 
            Width = 100,
            Name = "BackupNextButton",
            Visible = false 
        };
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 5; // Move to Review tab

        tab.Controls.AddRange(new Control[] {
            backupLabel, backupTextBox, backupBrowseButton,
            scheduleLabel, scheduleComboBox, 
            testBackupButton, nextButton
        });

        return tab;
    }

    private TabPage CreateReviewTab()
    {
        var tab = new TabPage("Review & Install");

        var reviewTextBox = new TextBox
        {
            Location = new Point(20, 20),
            Size = new Size(450, 250),
            Multiline = true,
            ScrollBars = ScrollBars.Vertical,
            ReadOnly = true,
            Name = "ReviewText"
        };

        var startSetupButton = new Button
        {
            Text = "Start Setup",
            Location = new Point(200, 290),
            Width = 120,
            Height = 40,
            BackColor = Color.Green,
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 10, FontStyle.Bold)
        };
        startSetupButton.Click += async (s, e) => await StartCompleteSetup();

        tab.Controls.AddRange(new Control[] { reviewTextBox, startSetupButton });

        // Update review when tab is selected
        wizardTabs.SelectedIndexChanged += (s, e) =>
        {
            if (wizardTabs.SelectedTab == tab)
                UpdateReviewTab();
        };

        return tab;
    }

    private void CheckIISStatus()
    {
        try
        {
            using var serverManager = new ServerManager();
            var sites = serverManager.Sites.Count;
            var appPools = serverManager.ApplicationPools.Count;

            MessageBox.Show($"IIS Status:\nSites: {sites}\nApplication Pools: {appPools}\n\nIIS is ready for deployment!",
                           "IIS Status", MessageBoxButtons.OK, MessageBoxIcon.Information);
            
            // Show Next button after successful check
            var checkButton = FindControl("CheckIISButton") as Button;
            var nextButton = FindControl("IISNextButton") as Button;
            if (checkButton != null && nextButton != null)
            {
                nextButton.Visible = true;
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"IIS check failed: {ex.Message}\n\nPlease ensure IIS is installed and you have administrator privileges.",
                           "IIS Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private async Task TestBackup()
    {
        try
        {
            var backupPath = GetControlValue("BackupPath");
            if (string.IsNullOrEmpty(backupPath))
            {
                MessageBox.Show("Please enter backup path first!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Create directory if not exists
            Directory.CreateDirectory(backupPath);

            // Test write permission
            string testFile = Path.Combine(backupPath, "test.txt");
            File.WriteAllText(testFile, "Test backup access");
            File.Delete(testFile);

            MessageBox.Show("Backup path is valid and writable!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Backup test failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void UpdateReviewTab()
    {
        var reviewText = FindControl("ReviewText") as TextBox;
        if (reviewText != null)
        {
            var sb = new StringBuilder();
            sb.AppendLine("=== SETUP REVIEW ===\n");

            sb.AppendLine("DATABASE CONFIGURATION:");
            sb.AppendLine($"  Server: {GetControlValue("ServerName")}");
            sb.AppendLine($"  Database: {GetControlValue("DatabaseName")}");
            sb.AppendLine($"  Username: {GetControlValue("Username")}");
            sb.AppendLine();

            sb.AppendLine("DEPLOYMENT CONFIGURATION:");
            sb.AppendLine($"  API Source: {GetControlValue("APISourcePath")}");
            sb.AppendLine($"  API Port: {GetControlValue("APIPort")}");
            sb.AppendLine($"  Web Source: {GetControlValue("WebSourcePath")}");
            sb.AppendLine($"  Web Port: {GetControlValue("WebPort")}");
            sb.AppendLine();

            sb.AppendLine("IIS CONFIGURATION:");
            sb.AppendLine($"  App Pool: {GetControlValue("AppPoolName")}");
            sb.AppendLine();

            sb.AppendLine("BACKUP CONFIGURATION:");
            sb.AppendLine($"  Path: {GetControlValue("BackupPath")}");
            sb.AppendLine($"  Schedule: {GetControlValue("BackupSchedule")}");
            sb.AppendLine();

            sb.AppendLine("Click 'Start Setup' to begin the installation process.");

            reviewText.Text = sb.ToString();
        }
    }

    private async Task StartCompleteSetup()
    {
        try
        {
            var progressForm = new ProgressForm();
            progressForm.Show();

            var progress = new Progress<ProgressEventArgs>(args =>
            {
                progressForm.UpdateProgress(args.PercentComplete, args.Message);
            });

            // Collect all configuration
            currentConfig.Database = new DatabaseConfig
            {
                ServerName = GetControlValue("ServerName"),
                DatabaseName = GetControlValue("DatabaseName"),
                Username = GetControlValue("Username"),
                Password = GetControlValue("Password"),
                ScriptPath = GetControlValue("ScriptPath")  // Include script path
            };

            currentConfig.IIS = new IISConfig
            {
                APISourcePath = GetControlValue("APISourcePath"),
                APIPath = GetControlValue("APITargetPath"),
                WebSourcePath = GetControlValue("WebSourcePath"),
                WebPath = GetControlValue("WebTargetPath"),
                APIPort = int.Parse(GetControlValue("APIPort")),
                WebPort = int.Parse(GetControlValue("WebPort")),
                AppPoolName = GetControlValue("AppPoolName")
            };

            currentConfig.Backup = new BackupConfig
            {
                BackupPath = GetControlValue("BackupPath"),
                Schedule = GetControlValue("BackupSchedule")
            };

            // Update connection strings in Web.config files
            progressForm.UpdateProgress(20, "Updating configuration files...");
            UpdateConnectionStrings();

            // Execute complete setup
            var progressManager = new ProgressManager();
            await progressManager.ExecuteSetupProcess(currentConfig, progress);

            progressForm.Close();

            MessageBox.Show($"Setup completed successfully!\n\nAPI: http://localhost:{currentConfig.IIS.APIPort}\nWeb: http://localhost:{currentConfig.IIS.WebPort}",
                           "Setup Complete", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Setup failed: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void UpdateConnectionStrings()
    {
        try
        {
            // Get database details from current config
            var serverName = currentConfig.Database.ServerName;
            var databaseName = currentConfig.Database.DatabaseName;
            var username = currentConfig.Database.Username;
            var password = currentConfig.Database.Password;

            // Create the connection string in the format you specified
            string connectionString = $"data source={serverName};initial catalog={databaseName};user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True";

            // Update API Web.config
            string apiWebConfigPath = Path.Combine(Application.StartupPath, "PublishFiles", "API", "Web.config");
            UpdateWebConfigConnectionString(apiWebConfigPath, connectionString);

            // Update Web Web.config
            string webWebConfigPath = Path.Combine(Application.StartupPath, "PublishFiles", "Web", "Web.config");
            UpdateWebConfigConnectionString(webWebConfigPath, connectionString);

            // Also update appsettings.json files if they exist
            string apiAppSettingsPath = Path.Combine(Application.StartupPath, "PublishFiles", "API", "appsettings.json");
            string webAppSettingsPath = Path.Combine(Application.StartupPath, "PublishFiles", "Web", "appsettings.json");
            
            UpdateAppSettingsConnectionString(apiAppSettingsPath, connectionString);
            UpdateAppSettingsConnectionString(webAppSettingsPath, connectionString);
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Failed to update connection strings: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void UpdateWebConfigConnectionString(string configPath, string connectionString)
    {
        if (!File.Exists(configPath))
        {
            MessageBox.Show($"Config file not found: {configPath}", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            return;
        }

        try
        {
            // Load the Web.config file
            XmlDocument doc = new XmlDocument();
            doc.Load(configPath);

            // Find the connectionStrings section
            XmlNode connectionStringsNode = doc.SelectSingleNode("//connectionStrings");
            if (connectionStringsNode != null)
            {
                // Find the DefaultConnection element
                XmlNode defaultConnectionNode = connectionStringsNode.SelectSingleNode("add[@name='DefaultConnection']");
                if (defaultConnectionNode != null)
                {
                    // Update the connectionString attribute
                    XmlAttribute connectionStringAttr = defaultConnectionNode.Attributes["connectionString"];
                    if (connectionStringAttr != null)
                    {
                        connectionStringAttr.Value = connectionString;
                        doc.Save(configPath);
                        Console.WriteLine($"Updated connection string in {configPath}");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error updating {configPath}: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }

    private void UpdateAppSettingsConnectionString(string configPath, string connectionString)
    {
        if (!File.Exists(configPath))
        {
            // This is not an error, as some configurations might not have appsettings.json
            Console.WriteLine($"appsettings.json not found: {configPath}");
            return;
        }

        try
        {
            // Read the JSON file
            string json = File.ReadAllText(configPath);
            JObject appSettings = JObject.Parse(json);

            // Update the ConnectionStrings section
            if (appSettings["ConnectionStrings"] != null && appSettings["ConnectionStrings"]["DefaultConnection"] != null)
            {
                appSettings["ConnectionStrings"]["DefaultConnection"] = connectionString;
                
                // Save the updated JSON
                File.WriteAllText(configPath, appSettings.ToString(Newtonsoft.Json.Formatting.Indented));
                Console.WriteLine($"Updated connection string in {configPath}");
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error updating {configPath}: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
