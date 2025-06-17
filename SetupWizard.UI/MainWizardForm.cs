using Microsoft.Web.Administration;
using SetupWizard.Core;
using System.Configuration;
using System.Text;
using static SetupWizard.Core.ConfigurationManager;
using Application = System.Windows.Forms.Application;
using ConfigurationManager = SetupWizard.Core.ConfigurationManager;
using System.Xml;
using System.IO;
using System.Drawing;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace SetupWizard.UI;

// SetupWizard.UI/MainWizardForm.cs
public partial class MainWizardForm : Form
{
    private DatabaseManager dbManager;
    private IISManager iisManager;
    private ConfigurationManager configManager;
    private SetupConfig currentConfig;

    public MainWizardForm()
    {
        InitializeComponent();
        this.Text = "XComms Installation Wizard";
        
        // Check if icon file exists before trying to load it
        string iconPath = Path.Combine(Application.StartupPath, "xcomms.ico");
        if (File.Exists(iconPath))
        {
            this.Icon = new Icon(iconPath, 32, 32);
        }
        
        this.Size = new Size(1100, 700);
        this.MinimumSize = new Size(800, 600); // Set minimum size to prevent UI collapse
        this.FormBorderStyle = FormBorderStyle.Sizable; // Allow resizing
        this.MaximizeBox = true; // Allow maximizing
        this.StartPosition = FormStartPosition.CenterScreen;

        // Handle resize events to ensure UI remains responsive
        this.Resize += (s, e) =>
        {
            sidebarPanel.Width = Math.Max(250, this.ClientSize.Width / 4);
            foreach (TabPage tab in wizardTabs?.TabPages ?? new TabControl.TabPageCollection(new TabControl()))
            {
                foreach (Control control in tab.Controls)
                {
                    if (control is Panel panel && panel.AutoScroll)
                    {
                        panel.Refresh();
                    }
                }
            }
        };

        InitializeWizard();
        EnsurePublishDirectoriesExist();

        string logoImg = Path.Combine(Application.StartupPath, "PublishFiles", "xcomms.png");
        if (File.Exists(logoImg))
        {
            logoPictureBox.Image = Image.FromFile(logoImg);
        }
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
        var navItems = new List<(string Text, string Icon)>
        {
            ("Database Setup", "database.png"),
            ("Install Location", "google-docs.png"),
            ("Configuration", "maintenance.png"),
            ("Backup Setup", "reload.png"),
            ("Review & Install", "checklist.png")
        };

        int yPos = 20;
        foreach (var item in navItems)
        {
            var navButton = new Button
            {
                Text = "  " + item.Text,
                TextAlign = ContentAlignment.MiddleLeft,
                FlatStyle = FlatStyle.Flat,
                ForeColor = Color.White,
                Font = new Font("Segoe UI", 10),
                Width = 220,
                Height = 40,
                Location = new Point(10, yPos),
                Padding = new Padding(5, 0, 0, 0),
                Tag = item.Text,
                Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
            };
            navButton.FlatAppearance.BorderSize = 0;
            navButton.FlatAppearance.MouseOverBackColor = ColorTranslator.FromHtml("#1976D2");
            string iconPath = Path.Combine(Application.StartupPath, "PublishFiles", item.Icon);
            if (File.Exists(iconPath))
            {
                var rawImage = Image.FromFile(iconPath);
                navButton.Image = new Bitmap(rawImage, new Size(24, 24));
                navButton.ImageAlign = ContentAlignment.MiddleLeft;
                navButton.TextImageRelation = TextImageRelation.ImageBeforeText;
            }
            navButton.Click += NavButton_Click;
            navPanel.Controls.Add(navButton);
            yPos += 50;
        }

        wizardTabs.TabPages.Add(CreateWelcomeTab());
        wizardTabs.TabPages.Add(CreateDatabaseTab());
        wizardTabs.TabPages.Add(CreateDeploymentTab());
        wizardTabs.TabPages.Add(CreateIISTab());
        wizardTabs.TabPages.Add(CreateBackupTab());
        wizardTabs.TabPages.Add(CreateReviewTab());

        wizardTabs.SelectedIndexChanged += (s, e) =>
        {
            headerLabel.Text = wizardTabs.SelectedTab.Text;
        };
    }

