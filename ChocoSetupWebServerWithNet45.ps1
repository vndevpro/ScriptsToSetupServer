Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Windows Features
.\Libs\InstallCoreFeaturesForWebServer.ps1

# Install Web Deploy
choco install webdeploy -y --version 3.6.20170627

.\Libs\ChocoInstallCommonSoftwareForServer.ps1

# Install SQL Server 2014 Management Studio
choco install mssqlservermanagementstudio2014express -y --version 12.2.5000.20170905
