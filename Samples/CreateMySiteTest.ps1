D:\Wip\Practices\Github\ScriptsToSetupServer\Libs\CreateUsers.ps1

D:\Wip\Practices\Github\ScriptsToSetupServer\Libs\CreateWebsite.ps1 -WebSiteName SimpleBox -RootFSFolder "C:\inetpub\wwwroot" -SiteBindings @(@{protocol="http"; bindingInformation=":80:simplebox.com"})

D:\Wip\Practices\Github\ScriptsToSetupServer\Libs\SetWebsiteProperties.ps1 -WebSiteName SimpleBox -ManagedRuntimeVersion "v4.0" -CustomUsername simplebox -CustomPassword Abc123456