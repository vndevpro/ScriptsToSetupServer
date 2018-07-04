# Install IIS
Write-Host "Installing web-server"
Install-WindowsFeature -Name web-server -IncludeManagementTools

Write-Host "Installing Tracing feature"
Install-WindowsFeature -Name Web-Http-Tracing

Write-Host "Installing Web-Basic-Auth"
Install-WindowsFeature -Name Web-Basic-Auth -IncludeManagementTools

# Common features
(Get-Item -Path ".\").FullName + "\InstallCoreFeaturesAnyServer.ps1"

# Include .Net components
(Get-Item -Path ".\").FullName + "\InstallNetFrameworks.ps1"

#Install and start Web Management Service
Write-Host "Installing Web-Mgmt-Service"
Install-WindowsFeature -Name Web-Mgmt-Service -IncludeManagementTools
Start-Service -Name WMSVC
