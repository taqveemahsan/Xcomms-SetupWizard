using Microsoft.Web.Administration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SetupWizard.Core
{
    // SetupWizard.Core/IISManager.cs
    public class IISManager
    {
        public bool DeployAPI(string siteName, string physicalPath, int port, string appPoolName)
        {
            try
            {
                using var serverManager = new ServerManager();

                // Check if app pool already exists
                var existingAppPool = serverManager.ApplicationPools[appPoolName];
                if (existingAppPool != null)
                {
                    // Generate a unique name by adding timestamp
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                    appPoolName = $"{appPoolName}_{timestamp}";
                }

                // Check if site already exists
                var existingSite = serverManager.Sites[siteName];
                if (existingSite != null)
                {
                    // Generate a unique name by adding timestamp
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                    siteName = $"{siteName}_{timestamp}";
                }

                // Create Application Pool
                var appPool = serverManager.ApplicationPools.Add(appPoolName);
                appPool.ManagedRuntimeVersion = "v4.0";
                appPool.ProcessModel.IdentityType = ProcessModelIdentityType.ApplicationPoolIdentity;

                // Check if port is already in use
                bool portInUse = serverManager.Sites
                    .SelectMany(site => site.Bindings)
                    .Any(binding => binding.EndPoint?.Port == port);

                if (portInUse)
                {
                    // Find next available port
                    while (serverManager.Sites
                        .SelectMany(site => site.Bindings)
                        .Any(binding => binding.EndPoint?.Port == port))
                    {
                        port++;
                    }
                }

                // Create Site
                var site = serverManager.Sites.Add(siteName, physicalPath, port);
                site.Applications[0].ApplicationPoolName = appPoolName;

                serverManager.CommitChanges();
                
                // Return the actual site name and port used (might be different from requested)
                Console.WriteLine($"API deployed as: {siteName} on port {port} with app pool {appPoolName}");
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"IIS deployment failed: {ex.Message}");
            }
        }

        public bool DeployWebApp(string siteName, string physicalPath, int port, string appPoolName)
        {
            try
            {
                using var serverManager = new ServerManager();

                // Ensure unique app pool name
                string webAppPoolName = appPoolName + "_Web";
                var existingAppPool = serverManager.ApplicationPools[webAppPoolName];
                if (existingAppPool != null)
                {
                    // Generate a unique name by adding timestamp
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                    webAppPoolName = $"{webAppPoolName}_{timestamp}";
                }

                // Ensure unique site name
                string webSiteName = siteName + "_Web";
                var existingSite = serverManager.Sites[webSiteName];
                if (existingSite != null)
                {
                    // Generate a unique name by adding timestamp
                    string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                    webSiteName = $"{webSiteName}_{timestamp}";
                }

                // Check if port is already in use
                bool portInUse = serverManager.Sites
                    .SelectMany(site => site.Bindings)
                    .Any(binding => binding.EndPoint?.Port == port);

                if (portInUse)
                {
                    // Find next available port
                    while (serverManager.Sites
                        .SelectMany(site => site.Bindings)
                        .Any(binding => binding.EndPoint?.Port == port))
                    {
                        port++;
                    }
                }

                // Create Application Pool
                var appPool = serverManager.ApplicationPools.Add(webAppPoolName);
                appPool.ManagedRuntimeVersion = "v4.0";
                appPool.ProcessModel.IdentityType = ProcessModelIdentityType.ApplicationPoolIdentity;

                // Create Site
                var site = serverManager.Sites.Add(webSiteName, physicalPath, port);
                site.Applications[0].ApplicationPoolName = webAppPoolName;

                serverManager.CommitChanges();
                
                // Return the actual site name and port used (might be different from requested)
                Console.WriteLine($"Web app deployed as: {webSiteName} on port {port} with app pool {webAppPoolName}");
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Web app deployment failed: {ex.Message}");
            }
        }
    }
}