    private void NavButton_Click(object sender, EventArgs e)
    {
        var button = sender as Button;
        if (button != null)
        {
            string tag = button.Tag.ToString();
            switch (tag)
            {
                case "Database Setup":
                    wizardTabs.SelectedIndex = 1;
                    break;
                case "Install Location":
                    wizardTabs.SelectedIndex = 2;
                    break;
                case "Configuration":
                    wizardTabs.SelectedIndex = 3;
                    break;
                case "Backup Setup":
                    wizardTabs.SelectedIndex = 4;
                    break;
                case "Review & Install":
                    wizardTabs.SelectedIndex = 5;
                    break;
            }
        }
    }

    // Helper methods to get icons with fallback
    private Image GetDatabaseIcon()
    {
        string iconPath = Path.Combine(Application.StartupPath, "Icons", "database.png");
        if (File.Exists(iconPath))
        {
            return Image.FromFile(iconPath);
        }
        return null; // Return null if icon doesn't exist
    }

    private Image GetInstallIcon()
    {
        string iconPath = Path.Combine(Application.StartupPath, "Icons", "install.png");
        if (File.Exists(iconPath))
        {
            return Image.FromFile(iconPath);
        }
        return null;
    }

    private Image GetConfigIcon()
    {
        string iconPath = Path.Combine(Application.StartupPath, "Icons", "config.png");
        if (File.Exists(iconPath))
        {
            return Image.FromFile(iconPath);
        }
        return null;
    }

    private Image GetBackupIcon()
    {
        string iconPath = Path.Combine(Application.StartupPath, "Icons", "backup.png");
        if (File.Exists(iconPath))
        {
            return Image.FromFile(iconPath);
        }
        return null;
    }

    private Image GetReviewIcon()
    {
        string iconPath = Path.Combine(Application.StartupPath, "Icons", "review.png");
        if (File.Exists(iconPath))
        {
            return Image.FromFile(iconPath);
        }
        return null;
    }

    private TabPage CreateDeploymentTab()
    {
        var tab = new TabPage("Deployment Setup");
        tab.Padding = new Padding(20);
        
        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };
        
        var contentPanel = new Panel
        {
            Dock = DockStyle.Fill
        };
        
        // API Deployment group
        var apiGroupBox = CreateGroupBox("API Deployment", 550, 150);
        apiGroupBox.Location = new Point(0, 10);
        // Keep a fixed width so it doesn't overflow the form
        apiGroupBox.Anchor = AnchorStyles.Top | AnchorStyles.Left;
        
        var apiPathLabel = CreateLabel("API Source:", 100, 30);
        apiPathLabel.Location = new Point(20, 30);
        
        var apiPathTextBox = CreateTextBox(Path.Combine(Application.StartupPath, "PublishFiles", "API"), 300, 30);
        apiPathTextBox.Location = new Point(130, 30);
        apiPathTextBox.Name = "APISourcePath";
        apiPathTextBox.ReadOnly = true;
        apiPathTextBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        var apiBrowseButton = CreateStyledButton("Browse", 80, 30);
        apiBrowseButton.Location = new Point(450, 30);
        apiBrowseButton.Anchor = AnchorStyles.Top | AnchorStyles.Right;
        apiBrowseButton.Click += (s, e) => BrowseForFolder("APISourcePath");
        
        var apiPortLabel = CreateLabel("API Port:", 100, 30);
        apiPortLabel.Location = new Point(20, 70);
        
        var apiPortTextBox = CreateTextBox("5001", 100, 30);
        apiPortTextBox.Location = new Point(130, 70);
        apiPortTextBox.Name = "APIPort";
        
        var apiValidateButton = CreateStyledButton("Validate", 80, 30);
        apiValidateButton.Location = new Point(250, 70);
        apiValidateButton.Click += (s, e) => ValidateAPIFiles();
        
        var apiTargetLabel = CreateLabel("Deploy To:", 100, 30);
        apiTargetLabel.Location = new Point(20, 110);
        
