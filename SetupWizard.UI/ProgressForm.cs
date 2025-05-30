using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SetupWizard.UI
{
    // SetupWizard.UI/ProgressForm.cs
    public partial class ProgressForm : Form
    {
        private ProgressBar progressBar;
        private Label statusLabel;

        public ProgressForm()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            this.Size = new Size(400, 150);
            this.Text = "Setup Progress";
            this.StartPosition = FormStartPosition.CenterParent;
            this.FormBorderStyle = FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;

            // Progress Bar
            progressBar = new ProgressBar();
            progressBar.Location = new Point(20, 40);
            progressBar.Size = new Size(350, 30);
            progressBar.Style = ProgressBarStyle.Continuous;

            // Status Label
            statusLabel = new Label();
            statusLabel.Location = new Point(20, 80);
            statusLabel.Size = new Size(350, 20);
            statusLabel.Text = "Initializing...";

            this.Controls.Add(progressBar);
            this.Controls.Add(statusLabel);
        }

        public void UpdateProgress(int percentage, string message)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<int, string>(UpdateProgress), percentage, message);
                return;
            }

            progressBar.Value = Math.Min(100, Math.Max(0, percentage));
            statusLabel.Text = message;

            Application.DoEvents();
        }
    }
}
