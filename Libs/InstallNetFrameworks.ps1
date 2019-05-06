# Change the value to make it download packages from Microsoft Update
$au = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -ErrorAction SilentlyContinue
if ($au -ne $NULL -and $au.UseWUServer -eq 1) {
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 0
	Restart-Service -Name wuauserv
}

Write-Host "Installing NET-Framework-Core"
Install-WindowsFeature -Name NET-Framework-Core

if ($au -ne $NULL -and $au.UseWUServer -eq 1) {
	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name UseWUServer -Value 1
	Restart-Service -Name wuauserv
}

# Install the component requires by applications
Write-Host "Installing web-asp-net45"
Install-WindowsFeature -Name web-asp-net45 -IncludeManagementTools