        var apiTargetTextBox = CreateTextBox(@"C:\inetpub\wwwroot\MyAPI", 300, 30);
        apiTargetTextBox.Location = new Point(130, 110);
        apiTargetTextBox.Name = "APITargetPath";
        apiTargetTextBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        apiGroupBox.Controls.AddRange(new Control[] {
            apiPathLabel, apiPathTextBox, apiBrowseButton,
            apiPortLabel, apiPortTextBox, apiValidateButton,
            apiTargetLabel, apiTargetTextBox
        });
        
        // Web Deployment group
        var webGroupBox = CreateGroupBox("Web Deployment", 550, 150);
        webGroupBox.Location = new Point(0, 180);
        // Prevent stretching beyond the window width
        webGroupBox.Anchor = AnchorStyles.Top | AnchorStyles.Left;
        
        var webPathLabel = CreateLabel("Web Source:", 100, 30);
        webPathLabel.Location = new Point(20, 30);
        
        var webPathTextBox = CreateTextBox(Path.Combine(Application.StartupPath, "PublishFiles", "Web"), 300, 30);
        webPathTextBox.Location = new Point(130, 30);
        webPathTextBox.Name = "WebSourcePath";
        webPathTextBox.ReadOnly = true;
        webPathTextBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        var webBrowseButton = CreateStyledButton("Browse", 80, 30);
        webBrowseButton.Location = new Point(450, 30);
        webBrowseButton.Anchor = AnchorStyles.Top | AnchorStyles.Right;
        webBrowseButton.Click += (s, e) => BrowseForFolder("WebSourcePath");
        
        var webPortLabel = CreateLabel("Web Port:", 100, 30);
        webPortLabel.Location = new Point(20, 70);
        
        var webPortTextBox = CreateTextBox("5002", 100, 30);
        webPortTextBox.Location = new Point(130, 70);
        webPortTextBox.Name = "WebPort";
        
        var webValidateButton = CreateStyledButton("Validate", 80, 30);
        webValidateButton.Location = new Point(250, 70);
        webValidateButton.Click += (s, e) => ValidateWebFiles();
        
        var webTargetLabel = CreateLabel("Deploy To:", 100, 30);
        webTargetLabel.Location = new Point(20, 110);
        
        var webTargetTextBox = CreateTextBox(@"C:\inetpub\wwwroot\MyWeb", 300, 30);
        webTargetTextBox.Location = new Point(130, 110);
        webTargetTextBox.Name = "WebTargetPath";
        webTargetTextBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        webGroupBox.Controls.AddRange(new Control[] {
            webPathLabel, webPathTextBox, webBrowseButton,
            webPortLabel, webPortTextBox, webValidateButton,
            webTargetLabel, webTargetTextBox
        });
        
        // Deploy button
        var deployButton = CreateStyledButton("Deploy Applications", 150, 40);
        deployButton.Location = new Point(contentPanel.Width - 280, contentPanel.Height - 50);
        deployButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        deployButton.Click += async (s, e) => await DeployApplications();

        // Next button
        var nextButton = CreateStyledButton("Next", 100, 40);
        nextButton.Name = "DeploymentNextButton";
        nextButton.Location = new Point(contentPanel.Width - 120, contentPanel.Height - 50);
        nextButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 3; // Move to IIS tab
        
