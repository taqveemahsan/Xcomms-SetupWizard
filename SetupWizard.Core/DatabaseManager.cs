using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SetupWizard.Core
{
    // SetupWizard.Core/DatabaseManager.cs
    public class DatabaseManager
    {
        public async Task<bool> CreateDatabase(string serverName, string databaseName, string username, string password)
        {
            try
            {
                string masterConnectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;";

                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                // Check if database exists
                string checkDbQuery = $"SELECT COUNT(*) FROM sys.databases WHERE name = '{databaseName}'";
                using var checkCmd = new SqlCommand(checkDbQuery, connection);
                int dbExists = (int)await checkCmd.ExecuteScalarAsync();

                if (dbExists == 0)
                {
                    // Create database
                    string createDbQuery = $"CREATE DATABASE [{databaseName}]";
                    using var createCmd = new SqlCommand(createDbQuery, connection);
                    await createCmd.ExecuteNonQueryAsync();
                }

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database creation failed: {ex.Message}");
            }
        }

        public async Task<bool> ExecuteScripts(string connectionString, string[] scriptPaths)
        {
            try
            {
                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                foreach (string scriptPath in scriptPaths)
                {
                    string script = await File.ReadAllTextAsync(scriptPath);
                    string[] batches = script.Split(new string[] { "GO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (string batch in batches)
                    {
                        if (!string.IsNullOrWhiteSpace(batch))
                        {
                            using var cmd = new SqlCommand(batch.Trim(), connection);
                            await cmd.ExecuteNonQueryAsync();
                        }
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Script execution failed: {ex.Message}");
            }
        }

        public async Task<bool> SetupBackup(string connectionString, string databaseName, string backupPath)
        {
            try
            {
                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                // Create backup job
                string backupQuery = $@"
                BACKUP DATABASE [{databaseName}] 
                TO DISK = '{backupPath}\{databaseName}_$(Date).bak'
                WITH FORMAT, INIT";

                using var cmd = new SqlCommand(backupQuery, connection);
                await cmd.ExecuteNonQueryAsync();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Backup setup failed: {ex.Message}");
            }
        }

        public bool RestoreDatabase(string connectionString, string backupPath, string databaseName)
        {
            try
            {
                string restoreQuery = $@"
                USE master;
                
                -- Close existing connections
                ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                
                -- Restore database
                RESTORE DATABASE [{databaseName}] 
                FROM DISK = '{backupPath}'
                WITH REPLACE;
                
                -- Set back to multi-user
                ALTER DATABASE [{databaseName}] SET MULTI_USER;
            ";

                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (var command = new SqlCommand(restoreQuery, connection))
                    {
                        command.ExecuteNonQuery();
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                //MessageBox.Show($"Database restore failed: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> RestoreDatabase(string serverName, string username, string password, string databaseName, string backupPath)
        {
            try
            {
                string masterConnectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;";

                string restoreQuery = $@"
            -- Close existing connections if database exists
            IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
            BEGIN
                ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                DROP DATABASE [{databaseName}];
            END

            -- Restore database
            RESTORE DATABASE [{databaseName}] 
            FROM DISK = '{backupPath}'
            WITH REPLACE;
        ";

                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                using var command = new SqlCommand(restoreQuery, connection);
                command.CommandTimeout = 300; // 5 minutes timeout
                await command.ExecuteNonQueryAsync();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database restore failed: {ex.Message}");
            }
        }

        //public async Task<bool> RestoreDatabase(string serverName, string username, string password, string databaseName, string backupPath)
        //{
        //    try
        //    {
        //        // Updated connection string with SSL trust settings
        //        string masterConnectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;";

        //        string restoreQuery = $@"
        //    -- Close existing connections if database exists
        //    IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
        //    BEGIN
        //        ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        //        DROP DATABASE [{databaseName}];
        //    END

        //    -- Restore database
        //    RESTORE DATABASE [{databaseName}] 
        //    FROM DISK = '{backupPath}'
        //    WITH REPLACE, MOVE '{GetLogicalName(backupPath, "D")}' TO '{GetDefaultDataPath()}\{databaseName}.mdf',
        //    MOVE '{GetLogicalName(backupPath, "L")}' TO '{GetDefaultDataPath()}\{databaseName}_Log.ldf';
        //";

        //        using var connection = new SqlConnection(masterConnectionString);
        //        await connection.OpenAsync();

        //        using var command = new SqlCommand(restoreQuery, connection);
        //        command.CommandTimeout = 300; // 5 minutes timeout
        //        await command.ExecuteNonQueryAsync();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception($"Database restore failed: {ex.Message}");
        //    }
        //}

        //// Test Connection method bhi update karein
        //public async Task<bool> TestConnection(string serverName, string username, string password)
        //{
        //    try
        //    {
        //        // Updated connection string for test
        //        string connectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;Connection Timeout=10;";

        //        using var connection = new SqlConnection(connectionString);
        //        await connection.OpenAsync();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception($"Connection test failed: {ex.Message}");
        //    }
        //}

        //// Helper method to get logical names from backup
        //private string GetLogicalName(string backupPath, string fileType)
        //{
        //    try
        //    {
        //        string connectionString = $"Server={GetControlValue("ServerName")};Database=master;User Id={GetControlValue("Username")};Password={GetControlValue("Password")};TrustServerCertificate=true;Encrypt=false;";

        //        using var connection = new SqlConnection(connectionString);
        //        connection.Open();

        //        string query = $@"
        //    RESTORE FILELISTONLY 
        //    FROM DISK = '{backupPath}'
        //";

        //        using var command = new SqlCommand(query, connection);
        //        using var reader = command.ExecuteReader();

        //        while (reader.Read())
        //        {
        //            string type = reader["Type"].ToString();
        //            if ((fileType == "D" && type == "D") || (fileType == "L" && type == "L"))
        //            {
        //                return reader["LogicalName"].ToString();
        //            }
        //        }

        //        // Default names if not found
        //        return fileType == "D" ? "MyAppDB" : "MyAppDB_Log";
        //    }
        //    catch
        //    {
        //        // Fallback to default names
        //        return fileType == "D" ? "MyAppDB" : "MyAppDB_Log";
        //    }
        //}

        //// Get default data path
        //private string GetDefaultDataPath()
        //{
        //    try
        //    {
        //        string connectionString = $"Server={GetControlValue("ServerName")};Database=master;User Id={GetControlValue("Username")};Password={GetControlValue("Password")};TrustServerCertificate=true;Encrypt=false;";

        //        using var connection = new SqlConnection(connectionString);
        //        connection.Open();

        //        string query = @"
        //    SELECT SUBSTRING(physical_name, 1, CHARINDEX(N'master.mdf', LOWER(physical_name)) - 1) DataPath
        //    FROM master.sys.master_files 
        //    WHERE database_id = 1 AND file_id = 1
        //";

        //        using var command = new SqlCommand(query, connection);
        //        var result = command.ExecuteScalar()?.ToString();

        //        return string.IsNullOrEmpty(result) ? @"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA" : result.TrimEnd('\\');
        //    }
        //    catch
        //    {
        //        // Default SQL Server data path
        //        return @"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA";
        //    }
        //}

        //// Alternative simple restore method (if above doesn't work)
        //public async Task<bool> SimpleRestoreDatabase(string serverName, string username, string password, string databaseName, string backupPath)
        //{
        //    try
        //    {
        //        string masterConnectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;";

        //        // Simple restore without MOVE clause
        //        string restoreQuery = $@"
        //    -- Drop database if exists
        //    IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
        //    BEGIN
        //        ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        //        DROP DATABASE [{databaseName}];
        //    END

        //    -- Simple restore
        //    RESTORE DATABASE [{databaseName}] 
        //    FROM DISK = '{backupPath}'
        //    WITH REPLACE;
        //";

        //        using var connection = new SqlConnection(masterConnectionString);
        //        await connection.OpenAsync();

        //        using var command = new SqlCommand(restoreQuery, connection);
        //        command.CommandTimeout = 300;
        //        await command.ExecuteNonQueryAsync();

        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception($"Database restore failed: {ex.Message}");
        //    }
        //}
    }
}
