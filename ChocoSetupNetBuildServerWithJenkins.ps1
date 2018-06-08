# Install Windows Features
.\Libs\InstallNetFrameworks.ps1

# Install Choco and PS5
.\Libs\InstallChocoAndPowerShell5.ps1

# Now do install common software
.\Libs\ChocoInstallCommonSoftwareForServer.ps1

# Install Jenkins
.\Libs\ChocoInstallJenkins.ps1

# MSBuild 2015 Update 3 https://chocolatey.org/packages/microsoft-build-tools/14.0.25420.1
choco install microsoft-build-tools  -y --version 14.0.25420.1

# Install Microsoft Windows SDK for Windows 8 and .NET Framework 4.5
# https://chocolatey.org/packages/windows-sdk-8.0
choco install windows-sdk-8.0 -y --version 8.59.29750.0
