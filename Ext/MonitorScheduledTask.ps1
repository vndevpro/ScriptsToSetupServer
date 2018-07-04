# Must install the module TaskScheduler that contains function Get-ScheduledTask
# V1 - created on 03/07/2018 by HHV
# Expected: to monitor status of a scheduled task - alert to cloudprod if the task is disabled
#================
# V2 - monitor many tasks in the same server
#================

$taskList = @(
	'TEST'
);
$computerName = '';

$smtpServer = ''
$emailFrom = ''
$password = ' '

$emailTo = ''
$emailSubject = '/!\ Warning : Tasks are disabled on ' + $computerName;
$emailBody = "";

# An email sending method
Function Send-EMail {
    Param (
		[Parameter(Mandatory=$true)]
        [String]$SMTPServer,
        [Parameter(Mandatory=$true)]
        [String]$EmailTo,
        [Parameter(Mandatory=$true)]
        [String]$Subject,
        [Parameter(Mandatory=$true)]
        [String]$Body,
        [Parameter(Mandatory=$true)]
        [String]$EmailFrom,
        [Parameter(Mandatory=$true)]
        [String]$Password,
		[Parameter(Mandatory=$false)]
		[Bool]$EnableSsl = $false,
		[Parameter(Mandatory=$false)]
		[int]$Port = 25
    )

        $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body);
        $SMTPMessage.IsBodyHTML = $True;
        
        $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, $Port) 
        $SMTPClient.EnableSsl = $EnableSsl
        $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($EmailFrom, $Password); 
        $SMTPClient.Send($SMTPMessage)
        Remove-Variable -Name SMTPClient
        Remove-Variable -Name Password

} #End Function Send-EMail


# Main logic
$count = 1
$taskList | ForEach-Object{
	$taskName = $_
	
	$taskObj = Get-ScheduledTask -ComputerName $computerName -Name $taskName
	
	if($taskObj.Status -eq 'Disabled') {
		$emailBody += "<br /> " + $count + ": " + $taskName
		$count += 1;
	}
}

# Send the mail
if($emailBody -ne "") {
	$emailBody = "The below tasks are disabled, please check to enable them again:<br />" + $emailBody;
	
	Send-EMail 	-SMTPServer $smtpServer -EmailTo $emailTo -Body $emailBody -Subject $emailSubject -EmailFrom $emailFrom -password $password -EnableSsl $False -Port 25
}
