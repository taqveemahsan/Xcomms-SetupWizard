using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace SetupWizard.Core
{
    public class DeploymentManager
    {
        private readonly IISManager _iisManager;

        public DeploymentManager()
        {
            _iisManager = new IISManager();
        }

        /// <summary>
        /// Validate pre-built files for API or Web
        /// </summary>
        public bool ValidatePreBuiltFiles(string sourcePath, string applicationType)
        {
            try
            {
                if (!Directory.Exists(sourcePath))
                    return false;

                var files = Directory.GetFiles(sourcePath, "*", SearchOption.AllDirectories);

                if (applicationType.ToLower() == "api")
                {
                    // Check for API required files
                    bool hasDll = files.Any(f => f.EndsWith(".dll") && f.Contains("SetupWizard.API"));
                    bool hasConfig = files.Any(f => f.EndsWith("appsettings.json"));
                    bool hasWeb = files.Any(f => f.EndsWith("web.config"));

                    return hasDll && hasConfig;
                }
                else if (applicationType.ToLower() == "web")
                {
                    // Check for Web required files
                    bool hasDll = files.Any(f => f.EndsWith(".dll") && f.Contains("SetupWizard.Web"));
                    bool hasConfig = files.Any(f => f.EndsWith("appsettings.json"));
                    bool hasViews = Directory.Exists(Path.Combine(sourcePath, "Views"));

                    return hasDll && hasConfig && hasViews;
                }

                return false;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// Deploy pre-built API to IIS
        /// </summary>
        public bool DeployPreBuiltAPI(string sourcePath, string targetPath, int port, string appPoolName, string connectionString)
        {
            try
            {
                // Step 1: Create target directory
                if (Directory.Exists(targetPath))
                    Directory.Delete(targetPath, true);
                Directory.CreateDirectory(targetPath);

                // Step 2: Copy all files
                CopyDirectory(sourcePath, targetPath);

                // Step 3: Update connection string in appsettings.json
                UpdateAPIConnectionString(targetPath, connectionString);

                // Step 4: Create IIS site and app pool
                _iisManager.DeployAPI($"MyAPI_{port}", targetPath, port, appPoolName);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"API deployment failed: {ex.Message}");
            }
        }

        /// <summary>
        /// Deploy pre-built Web App to IIS  
        /// </summary>
        public bool DeployPreBuiltWeb(string sourcePath, string targetPath, int port, string appPoolName, string connectionString, string apiUrl)
        {
            try
            {
                // Step 1: Create target directory
                if (Directory.Exists(targetPath))
                    Directory.Delete(targetPath, true);
                Directory.CreateDirectory(targetPath);

                // Step 2: Copy all files
                CopyDirectory(sourcePath, targetPath);

                // Step 3: Update configuration
                UpdateWebConfiguration(targetPath, connectionString, apiUrl);

                // Step 4: Create IIS site and app pool
                _iisManager.DeployWebApp($"MyWeb_{port}", targetPath, port, appPoolName);

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Web deployment failed: {ex.Message}");
            }
        }

        /// <summary>
        /// Copy directory recursively
        /// </summary>
        private void CopyDirectory(string sourceDir, string targetDir)
        {
            Directory.CreateDirectory(targetDir);

            // Copy files
            foreach (string file in Directory.GetFiles(sourceDir))
            {
                string fileName = Path.GetFileName(file);
                string targetFile = Path.Combine(targetDir, fileName);
                File.Copy(file, targetFile, true);
            }

            // Copy subdirectories
            foreach (string directory in Directory.GetDirectories(sourceDir))
            {
                string dirName = Path.GetFileName(directory);
                string targetSubDir = Path.Combine(targetDir, dirName);
                CopyDirectory(directory, targetSubDir);
            }
        }

        /// <summary>
        /// Update API appsettings.json with new connection string
        /// </summary>
        private void UpdateAPIConnectionString(string deployPath, string connectionString)
        {
            string configPath = Path.Combine(deployPath, "appsettings.json");

            if (File.Exists(configPath))
            {
                string jsonContent = File.ReadAllText(configPath);
                var config = JsonSerializer.Deserialize<JsonElement>(jsonContent);

                var configDict = new Dictionary<string, object>();

                foreach (var property in config.EnumerateObject())
                {
                    if (property.Name == "ConnectionStrings")
                    {
                        configDict[property.Name] = new Dictionary<string, string>
                        {
                            ["DefaultConnection"] = connectionString
                        };
                    }
                    else
                    {
                        configDict[property.Name] = property.Value;
                    }
                }

                string updatedJson = JsonSerializer.Serialize(configDict, new JsonSerializerOptions
                {
                    WriteIndented = true
                });

                File.WriteAllText(configPath, updatedJson);
            }
        }

        /// <summary>
        /// Update Web appsettings.json with connection string and API URL
        /// </summary>
        private void UpdateWebConfiguration(string deployPath, string connectionString, string apiUrl)
        {
            string configPath = Path.Combine(deployPath, "appsettings.json");

            if (File.Exists(configPath))
            {
                string jsonContent = File.ReadAllText(configPath);
                var config = JsonSerializer.Deserialize<JsonElement>(jsonContent);

                var configDict = new Dictionary<string, object>();

                foreach (var property in config.EnumerateObject())
                {
                    if (property.Name == "ConnectionStrings")
                    {
                        configDict[property.Name] = new Dictionary<string, string>
                        {
                            ["DefaultConnection"] = connectionString
                        };
                    }
                    else if (property.Name == "ApiBaseUrl")
                    {
                        configDict[property.Name] = apiUrl;
                    }
                    else
                    {
                        configDict[property.Name] = property.Value;
                    }
                }

                // Add ApiBaseUrl if not exists
                if (!configDict.ContainsKey("ApiBaseUrl"))
                {
                    configDict["ApiBaseUrl"] = apiUrl;
                }

                string updatedJson = JsonSerializer.Serialize(configDict, new JsonSerializerOptions
                {
                    WriteIndented = true
                });

                File.WriteAllText(configPath, updatedJson);
            }
        }

        /// <summary>
        /// Verify deployment by checking if sites are accessible
        /// </summary>
        public async Task<bool> VerifyDeployment(string apiUrl, string webUrl)
        {
            try
            {
                using var httpClient = new HttpClient();
                httpClient.Timeout = TimeSpan.FromSeconds(30);

                // Test API
                var apiResponse = await httpClient.GetAsync($"{apiUrl}/api/users");
                if (!apiResponse.IsSuccessStatusCode)
                    return false;

                // Test Web
                var webResponse = await httpClient.GetAsync(webUrl);
                if (!webResponse.IsSuccessStatusCode)
                    return false;

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
