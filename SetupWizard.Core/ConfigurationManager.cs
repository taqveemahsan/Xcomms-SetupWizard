using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SetupWizard.Core
{
    // SetupWizard.Core/ConfigurationManager.cs
    public class ConfigurationManager
    {
        public class SetupConfig
        {
            public DatabaseConfig Database { get; set; }
            public IISConfig IIS { get; set; }
            public BackupConfig Backup { get; set; }
        }

        public class DatabaseConfig
        {
            public string ServerName { get; set; }
            public string DatabaseName { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string BackupPath { get; set; }
            public string ScriptPath { get; set; }
        }

        public class IISConfig
        {
            public string APISourcePath { get; set; }  // Where pre-built API files are
            public string APIPath { get; set; }        // Where to deploy API
            public string WebSourcePath { get; set; }  // Where pre-built Web files are
            public string WebPath { get; set; }        // Where to deploy Web
            public int APIPort { get; set; }
            public int WebPort { get; set; }
            public string AppPoolName { get; set; }
        }

        public class BackupConfig
        {
            public string BackupPath { get; set; }
            public string Schedule { get; set; }
        }

        public void SaveConfiguration(SetupConfig config, string filePath)
        {
            string json = JsonConvert.SerializeObject(config, Formatting.Indented);
            File.WriteAllText(filePath, json);
        }

        public SetupConfig LoadConfiguration(string filePath)
        {
            if (File.Exists(filePath))
            {
                string json = File.ReadAllText(filePath);
                return JsonConvert.DeserializeObject<SetupConfig>(json);
            }
            return new SetupConfig();
        }
    }
}
