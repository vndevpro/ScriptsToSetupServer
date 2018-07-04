# Install the component requires by applications
Write-Host "Installing Telnet-Client"
Install-WindowsFeature Telnet-Client

# Desktop-Experience -> disk cleanup
Write-Host "Installing Desktop-Experience"
Install-WindowsFeature -Name Desktop-Experience
