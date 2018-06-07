$PowershellScriptsDir\CreateUsers.ps1

$PowershellScriptsDir\CreateWebsite.ps1 -WebSiteName $WebSiteName -RootFSFolder $RootFSFolder -SiteBindings @(@{protocol="http"; bindingInformation=":80:$SiteRootUrl"})

$PowershellScriptsDir\SetWebsiteProperties.ps1 -WebSiteName $WebSiteName -ManagedRuntimeVersion "v4.0" -CustomUsername $CustomUsername -CustomPassword $CustomPassword