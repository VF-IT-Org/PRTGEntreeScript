#prtg
param(
    [string]$ReportUrl = "http://SERVERNAME/ReportServer/Pages/ReportViewer.aspx?%2fViking+Food%2fFLS+Custom+Reports%2fHenrik%2fTStamp&rs:format=CSV"
)

$reportResponse = Invoke-WebRequest -Uri $ReportUrl -UseDefaultCredentials
$lastUpdateTime = [datetime]$reportResponse.Content.Substring(8, 22)
$currentTime = Get-Date
$reportAge = $currentTime - $lastUpdateTime
$minutesOld = [int][Math]::Floor($reportAge.TotalMinutes)

$statusMessage = "{0}:Last update is {0} minutes." -f $minutesOld
Write-Output $statusMessage

exit 0
