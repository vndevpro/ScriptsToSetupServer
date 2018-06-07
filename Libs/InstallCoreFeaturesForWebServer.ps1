# Install IIS
Write-Host "Installing web-server"
Install-WindowsFeature -Name web-server -IncludeManagementTools

Write-Host "Installing Tracing feature"
Install-WindowsFeature -Name Web-Http-Tracing

Write-Host "Installing Web-Basic-Auth"
Install-WindowsFeature -Name Web-Basic-Auth -IncludeManagementTools

# Change the value to make it download packages from Microsoft Update
$au = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
if ($au.UseWUServer -eq 1) {
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 0
	Restart-Service -Name wuauserv
}

Write-Host "Installing NET-Framework-Core"
Install-WindowsFeature -Name NET-Framework-Core

if ($au.UseWUServer -eq 1) {
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 1
	Restart-Service -Name wuauserv
}

#Install and start Web Management Service
Write-Host "Installing Web-Mgmt-Service"
Install-WindowsFeature -Name Web-Mgmt-Service -IncludeManagementTools
Start-Service -Name WMSVC

# Install the component requires by applications
Write-Host "Installing web-asp-net45"
Install-WindowsFeature -Name web-asp-net45 -IncludeManagementTools


# Install the component requires by applications
Write-Host "Installing Telnet-Client"
Install-WindowsFeature Telnet-Client