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

                // Create Application Pool
                var appPool = serverManager.ApplicationPools.Add(appPoolName);
                appPool.ManagedRuntimeVersion = "v4.0";
                appPool.ProcessModel.IdentityType = ProcessModelIdentityType.ApplicationPoolIdentity;

                // Create Site
                var site = serverManager.Sites.Add(siteName, physicalPath, port);
                site.Applications[0].ApplicationPoolName = appPoolName;

                serverManager.CommitChanges();
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

                // Similar to API deployment but for web app
                var appPool = serverManager.ApplicationPools.Add(appPoolName + "_Web");
                appPool.ManagedRuntimeVersion = "v4.0";

                var site = serverManager.Sites.Add(siteName + "_Web", physicalPath, port);
                site.Applications[0].ApplicationPoolName = appPoolName + "_Web";

                serverManager.CommitChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Web app deployment failed: {ex.Message}");
            }
        }
    }
}
