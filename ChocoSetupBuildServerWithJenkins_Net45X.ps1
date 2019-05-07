# Install Windows Features
.\Libs\InstallCoreFeaturesAnyServer.ps1

.\Libs\InstallNetFrameworks.ps1

# Install Choco and PS5
.\Libs\InstallChocoAndPowerShell5.ps1

# Now do install common software
.\Libs\ChocoInstallCommonSoftwareForServer.ps1

# Install Jenkins
.\Libs\ChocoInstallJenkins.ps1

# MSBuild 2015 Update 3 https://chocolatey.org/packages/microsoft-build-tools/14.0.25420.1
choco install microsoft-build-tools  -y --version 14.0.25420.1

# .NET Framework 4.5.2 Developer Pack
# https://chocolatey.org/packages/netfx-4.5.2-devpack
choco install netfx-4.5.1-devpack -y --version 4.5.50932
choco install netfx-4.5.2-devpack -y --version 4.5.5165101

# Install Web Deploy
choco install webdeploy -y --version 3.6.20170627
