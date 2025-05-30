-- Default Settings
INSERT INTO Settings (SettingKey, SettingValue) VALUES
('AppName', 'My Application'),
('Version', '1.0.0'),
('DatabaseVersion', '1.0.0'),
('MaintenanceMode', 'false');

-- Default Admin User
INSERT INTO Users (Username, Email) VALUES
('admin', 'admin@example.com'),
('testuser', 'test@example.com');

-- Initial Log Entry
INSERT INTO Logs (LogLevel, Message) VALUES
('Info', 'Database initialized successfully');