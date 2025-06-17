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
        this.components = new System.ComponentModel.Container();

        this.mainPanel = new System.Windows.Forms.Panel();
        this.sidebarPanel = new System.Windows.Forms.Panel();
        this.logoPanel = new System.Windows.Forms.Panel();
        this.logoPictureBox = new System.Windows.Forms.PictureBox();
        this.navPanel = new System.Windows.Forms.Panel();
        this.contentPanel = new System.Windows.Forms.Panel();
        this.headerPanel = new System.Windows.Forms.Panel();
        this.headerLabel = new System.Windows.Forms.Label();
        this.wizardTabs = new System.Windows.Forms.TabControl();

        // mainPanel
        this.mainPanel.Dock = System.Windows.Forms.DockStyle.Fill;
        this.Controls.Add(this.mainPanel);

        // sidebarPanel
        this.sidebarPanel.Width = 250;
        this.sidebarPanel.Dock = System.Windows.Forms.DockStyle.Left;
        this.sidebarPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#1E88E5");

        // logoPanel
        this.logoPanel.Height = 80;
        this.logoPanel.Dock = System.Windows.Forms.DockStyle.Top;
        this.logoPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#1E88E5");

        // logoPictureBox
        this.logoPictureBox.Size = new System.Drawing.Size(60, 60);
        this.logoPictureBox.Location = new System.Drawing.Point(10, 10);
        this.logoPictureBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
        this.logoPanel.Controls.Add(this.logoPictureBox);

        // navPanel
        this.navPanel.Dock = System.Windows.Forms.DockStyle.Fill;
        this.navPanel.BackColor = System.Drawing.ColorTranslator.FromHtml("#1E88E5");
        this.navPanel.AutoScroll = true;

        this.sidebarPanel.Controls.Add(this.navPanel);
        this.sidebarPanel.Controls.Add(this.logoPanel);

        // contentPanel
        this.contentPanel.Dock = System.Windows.Forms.DockStyle.Fill;
        this.contentPanel.BackColor = System.Drawing.Color.White;
        this.contentPanel.Padding = new System.Windows.Forms.Padding(20);

        // Order of adding controls matters for Dock layout
        this.mainPanel.Controls.Add(this.contentPanel);
        this.mainPanel.Controls.Add(this.sidebarPanel);

        // headerPanel
        this.headerPanel.Height = 60;
        this.headerPanel.Dock = System.Windows.Forms.DockStyle.Top;

        // headerLabel
        this.headerLabel.Text = "Welcome to the XComms Installation Wizard";
        this.headerLabel.Font = new System.Drawing.Font("Segoe UI Semibold", 16F);
        this.headerLabel.ForeColor = System.Drawing.Color.DarkSlateGray;
        this.headerLabel.AutoSize = true;
        this.headerLabel.Location = new System.Drawing.Point(10, 15);
        this.headerPanel.Controls.Add(this.headerLabel);

        // wizardTabs
        this.wizardTabs.Dock = System.Windows.Forms.DockStyle.Fill;
        this.wizardTabs.Appearance = System.Windows.Forms.TabAppearance.FlatButtons;
        this.wizardTabs.ItemSize = new System.Drawing.Size(0, 1);
        this.wizardTabs.SizeMode = System.Windows.Forms.TabSizeMode.Fixed;
        this.wizardTabs.Margin = new System.Windows.Forms.Padding(0);
        this.wizardTabs.Padding = new System.Drawing.Point(0, 0);

        this.contentPanel.Controls.Add(this.wizardTabs);

        // separator
        System.Windows.Forms.Panel separatorPanel = new System.Windows.Forms.Panel();
        separatorPanel.Height = 1;
        separatorPanel.Dock = System.Windows.Forms.DockStyle.Top;
        separatorPanel.BackColor = System.Drawing.Color.LightGray;
        this.contentPanel.Controls.Add(separatorPanel);

        this.contentPanel.Controls.Add(this.headerPanel);

        // Form settings
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(1100, 700);
        this.Text = "XComms Installation Wizard";
    }

    #endregion
}
