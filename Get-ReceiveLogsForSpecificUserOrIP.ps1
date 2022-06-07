param(
    [Parameter(Mandatory = $false)]
    [string] $AccountName,
    [Parameter(Mandatory = $false)]
    [string] $IPAddress,
    [Parameter(Mandatory = $true)]
    [DateTime]$Date
)

$year = $Date.Year
$month = $Date.Month
$day = $Date.Day

if($month -lt 10)
{
    $month = "0" + [string]$month
}

if($day -lt 10)
{
    $day = "0" + [string]$day
}

$path = "C$\EXSvr\TransportRoles\Logs\FrontEnd\ProtocolLog\SmtpReceive"

$svrs = Get-ExchangeServer |
    select -ExpandProperty name

"" > .\receivelogs.log
foreach($svr in $svrs)
{
    write-host "$svr" -ForegroundColor Green
    $svr >> .\receivelogs.log
    
    $file = Get-Content "\\$($svr)\$($path)\recv$($year)$($month)$($day)*.log"

    foreach($line in $file)
    {
        if($line -like "*$($AccountName)*" -or $line -like "*$($IPAddress)*")
        {
            write-host $line
            $line >> .\receivelogs.log
        }
    }
}