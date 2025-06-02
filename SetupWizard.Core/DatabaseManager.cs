using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SetupWizard.Core
{
    public class DatabaseManager
    {
        public async Task<bool> RestoreDatabaseFromLocalFile(string serverName, string username, string password, string databaseName, string localBackupPath)
        {
            try
            {
                if (!File.Exists(localBackupPath))
                    throw new FileNotFoundException($"Backup file not found: {localBackupPath}");

                string masterConnectionString = $"data source={serverName};initial catalog=master;user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=120;";

                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                // Get SQL Server's data path
                string dataPath = await GetDefaultDataPath(connection);

                // Copy backup file to SQL Server's data directory
                string fileName = Path.GetFileName(localBackupPath);
                string serverBackupPath = Path.Combine(dataPath, fileName);

                // Create directory if it doesn't exist
                Directory.CreateDirectory(Path.GetDirectoryName(serverBackupPath));

                Console.WriteLine($"Copying from {localBackupPath} to {serverBackupPath}");

                // Copy the file to server-accessible location
                File.Copy(localBackupPath, serverBackupPath, true);
                Console.WriteLine("File copied successfully");

                // Restore using the server path
                string restoreQuery = $@"
                    -- Close existing connections if database exists
                    IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
                    BEGIN
                        ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                        DROP DATABASE [{databaseName}];
                    END

                    -- Restore database
                    RESTORE DATABASE [{databaseName}] 
                    FROM DISK = '{serverBackupPath}'
                    WITH REPLACE;
                ";

                using var restoreCmd = new SqlCommand(restoreQuery, connection);
                restoreCmd.CommandTimeout = 300; // 5 minutes timeout
                await restoreCmd.ExecuteNonQueryAsync();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database restore failed: {ex.Message}", ex);
            }
        }

        // ALTERNATIVE SOLUTION: Create database from script instead of backup
        public async Task<bool> CreateDatabaseFromScript(string serverName, string username, string password, string databaseName, string[] sqlScriptPaths)
        {
            try
            {
                string masterConnectionString = $"data source={serverName};initial catalog=master;user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=30;";

                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                // Create empty database first
                await CreateEmptyDatabase(connection, databaseName);

                // Switch to new database
                string dbConnectionString = $"data source={serverName};initial catalog={databaseName};user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=30;";

                using var dbConnection = new SqlConnection(dbConnectionString);
                await dbConnection.OpenAsync();

                // Execute all scripts
                foreach (string scriptPath in sqlScriptPaths)
                {
                    if (File.Exists(scriptPath))
                    {
                        string script = await File.ReadAllTextAsync(scriptPath);
                        script = PreprocessSqlScript(script);
                        await ExecuteScript(dbConnection, script);
                    }
                    else
                    {
                        Console.WriteLine($"Script file not found: {scriptPath}");
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database creation from script failed: {ex.Message}", ex);
            }
        }

        private async Task CreateEmptyDatabase(SqlConnection connection, string databaseName)
        {
            string createDbQuery = $@"
                IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
                BEGIN
                    CREATE DATABASE [{databaseName}]
                END";

            using var cmd = new SqlCommand(createDbQuery, connection);
            await cmd.ExecuteNonQueryAsync();
        }

        private async Task ExecuteScript(SqlConnection connection, string script)
        {
            try
            {
                // First, handle any table variable declarations separately
                if (script.Contains("@AlertInfo"))
                {
                    try {
                        string declareAlertInfo = "IF OBJECT_ID('tempdb..#AlertInfo') IS NOT NULL DROP TABLE #AlertInfo; CREATE TABLE #AlertInfo (ID INT, AlertName NVARCHAR(100), AlertMessage NVARCHAR(MAX));";
                        using var cmd = new SqlCommand(declareAlertInfo, connection);
                        await cmd.ExecuteNonQueryAsync();
                        
                        // Replace table variables with temp tables
                        script = script.Replace("@AlertInfo", "#AlertInfo");
                    }
                    catch (Exception ex) {
                        Console.WriteLine($"Error creating temp table: {ex.Message}");
                    }
                }
                
                // Handle other common table variables
                if (script.Contains("@TempTable"))
                {
                    try {
                        string declareTempTable = "IF OBJECT_ID('tempdb..#TempTable') IS NOT NULL DROP TABLE #TempTable; CREATE TABLE #TempTable (ID INT);";
                        using var cmd = new SqlCommand(declareTempTable, connection);
                        await cmd.ExecuteNonQueryAsync();
                        
                        // Replace table variables with temp tables
                        script = script.Replace("@TempTable", "#TempTable");
                    }
                    catch (Exception ex) {
                        Console.WriteLine($"Error creating temp table: {ex.Message}");
                    }
                }
                
                // Handle scalar variables
                if (script.Contains("@Message"))
                {
                    try {
                        string declareMessage = "DECLARE @Message NVARCHAR(MAX);";
                        using var cmd = new SqlCommand(declareMessage, connection);
                        await cmd.ExecuteNonQueryAsync();
                    }
                    catch (Exception ex) {
                        Console.WriteLine($"Error declaring variable: {ex.Message}");
                    }
                }

                // Split the script by GO statements
                string[] batches = script.Split(
                    new string[] { "\nGO\n", "\nGO\r\n", "\r\nGO\r\n", "\r\nGO\n", "\nGO", "\r\nGO", "GO\r\n", "GO\n", "GO" },
                    StringSplitOptions.RemoveEmptyEntries);
                
                // Process each batch
                foreach (string batch in batches)
                {
                    string cleanBatch = batch.Trim();
                    if (string.IsNullOrWhiteSpace(cleanBatch))
                        continue;
                    
                    // Check if this batch contains a CREATE/ALTER PROCEDURE
                    bool isProcedure = System.Text.RegularExpressions.Regex.IsMatch(cleanBatch, 
                        @"^\s*(CREATE|ALTER)\s+(PROC|PROCEDURE)", 
                        System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                    
                    if (isProcedure)
                    {
                        // Make sure there's nothing before the CREATE/ALTER PROCEDURE
                        var match = System.Text.RegularExpressions.Regex.Match(cleanBatch, 
                            @"^\s*(CREATE|ALTER)\s+(PROC|PROCEDURE)", 
                            System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                        
                        if (match.Index > 0)
                        {
                            // There's something before the procedure definition
                            string beforeProc = cleanBatch.Substring(0, match.Index).Trim();
                            string procDef = cleanBatch.Substring(match.Index).Trim();
                            
                            // Execute the part before the procedure separately
                            if (!string.IsNullOrWhiteSpace(beforeProc))
                            {
                                try
                                {
                                    using var cmd = new SqlCommand(beforeProc, connection);
                                    await cmd.ExecuteNonQueryAsync();
                                }
                                catch (Exception ex)
                                {
                                    Console.WriteLine($"Error executing batch before procedure: {ex.Message}");
                                }
                            }
                            
                            // Then execute the procedure definition
                            try
                            {
                                using var cmd = new SqlCommand(procDef, connection);
                                cmd.CommandTimeout = 300;
                                await cmd.ExecuteNonQueryAsync();
                            }
                            catch (Exception ex)
                            {
                                throw new Exception($"Error executing procedure definition: {ex.Message}\n\nProcedure: {procDef.Substring(0, Math.Min(100, procDef.Length))}...", ex);
                            }
                        }
                        else
                        {
                            // The procedure definition is already at the beginning
                            try
                            {
                                using var cmd = new SqlCommand(cleanBatch, connection);
                                cmd.CommandTimeout = 300;
                                await cmd.ExecuteNonQueryAsync();
                            }
                            catch (Exception ex)
                            {
                                throw new Exception($"Error executing procedure: {ex.Message}\n\nProcedure: {cleanBatch.Substring(0, Math.Min(100, cleanBatch.Length))}...", ex);
                            }
                        }
                    }
                    else
                    {
                        // Regular batch
                        try
                        {
                            using var cmd = new SqlCommand(cleanBatch, connection);
                            cmd.CommandTimeout = 300;
                            await cmd.ExecuteNonQueryAsync();
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine($"Error executing batch: {ex.Message}\n\nBatch: {cleanBatch.Substring(0, Math.Min(100, cleanBatch.Length))}...");
                            
                            // Try to continue with the next batch
                            continue;
                        }
                    }
                }
                
                return;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error executing script: {ex.Message}", ex);
            }
        }

        private string[] SplitScriptByProcedures(string script)
        {
            List<string> batches = new List<string>();
            
            // First split by GO statements
            string[] goBatches = script.Split(
                new string[] { "\nGO\n", "\nGO\r\n", "\r\nGO\r\n", "\r\nGO\n", "\nGO", "\r\nGO", "GO\r\n", "GO\n", "GO" },
                StringSplitOptions.RemoveEmptyEntries);
            
            foreach (string goBatch in goBatches)
            {
                // Check if this batch contains CREATE/ALTER PROCEDURE
                if (System.Text.RegularExpressions.Regex.IsMatch(goBatch, @"CREATE\s+PROCEDURE|ALTER\s+PROCEDURE|CREATE\s+PROC|ALTER\s+PROC", 
                    System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    // If it contains variable declarations before the procedure, split them
                    var match = System.Text.RegularExpressions.Regex.Match(goBatch, 
                        @"^(.*?)(CREATE\s+PROCEDURE|ALTER\s+PROCEDURE|CREATE\s+PROC|ALTER\s+PROC)", 
                        System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
                    
                    if (match.Success && !string.IsNullOrWhiteSpace(match.Groups[1].Value))
                    {
                        // Add the declarations as a separate batch
                        string declarations = match.Groups[1].Value.Trim();
                        if (!string.IsNullOrWhiteSpace(declarations))
                        {
                            batches.Add(declarations);
                        }
                        
                        // Add the procedure as its own batch
                        string procedure = goBatch.Substring(match.Groups[1].Value.Length).Trim();
                        batches.Add(procedure);
                    }
                    else
                    {
                        // Just add the whole batch
                        batches.Add(goBatch);
                    }
                }
                else
                {
                    // Regular batch, add it as is
                    batches.Add(goBatch);
                }
            }
            
            return batches.ToArray();
        }

        // IMMEDIATE WORKAROUND: Manual file copy instructions
        public string GetManualCopyInstructions(string serverName, string localBackupPath)
        {
            string fileName = Path.GetFileName(localBackupPath);

            return $@"
MANUAL SOLUTION (Copy-Paste these steps):

1. Copy your backup file to the SQL Server machine:
   Source: {localBackupPath}
   Target: \\{serverName}\C$\Temp\{fileName}

2. Or use SQL Server Management Studio:
   - Connect to {serverName}
   - Right-click Databases → Restore Database
   - Select 'Device' and browse to your backup file

3. Or run this SQL command directly on the server:
   RESTORE DATABASE [YourDBName] 
   FROM DISK = 'C:\Temp\{fileName}' 
   WITH REPLACE

4. Alternative: Share your local folder and use UNC path:
   \\YourComputerName\SharedFolder\{fileName}
";
        }

        // Test connection with detailed error info
        public async Task<bool> TestConnectionWithDetails(string serverName, string username, string password)
        {
            try
            {
                string connectionString = $"data source={serverName};initial catalog=master;user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=10;";

                using var connection = new SqlConnection(connectionString);
                await connection.OpenAsync();

                // Get SQL Server info
                string infoQuery = @"
                    SELECT 
                        @@VERSION as SQLVersion,
                        SERVERPROPERTY('InstanceDefaultDataPath') as DefaultDataPath,
                        SERVERPROPERTY('InstanceDefaultLogPath') as DefaultLogPath,
                        IS_SRVROLEMEMBER('sysadmin') as IsSysAdmin";

                using var cmd = new SqlCommand(infoQuery, connection);
                using var reader = await cmd.ExecuteReaderAsync();

                if (await reader.ReadAsync())
                {
                    string version = reader["SQLVersion"]?.ToString();
                    string dataPath = reader["DefaultDataPath"]?.ToString();
                    string logPath = reader["DefaultLogPath"]?.ToString();
                    bool isSysAdmin = Convert.ToBoolean(reader["IsSysAdmin"]);

                    Console.WriteLine($"SQL Server Version: {version}");
                    Console.WriteLine($"Data Path: {dataPath}");
                    Console.WriteLine($"Log Path: {logPath}");
                    Console.WriteLine($"Is SysAdmin: {isSysAdmin}");

                    if (!isSysAdmin)
                        throw new Exception("User does not have sysadmin privileges");
                }

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Connection failed: {ex.Message}");
            }
        }

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
        private async Task<string> GetSqlServerAccessiblePath(SqlConnection connection, string originalPath)
        {
            try
            {
                string sqlBackupDir = await GetDefaultDataPath(connection);
                string fileName = Path.GetFileName(originalPath);
                string targetPath = Path.Combine(sqlBackupDir, fileName);

                if (File.Exists(originalPath) && !File.Exists(targetPath))
                {
                    Console.WriteLine($"Copying file from {originalPath} to {targetPath}");
                    File.Copy(originalPath, targetPath, true);
                    Console.WriteLine("Copy successful");
                }

                return targetPath;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Copy failed: {ex.Message}");
                return originalPath;
            }
        }

        public async Task<string> PrepareBackupFile(string originalPath, string serverName, string username, string password)
        {
            try
            {
                if (!File.Exists(originalPath))
                    throw new FileNotFoundException($"Backup file not found: {originalPath}");

                if (originalPath.StartsWith(@"\\") || !Path.IsPathRooted(originalPath))
                {
                    string tempPath = Path.Combine(Path.GetTempPath(), Path.GetFileName(originalPath));
                    Console.WriteLine($"Copying UNC path {originalPath} to {tempPath}");
                    File.Copy(originalPath, tempPath, true);
                    Console.WriteLine("Copy successful");
                    return tempPath;
                }

                return originalPath;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to prepare backup file: {ex.Message}");
                throw new Exception($"Failed to prepare backup file: {ex.Message}");
            }
        }

        public async Task<bool> RestoreDatabase(string serverName, string username, string password, string databaseName, string backupFileName)
        {
            try
            {
                // Use a path relative to the application directory
                string backupPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Database", backupFileName);

                if (!File.Exists(backupPath))
                    throw new FileNotFoundException($"Backup file not found: {backupPath}");

                string masterConnectionString = $"Server={serverName};Database=master;User Id={username};Password={password};TrustServerCertificate=true;Encrypt=false;";

                // Copy to SQL Server accessible location
                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                // Get SQL Server's data path
                string query = "SELECT SERVERPROPERTY('InstanceDefaultDataPath') as DataPath";
                using var cmd = new SqlCommand(query, connection);
                var dataPath = (await cmd.ExecuteScalarAsync())?.ToString();

                if (string.IsNullOrEmpty(dataPath))
                    dataPath = @"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\";

                string serverBackupPath = Path.Combine(dataPath, Path.GetFileName(backupPath));
                File.Copy(backupPath, serverBackupPath, true);

                string restoreQuery = $@"
                    IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
                    BEGIN
                        ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                        DROP DATABASE [{databaseName}];
                    END

                    RESTORE DATABASE [{databaseName}] 
                    FROM DISK = '{serverBackupPath}'
                    WITH REPLACE;
                ";

                using var command = new SqlCommand(restoreQuery, connection);
                command.CommandTimeout = 300;
                await command.ExecuteNonQueryAsync();

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database restore failed: {ex.Message}");
            }
        }

        private async Task<string> GetDefaultDataPath(SqlConnection connection)
        {
            string query = "SELECT SERVERPROPERTY('InstanceDefaultDataPath') as DataPath";
            using var cmd = new SqlCommand(query, connection);
            var dataPath = (await cmd.ExecuteScalarAsync())?.ToString();

            return string.IsNullOrEmpty(dataPath)
                ? @"C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
                : dataPath;
        }

        public async Task<bool> SetupDatabaseFromScript(string serverName, string username, string password, string databaseName, string scriptFilePath)
        {
            try
            {
                if (!File.Exists(scriptFilePath))
                    throw new FileNotFoundException($"SQL script file not found: {scriptFilePath}");

                // Create a temporary directory to split the script
                string tempDir = Path.Combine(Path.GetTempPath(), "SQLScripts_" + Guid.NewGuid().ToString());
                Directory.CreateDirectory(tempDir);

                try
                {
                    // Split the large script into smaller files
                    SplitScriptIntoFiles(scriptFilePath, tempDir);
                    
                    // Now use the multiple scripts approach
                    return await SetupDatabaseFromMultipleScripts(serverName, username, password, databaseName, tempDir);
                }
                finally
                {
                    // Clean up temp directory
                    try
                    {
                        Directory.Delete(tempDir, true);
                    }
                    catch
                    {
                        // Ignore cleanup errors
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Database setup from script failed: {ex.Message}", ex);
            }
        }

        private void SplitScriptIntoFiles(string scriptFilePath, string outputDir)
        {
            string script = File.ReadAllText(scriptFilePath);
            
            // 1. First file: Create tables
            string createTablesScript = ExtractCreateTableStatements(script);
            File.WriteAllText(Path.Combine(outputDir, "01_CreateTables.sql"), createTablesScript);
            
            // 2. Second file: Insert data
            string insertDataScript = ExtractInsertStatements(script);
            File.WriteAllText(Path.Combine(outputDir, "02_InsertData.sql"), insertDataScript);
            
            // 3. Third file: Create procedures (one file per procedure)
            ExtractProceduresToFiles(script, outputDir);
            
            // 4. Fourth file: Everything else
            string remainingScript = RemoveExtractedParts(script, createTablesScript, insertDataScript);
            File.WriteAllText(Path.Combine(outputDir, "99_Remaining.sql"), remainingScript);
        }

        private string ExtractCreateTableStatements(string script)
        {
            var matches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"CREATE\s+TABLE\s+[^\(]+\([^;]+;", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            return string.Join("\nGO\n", matches.Cast<System.Text.RegularExpressions.Match>().Select(m => m.Value));
        }

        private string ExtractInsertStatements(string script)
        {
            var matches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"INSERT\s+INTO\s+[^\(]+\([^;]+;", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            return string.Join("\nGO\n", matches.Cast<System.Text.RegularExpressions.Match>().Select(m => m.Value));
        }

        private void ExtractProceduresToFiles(string script, string outputDir)
        {
            var matches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"CREATE\s+PROCEDURE\s+[^\(]+\([\s\S]+?END", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            int procCount = 0;
            foreach (System.Text.RegularExpressions.Match match in matches)
            {
                procCount++;
                string procName = "Unknown";
                
                // Try to extract procedure name
                var nameMatch = System.Text.RegularExpressions.Regex.Match(match.Value, 
                    @"CREATE\s+PROCEDURE\s+\[?dbo\]?\.\[?([^\]\.\(]+)", 
                    System.Text.RegularExpressions.RegexOptions.IgnoreCase);
                
                if (nameMatch.Success)
                {
                    procName = nameMatch.Groups[1].Value.Trim();
                }
                
                File.WriteAllText(
                    Path.Combine(outputDir, $"03_{procCount:D3}_{procName}.sql"), 
                    match.Value);
            }
        }

        private string RemoveExtractedParts(string script, string createTablesScript, string insertDataScript)
        {
            string result = script;
            
            // Remove CREATE TABLE statements
            var createTableMatches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"CREATE\s+TABLE\s+[^\(]+\([^;]+;", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            foreach (System.Text.RegularExpressions.Match match in createTableMatches)
            {
                result = result.Replace(match.Value, "");
            }
            
            // Remove INSERT statements
            var insertMatches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"INSERT\s+INTO\s+[^\(]+\([^;]+;", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            foreach (System.Text.RegularExpressions.Match match in insertMatches)
            {
                result = result.Replace(match.Value, "");
            }
            
            // Remove CREATE PROCEDURE statements
            var procMatches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"CREATE\s+PROCEDURE\s+[^\(]+\([\s\S]+?END", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Singleline);
            
            foreach (System.Text.RegularExpressions.Match match in procMatches)
            {
                result = result.Replace(match.Value, "");
            }
            
            return result;
        }
        private string PreprocessSqlScript(string script)
        {
            // Move variable declarations before CREATE/ALTER PROCEDURE statements
            var procMatches = System.Text.RegularExpressions.Regex.Matches(script, 
                @"(CREATE\s+PROCEDURE|ALTER\s+PROCEDURE|CREATE\s+PROC|ALTER\s+PROC)", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            
            if (procMatches.Count > 0)
            {
                // Add GO statements before each procedure to ensure they're in separate batches
                foreach (System.Text.RegularExpressions.Match match in procMatches)
                {
                    int position = match.Index;
                    
                    // Find the beginning of the line
                    int lineStart = script.LastIndexOf('\n', position);
                    if (lineStart == -1) lineStart = 0;
                    
                    // Insert GO before the procedure if it's not already there
                    if (lineStart > 0 && !script.Substring(lineStart - 5, 5).Contains("GO"))
                    {
                        script = script.Insert(lineStart, "\nGO\n");
                    }
                }
            }
            
            // Handle common table variables
            if (script.Contains("@AlertInfo") && !script.Contains("DECLARE @AlertInfo"))
            {
                // Add declaration at the beginning of the script
                script = "DECLARE @AlertInfo TABLE (ID INT, AlertName NVARCHAR(100), AlertMessage NVARCHAR(MAX));\nGO\n" + script;
            }
            
            // Handle other common table variables
            if (script.Contains("@TempTable") && !script.Contains("DECLARE @TempTable"))
            {
                script = "DECLARE @TempTable TABLE (ID INT);\nGO\n" + script;
            }
            
            // Handle scalar variables
            if (script.Contains("@Message") && !script.Contains("DECLARE @Message"))
            {
                script = "DECLARE @Message NVARCHAR(MAX);\nGO\n" + script;
            }
            
            // Fix common syntax issues
            script = script.Replace("BACKUP DATABASE TO", "BACKUP DATABASE [DatabaseName] TO");
            
            // Remove any print statements that might cause issues
            script = System.Text.RegularExpressions.Regex.Replace(
                script, 
                @"PRINT\s+[^;]+;", 
                "", 
                System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            
            return script;
        }
        
        // private string PreprocessSqlScript(string script)
        // {
        //     // Replace any variable declarations that might be missing
        //     if (script.Contains("@Message") && !script.Contains("DECLARE @Message"))
        //     {
        //         script = "DECLARE @Message NVARCHAR(MAX);\n" + script;
        //     }
            
        //     // Fix common syntax issues
        //     script = script.Replace("BACKUP DATABASE TO", "BACKUP DATABASE [DatabaseName] TO");
            
        //     // Remove any print statements that might cause issues
        //     script = System.Text.RegularExpressions.Regex.Replace(
        //         script, 
        //         @"PRINT\s+[^;]+;", 
        //         "", 
        //         System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            
        //     return script;
        // }
        public async Task<bool> SetupDatabaseFromMultipleScripts(string serverName, string username, string password, string databaseName, string scriptFolderPath)
        {
            try
            {
                if (!Directory.Exists(scriptFolderPath))
                    throw new DirectoryNotFoundException($"SQL script folder not found: {scriptFolderPath}");

                string masterConnectionString = $"data source={serverName};initial catalog=master;user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=30;";

                using var connection = new SqlConnection(masterConnectionString);
                await connection.OpenAsync();

                // Get SQL Server's data path
                string dataPath = await GetDefaultDataPath(connection);
                Console.WriteLine($"SQL Server data path: {dataPath}");

                // Create empty database first (or drop if exists)
                string createDbQuery = $@"
                    IF EXISTS (SELECT name FROM sys.databases WHERE name = '{databaseName}')
                    BEGIN
                        ALTER DATABASE [{databaseName}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
                        DROP DATABASE [{databaseName}];
                    END
                    
                    -- Create database with files in the correct location
                    CREATE DATABASE [{databaseName}]
                    ON PRIMARY (
                        NAME = {databaseName}_data,
                        FILENAME = '{dataPath}{databaseName}.mdf',
                        SIZE = 10MB,
                        MAXSIZE = UNLIMITED,
                        FILEGROWTH = 10%
                    )
                    LOG ON (
                        NAME = {databaseName}_log,
                        FILENAME = '{dataPath}{databaseName}.ldf',
                        SIZE = 5MB,
                        MAXSIZE = UNLIMITED,
                        FILEGROWTH = 10%
                    );
                ";
                
                using var createDbCmd = new SqlCommand(createDbQuery, connection);
                await createDbCmd.ExecuteNonQueryAsync();
                
                // Switch to new database
                string dbConnectionString = $"data source={serverName};initial catalog={databaseName};user id={username};password={password};MultipleActiveResultSets=True;TrustServerCertificate=True;Connection Timeout=30;";

                using var dbConnection = new SqlConnection(dbConnectionString);
                await dbConnection.OpenAsync();

                // Get all SQL files in the folder
                var sqlFiles = Directory.GetFiles(scriptFolderPath, "*.sql")
                                       .OrderBy(f => Path.GetFileName(f))
                                       .ToArray();

                if (sqlFiles.Length == 0)
                    throw new FileNotFoundException("No SQL script files found in the specified folder.");

                // Execute each script file in order
                foreach (var scriptFile in sqlFiles)
                {
                    Console.WriteLine($"Executing script: {Path.GetFileName(scriptFile)}");
                    string script = await File.ReadAllTextAsync(scriptFile);
                    
                    // Split by GO statements
                    string[] batches = script.Split(
                        new string[] { "\nGO\n", "\nGO\r\n", "\r\nGO\r\n", "\r\nGO\n", "\nGO", "\r\nGO", "GO\r\n", "GO\n", "GO" },
                        StringSplitOptions.RemoveEmptyEntries);
                    
                    // Execute each batch separately
                    foreach (string batch in batches)
                    {
                        string cleanBatch = batch.Trim();
                        if (!string.IsNullOrWhiteSpace(cleanBatch))
                        {
                            try
                            {
                                using var cmd = new SqlCommand(cleanBatch, dbConnection);
                                cmd.CommandTimeout = 300;
                                await cmd.ExecuteNonQueryAsync();
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine($"Error executing batch in {Path.GetFileName(scriptFile)}: {ex.Message}");
                                // Continue with next batch
                            }
                        }
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Database setup from scripts failed: {ex.Message}", ex);
            }
        }
    }
}
