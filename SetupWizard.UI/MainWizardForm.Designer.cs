namespace SetupWizard.UI;

partial class MainWizardForm
{
    /// <summary>
    ///  Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    private System.Windows.Forms.Panel mainPanel;
    private System.Windows.Forms.Panel sidebarPanel;
    private System.Windows.Forms.Panel logoPanel;
    private System.Windows.Forms.PictureBox logoPictureBox;
    private System.Windows.Forms.Panel navPanel;
    private System.Windows.Forms.Panel contentPanel;
    private System.Windows.Forms.Panel headerPanel;
    private System.Windows.Forms.Label headerLabel;
    private System.Windows.Forms.TabControl wizardTabs;

    /// <summary>
    ///  Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    ///  Required method for Designer support - do not modify
    ///  the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        mainPanel = new Panel();
        contentPanel = new Panel();
        wizardTabs = new TabControl();
        separatorPanel = new Panel();
        headerPanel = new Panel();
        headerLabel = new Label();
        sidebarPanel = new Panel();
        navPanel = new Panel();
        logoPanel = new Panel();
        logoPictureBox = new PictureBox();
        mainPanel.SuspendLayout();
        contentPanel.SuspendLayout();
        headerPanel.SuspendLayout();
        sidebarPanel.SuspendLayout();
        logoPanel.SuspendLayout();
        ((System.ComponentModel.ISupportInitialize)logoPictureBox).BeginInit();
        SuspendLayout();
        // 
        // mainPanel
        // 
        mainPanel.Controls.Add(contentPanel);
        mainPanel.Controls.Add(sidebarPanel);
        mainPanel.Dock = DockStyle.Fill;
        mainPanel.Location = new Point(0, 0);
        mainPanel.Name = "mainPanel";
        mainPanel.Size = new Size(1100, 700);
        mainPanel.TabIndex = 0;
        // 
        // contentPanel
        // 
        contentPanel.BackColor = Color.White;
        contentPanel.Controls.Add(wizardTabs);
        contentPanel.Controls.Add(separatorPanel);
        contentPanel.Controls.Add(headerPanel);
        contentPanel.Dock = DockStyle.Fill;
        contentPanel.Location = new Point(250, 0);
        contentPanel.Name = "contentPanel";
        contentPanel.Padding = new Padding(20);
        contentPanel.Size = new Size(850, 700);
        contentPanel.TabIndex = 0;
        // 
        // wizardTabs
        // 
        wizardTabs.Appearance = TabAppearance.FlatButtons;
        wizardTabs.Dock = DockStyle.Fill;
        wizardTabs.ItemSize = new Size(0, 1);
        wizardTabs.Location = new Point(20, 81);
        wizardTabs.Margin = new Padding(0);
        wizardTabs.Name = "wizardTabs";
        wizardTabs.Padding = new Point(0, 0);
        wizardTabs.SelectedIndex = 0;
        wizardTabs.Size = new Size(810, 599);
        wizardTabs.SizeMode = TabSizeMode.Fixed;
        wizardTabs.TabIndex = 0;
        // 
        // separatorPanel
        // 
        separatorPanel.BackColor = Color.LightGray;
        separatorPanel.Dock = DockStyle.Top;
        separatorPanel.Location = new Point(20, 80);
        separatorPanel.Name = "separatorPanel";
        separatorPanel.Size = new Size(810, 1);
        separatorPanel.TabIndex = 1;
        // 
        // headerPanel
        // 
        headerPanel.Controls.Add(headerLabel);
        headerPanel.Dock = DockStyle.Top;
        headerPanel.Location = new Point(20, 20);
        headerPanel.Name = "headerPanel";
        headerPanel.Size = new Size(810, 60);
        headerPanel.TabIndex = 2;
        // 
        // headerLabel
        // 
        headerLabel.AutoSize = true;
        headerLabel.Font = new Font("Segoe UI Semibold", 16F);
        headerLabel.ForeColor = Color.DarkSlateGray;
        headerLabel.Location = new Point(10, 15);
        headerLabel.Name = "headerLabel";
        headerLabel.Size = new Size(564, 37);
        headerLabel.TabIndex = 0;
        headerLabel.Text = "Welcome to the XComms Installation Wizard";
        // 
        // sidebarPanel
        // 
        sidebarPanel.BackColor = Color.FromArgb(30, 136, 229);
        sidebarPanel.Controls.Add(navPanel);
        sidebarPanel.Controls.Add(logoPanel);
        sidebarPanel.Dock = DockStyle.Left;
        sidebarPanel.Location = new Point(0, 0);
        sidebarPanel.Name = "sidebarPanel";
        sidebarPanel.Size = new Size(250, 700);
        sidebarPanel.TabIndex = 1;
        // 
        // navPanel
        // 
        navPanel.AutoScroll = true;
        navPanel.BackColor = Color.FromArgb(30, 136, 229);
        navPanel.Dock = DockStyle.Fill;
        navPanel.Location = new Point(0, 100);
        navPanel.Name = "navPanel";
        navPanel.Size = new Size(250, 600);
        navPanel.TabIndex = 0;
        // 
        // logoPanel
        // 
        logoPanel.BackColor = Color.FromArgb(30, 136, 229);
        logoPanel.Controls.Add(logoPictureBox);
        logoPanel.Dock = DockStyle.Top;
        logoPanel.Location = new Point(0, 0);
        logoPanel.Name = "logoPanel";
        logoPanel.Size = new Size(250, 100);
        logoPanel.TabIndex = 1;
        // 
        // logoPictureBox
        // 
        logoPictureBox.Location = new Point(3, 12);
        logoPictureBox.Name = "logoPictureBox";
        logoPictureBox.Size = new Size(244, 78);
        logoPictureBox.SizeMode = PictureBoxSizeMode.Zoom;
        logoPictureBox.TabIndex = 0;
        logoPictureBox.TabStop = false;
        // 
        // MainWizardForm
        // 
        AutoScaleDimensions = new SizeF(8F, 20F);
        AutoScaleMode = AutoScaleMode.Font;
        ClientSize = new Size(1100, 700);
        Controls.Add(mainPanel);
        Name = "MainWizardForm";
        Text = "XComms Installation Wizard";
        mainPanel.ResumeLayout(false);
        contentPanel.ResumeLayout(false);
        headerPanel.ResumeLayout(false);
        headerPanel.PerformLayout();
        sidebarPanel.ResumeLayout(false);
        logoPanel.ResumeLayout(false);
        ((System.ComponentModel.ISupportInitialize)logoPictureBox).EndInit();
        ResumeLayout(false);
    }

    #endregion

    private Panel separatorPanel;
}
