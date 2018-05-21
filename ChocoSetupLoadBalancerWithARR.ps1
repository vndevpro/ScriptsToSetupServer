Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install IIS
Write-Host "Installing web-server"
Install-WindowsFeature -Name web-server -IncludeManagementTools

# Install IIS Application Request Routing
choco install iis-arr -y --version 3.0.20180207

# Now do install common software
.\Libs\ChocoInstallCommonSoftwareForServer.ps1


# Change application pool process model for Application Request Routing with Idle Time-out to 0
#cd "$env:windir\system32\inetsrv"
#.\appcmd.exe set apppool "DefaultAppPool" -processModel.idleTimeout:"00:00:00" /commit:apphost

# Change application pool recycling settings for Application Request Routing
#cd "$env:windir\system32\inetsrv"
#.\appcmd.exe set config -section:system.applicationHost/applicationPools /[name='DefaultAppPool'].recycling.periodicRestart.time:"00:00:00" /commit:apphost