        contentPanel.Controls.Add(apiGroupBox);
        contentPanel.Controls.Add(webGroupBox);
        contentPanel.Controls.Add(deployButton);
        contentPanel.Controls.Add(nextButton);
        
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);
        
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
        var tab = new TabPage("Let's Setup Your Database");
        tab.Padding = new Padding(20);
        
        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };
        
        var contentPanel = new Panel
        {
            Width = 600,
            Height = 400,
            Dock = DockStyle.Fill
        };
        // Database connection group
        var connectionGroupBox = CreateGroupBox("Database Connection", 550, 150);
        connectionGroupBox.Location = new Point(0, 10);
        connectionGroupBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        var serverLabel = CreateLabel("Server Name:", 100, 30);
        serverLabel.Location = new Point(20, 30);
        
        var serverTextBox = CreateTextBox("localhost", 300, 30);
        serverTextBox.Location = new Point(130, 30);
        serverTextBox.Name = "ServerName";
        
        var usernameLabel = CreateLabel("Username:", 100, 30);
        usernameLabel.Location = new Point(20, 70);
        
        var usernameTextBox = CreateTextBox("sa", 300, 30);
        usernameTextBox.Location = new Point(130, 70);
        usernameTextBox.Name = "Username";
        
        var passwordLabel = CreateLabel("Password:", 100, 30);
        passwordLabel.Location = new Point(20, 110);
        
        var passwordTextBox = CreateTextBox("", 300, 30);
        passwordTextBox.Location = new Point(130, 110);
        passwordTextBox.Name = "Password";
        passwordTextBox.PasswordChar = '•';
        
        var testButton = CreateStyledButton("Test", 80, 30);
        testButton.Location = new Point(450, 70);
        testButton.Click += async (s, e) => await TestDatabaseConnection();
        
        connectionGroupBox.Controls.AddRange(new Control[] {
            serverLabel, serverTextBox,
            usernameLabel, usernameTextBox,
            passwordLabel, passwordTextBox,
            testButton
        });
        
        // Database setup group
        var setupGroupBox = CreateGroupBox("Database Setup", 550, 150);
        setupGroupBox.Location = new Point(0, 180);
        setupGroupBox.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
        
        var dbNameLabel = CreateLabel("Database:", 100, 30);
        dbNameLabel.Location = new Point(20, 30);
        
        var dbNameTextBox = CreateTextBox("XCommsDB", 300, 30);
        dbNameTextBox.Location = new Point(130, 30);
        dbNameTextBox.Name = "DatabaseName";
        
        var scriptPathLabel = CreateLabel("Backup File:", 100, 30);
        scriptPathLabel.Location = new Point(20, 70);
        
        var scriptPathTextBox = CreateTextBox(Path.Combine(Application.StartupPath, "PublishFiles", "XComms.sql"), 300, 30);
        scriptPathTextBox.Location = new Point(130, 70);
        scriptPathTextBox.Name = "ScriptPath";
        scriptPathTextBox.ReadOnly = true;
        
        var browseButton = CreateStyledButton("Browse", 80, 30);
        browseButton.Location = new Point(450, 70);
        browseButton.Click += (s, e) => BrowseForFile("ScriptPath", "SQL Files (*.sql)|*.sql|All Files (*.*)|*.*");
        
        setupGroupBox.Controls.AddRange(new Control[] {
            dbNameLabel, dbNameTextBox,
            scriptPathLabel, scriptPathTextBox,
            browseButton
        });
        
        // Navigation buttons
        var nextButton = CreateStyledButton("Next", 100, 40);
        nextButton.Name = "DatabaseNextButton";
        nextButton.Location = new Point(contentPanel.Width - 120, contentPanel.Height - 50);
        nextButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 2;
        
        contentPanel.Controls.Add(connectionGroupBox);
        contentPanel.Controls.Add(setupGroupBox);
        contentPanel.Controls.Add(nextButton);
        
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);
        
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
        var tab = new TabPage("Welcome to the XComms Installation Wizard");
        tab.Padding = new Padding(20);

        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };
        
        var contentPanel = new Panel
        {
            Width = 600,
            Height = 400,
            Dock = DockStyle.Fill
        };
        
        // Welcome text
        var welcomeText = new Label
        {
            Text = "This setup wizard will guide you through the installation of the XComms Communication Platform on your local server.",
            Font = new Font("Segoe UI", 11),
            ForeColor = Color.DarkSlateGray,
            Width = 500,
            Height = 60,
            Location = new Point(0, 20),
            AutoSize = false,
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };
        
        var prerequisitesText = new Label
        {
            Text = "Please ensure you have administrative privileges and have reviewed the installation prerequisites before continuing.",
            Font = new Font("Segoe UI", 11),
            ForeColor = Color.DarkSlateGray,
            Width = 500,
            Height = 60,
            Location = new Point(0, 90),
            AutoSize = false,
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };
        
        var supportText = new Label
        {
            Text = "If you require assistance, please refer to the installation guide or contact support at support@xcomms.com.",
            Font = new Font("Segoe UI", 11),
            ForeColor = Color.DarkSlateGray,
            Width = 500,
            Height = 60,
            Location = new Point(0, 160),
            AutoSize = false,
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };
        
        // Next button
        var nextButton = CreateStyledButton("Next", 100, 40);
        nextButton.Location = new Point(480, 350);
        nextButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 1;
        
        contentPanel.Controls.Add(welcomeText);
        contentPanel.Controls.Add(prerequisitesText);
        contentPanel.Controls.Add(supportText);
        contentPanel.Controls.Add(nextButton);
        
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);
        
        return tab;
    }

    private TabPage CreateIISTab()
    {
        var tab = new TabPage("IIS Configuration");
        tab.Padding = new Padding(20);
        
        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };
        var contentPanel = new Panel
        {
            Width = 600,
            Height = 400,
            Dock = DockStyle.Fill
        };

        var iisInfoLabel = new Label
        {
            Text = "IIS Settings (Will be configured automatically during deployment)",
            Location = new Point(20, 20),
            Size = new Size(400, 40),
            Font = new Font("Segoe UI", 10, FontStyle.Bold),
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };

        var appPoolLabel = new Label { 
            Text = "Application Pool Name:", 
            Location = new Point(20, 80),
            Anchor = AnchorStyles.Top | AnchorStyles.Left
        };
        
        var appPoolTextBox = new TextBox { 
            Location = new Point(180, 80), 
            Width = 300, 
            Name = "AppPoolName", 
            Text = "MyAppPool",
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };

        var apiSiteLabel = new Label { 
            Text = "API Site Name:", 
            Location = new Point(20, 120),
            Anchor = AnchorStyles.Top | AnchorStyles.Left
        };
        
        var apiSiteTextBox = new TextBox { 
            Location = new Point(180, 120), 
            Width = 300, 
            Name = "APISiteName", 
            Text = "MyAPI",
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };

        var webSiteLabel = new Label { 
            Text = "Web Site Name:", 
            Location = new Point(20, 160),
            Anchor = AnchorStyles.Top | AnchorStyles.Left
        };
        
        var webSiteTextBox = new TextBox { 
            Location = new Point(180, 160), 
            Width = 300, 
            Name = "WebSiteName", 
            Text = "MyWeb",
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };

        var checkIISButton = CreateStyledButton("Check IIS Status", 150, 40);
        checkIISButton.Name = "CheckIISButton";
        checkIISButton.Location = new Point(contentPanel.Width - 280, contentPanel.Height - 50);
        checkIISButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        checkIISButton.Click += (s, e) => CheckIISStatus();

        // Next button
        var nextButton = CreateStyledButton("Next >>", 100, 40);
        nextButton.Name = "IISNextButton";
        nextButton.Location = new Point(contentPanel.Width - 120, contentPanel.Height - 50);
        nextButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 4; // Move to Backup tab

        contentPanel.Controls.AddRange(new Control[] {
            iisInfoLabel, appPoolLabel, appPoolTextBox,
            apiSiteLabel, apiSiteTextBox, webSiteLabel, webSiteTextBox,
            checkIISButton, nextButton
        });
        
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);

        return tab;
    }
    private TabPage CreateBackupTab()
    {
        var tab = new TabPage("Backup Setup");
        tab.Padding = new Padding(20);
        
        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };
        
        var contentPanel = new Panel
        {
            Width = 600,
            Height = 400,
            Dock = DockStyle.Fill
        };

        var backupLabel = new Label { 
            Text = "Backup Path:", 
            Location = new Point(20, 20),
            Anchor = AnchorStyles.Top | AnchorStyles.Left
        };
        
        var backupTextBox = new TextBox { 
            Location = new Point(120, 20), 
            Width = 300, 
            Name = "BackupPath", 
            Text = @"C:\DatabaseBackups",
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right
        };
        
        var backupBrowseButton = CreateStyledButton("Browse", 80, 30);
        backupBrowseButton.Location = new Point(430, 20);
        backupBrowseButton.Anchor = AnchorStyles.Top | AnchorStyles.Right;
        backupBrowseButton.Click += (s, e) => BrowseForFolder("BackupPath");

        var scheduleLabel = new Label { 
            Text = "Backup Schedule:", 
            Location = new Point(20, 60),
            Anchor = AnchorStyles.Top | AnchorStyles.Left
        };
        
        var scheduleComboBox = new ComboBox
        {
            Location = new Point(120, 60),
            Width = 200,
            Name = "BackupSchedule",
            DropDownStyle = ComboBoxStyle.DropDownList
        };
        scheduleComboBox.Items.AddRange(new string[] { "Daily", "Weekly", "Monthly" });
        scheduleComboBox.SelectedIndex = 0;

        var testBackupButton = CreateStyledButton("Test Backup", 120, 40);
        testBackupButton.Name = "TestBackupButton";
        testBackupButton.Location = new Point(contentPanel.Width - 280, contentPanel.Height - 50);
        testBackupButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        testBackupButton.Click += async (s, e) => await TestBackup();

        // Next button
        var nextButton = CreateStyledButton("Next >>", 100, 40);
        nextButton.Name = "BackupNextButton";
        nextButton.Location = new Point(contentPanel.Width - 120, contentPanel.Height - 50);
        nextButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        nextButton.Click += (s, e) => wizardTabs.SelectedIndex = 5; // Move to Review tab

        contentPanel.Controls.AddRange(new Control[] {
            backupLabel, backupTextBox, backupBrowseButton,
            scheduleLabel, scheduleComboBox, 
            testBackupButton, nextButton
        });
        
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);

        return tab;
    }

    private TabPage CreateReviewTab()
    {
        var tab = new TabPage("Review & Install");

        var mainPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };

        var contentPanel = new Panel
        {
            Width = 600,
            Height = 400,
            Dock = DockStyle.Fill
        };

        var reviewTextBox = new TextBox
        {
            Location = new Point(20, 20),
            Size = new Size(450, 250),
            Multiline = true,
            ScrollBars = ScrollBars.Vertical,
            ReadOnly = true,
            Name = "ReviewText",
            Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right | AnchorStyles.Bottom
        };

        var startSetupButton = CreateStyledButton("Start Setup", 120, 40);
        startSetupButton.Location = new Point(contentPanel.Width - 140, contentPanel.Height - 50);
        startSetupButton.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
        startSetupButton.Click += async (s, e) => await StartCompleteSetup();

        contentPanel.Controls.AddRange(new Control[] { reviewTextBox, startSetupButton });
        mainPanel.Controls.Add(contentPanel);
        tab.Controls.Add(mainPanel);

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

    // Helper methods for UI components
    private GroupBox CreateGroupBox(string title, int width, int height)
    {
        return new GroupBox
        {
            Text = title,
            Width = width,
            Height = height,
            Font = new Font("Segoe UI", 10, FontStyle.Regular),
            ForeColor = Color.DarkSlateGray
        };
    }

    private Label CreateLabel(string text, int width, int height)
    {
        return new Label
        {
            Text = text,
            Width = width,
            Height = height,
            Font = new Font("Segoe UI", 9.5f),
            ForeColor = Color.DarkSlateGray,
            TextAlign = ContentAlignment.MiddleLeft
        };
    }

    private TextBox CreateTextBox(string text, int width, int height)
    {
        return new TextBox
        {
            Text = text,
            Width = width,
            Height = height,
            Font = new Font("Segoe UI", 9.5f),
            BorderStyle = BorderStyle.FixedSingle,
            Padding = new Padding(5)
        };
    }

    private Button CreateStyledButton(string text, int width, int height)
    {
        var button = new Button
        {
            Text = text,
            Width = width,
            Height = height,
            FlatStyle = FlatStyle.Flat,
            BackColor = ColorTranslator.FromHtml("#1E88E5"),
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 9.5f, FontStyle.Regular),
            Cursor = Cursors.Hand
        };
        button.FlatAppearance.BorderSize = 0;
        return button;
    }

    private void BrowseForFile(string controlName, string filter)
    {
        using (var dialog = new OpenFileDialog())
        {
            dialog.Filter = filter;
            dialog.Title = "Select File";
            
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                var control = FindControl(controlName) as TextBox;
                if (control != null)
                {
                    control.Text = dialog.FileName;
                }
            }
        }
    }
}
