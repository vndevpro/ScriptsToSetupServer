# This script will add new binding to a website if that is not existing yet
# Source is on https://github.com/vndevpro/ScriptsToSetupServer

Param(
	[String]
	$WebSiteName,
	[String]
	$HostHeader
)

$testBinding = Get-WebBinding -Name $WebSiteName -HostHeader $HostHeader

if($testBinding -eq $NULL) {
	New-WebBinding -Name $WebSiteName -Protocol "http" -HostHeader $HostHeader
	
	if($?) {
		"Added binding $HostHeader on $WebSiteName"
	}
}
else {
	"Binding $HostHeader is already existing on $WebSiteName"
}