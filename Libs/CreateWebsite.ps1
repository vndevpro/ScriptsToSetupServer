[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string]$WebSiteName,	
	[Parameter(Mandatory=$True)]
	[string]$RootFSFolder,
	[Parameter(Mandatory=$False)]
	# An example of bindings as follow
	# @(@{protocol="http"; bindingInformation=":180:test1.com"},@{protocol="http"; bindingInformation=":180:www.site1.com"})
	[array]$SiteBindings,
	[Parameter(Mandatory=$False)]
	[string]$DefaultAppPoolName
)

Import-Module -Name 'C:\Windows\System32\WindowsPowerShell\v1.0\Modules\WebAdministration\WebAdministration.psd1'

Function CreateAppPool {
Param([string] $appPoolName)

	if(Test-Path ("IIS:\AppPools\" + $appPoolName)) {
		Write-Host "The App Pool $appPoolName already exists" -ForegroundColor Yellow
	}
	else {
		$appPool = New-WebAppPool -Name $appPoolName
	}
	
	Start-WebAppPool -Name $appPoolName
}

function CreatePhysicalPath {
Param([string] $fpath)

	if(Test-path $fpath) {
		Write-Host "The folder $fpath already exists" -ForegroundColor Yellow
		return
	}
	else {
		New-Item -ItemType directory -Path $fpath -Force
	}
}

function CreateWebsite {
Param(
	[Parameter(Mandatory=$True)]
	[string]$WebSiteName,
	[Parameter(Mandatory=$True)]
	[string]$RootFSFolder,
	[Parameter(Mandatory=$False)]
	[array]$SiteBindings,
	[Parameter(Mandatory=$False)]
	[string]$DefaultAppPoolName
)

	# Create app pool
	$appPoolName = $DefaultAppPoolName
	if(-not $appPoolName){
		$appPoolName = $WebSiteName
	}
	CreateAppPool $appPoolName

	# Create folder
	$sitePath = $RootFSFolder + "\" + $WebSiteName + "\"
	CreatePhysicalPath $sitePath
	
	# Create site
	If(!(Test-Path "IIS:\Sites\$WebSiteName")){
		New-Website -Name $WebSiteName -PhysicalPath $sitePath -ApplicationPool $appPoolName
	}
	else {
		Write-Host "The IIS site $WebSiteName already exists" -ForegroundColor Yellow
	}
	
	# Adjust properties
	Set-ItemProperty -Path "IIS:\Sites\$WebSiteName" -Name "bindings" -value $SiteBindings
	
	# Start the site
	Start-Website -Name $WebSiteName
}

CreateWebsite -WebSiteName $WebSiteName -RootFSFolder $RootFSFolder -DefaultAppPoolName $DefaultAppPoolName -SiteBindings $SiteBindings

