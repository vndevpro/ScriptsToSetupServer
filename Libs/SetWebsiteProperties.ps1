[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string]$WebSiteName,	
	
	[Parameter(Mandatory=$False)]
	[string]$ManagedRuntimeVersion,
	
	# Set the identity for app pool
	# An example is: @{identityType="SpecificUser"; username="$CustomUsername"; password="$CustomPassword"}	
	[Parameter(Mandatory=$False)]
	[string]$CustomUsername,
	
	[Parameter(Mandatory=$False)]
	[string]$CustomPassword
)

# Get the app pool
$applicationPool = (Get-Item -Path "IIS:\Sites\$WebSiteName").applicationPool

# Change runtime version
if ($ManagedRuntimeVersion){
	Set-ItemProperty -Path "IIS:\AppPools\$applicationPool" -Name "managedRuntimeVersion" -Value $ManagedRuntimeVersion
	
	Write-Host "Changed IIS:\AppPools\$applicationPool managedRuntimeVersion to $ManagedRuntimeVersion"
}

# Change processModel
if ($CustomUsername){
	$processModel = @{identityType="SpecificUser"; username="$CustomUsername"; password="$CustomPassword"}	
	Set-ItemProperty -Path "IIS:\AppPools\$applicationPool" -Name "processModel" -Value $processModel
	
	Write-Host "Changed IIS:\AppPools\$applicationPool processModel to user $CustomUsername"
}
