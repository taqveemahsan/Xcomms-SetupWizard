# XComms Setup Wizard

This repository contains a Windows-based setup wizard for deploying the XComms application stack.
The wizard guides administrators through the following steps:

1. **Database Setup** – restore from a backup or run SQL scripts.
2. **Install Location** – specify paths for the API and web applications.
3. **Configuration** – configure IIS settings such as ports and application pools.
4. **Backup Setup** – schedule automated backups.
5. **Review & Install** – verify all settings before starting deployment.

The solution includes separate projects for the API, web application, core deployment logic and the installer UI.

## Building

Open `SetupWizard.sln` in Visual Studio and build the `SetupWizard.UI` project.
Alternatively, from a command prompt run:

```sh
 dotnet build SetupWizard.UI/SetupWizard.UI.csproj
```

(If `dotnet` is not installed, install the .NET SDK first.)

## Running

The wizard starts the `MainWizardForm` located in `SetupWizard.UI`.  Launch the application from Visual Studio or by executing the built EXE in `SetupWizard.UI/bin/Release` after publishing.

## Publish Files

Images and default SQL scripts reside under `SetupWizard.UI/PublishFiles`. These are copied to the output directory during build and are required for the sidebar icons and logo to display.


