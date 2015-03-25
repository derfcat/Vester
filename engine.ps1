# Pull in JobVars
Invoke-Expression ($PSScriptRoot + "\JobVars.ps1")

# Map the various jobs into a hashtable
# Code credit to cdituri
$jobMap = [Ordered]@{
  "DNS"    = "\VMware\set-vmwdns.ps1";
  "NTP"    = "\VMware\set-vmwntp.ps1";
  "Syslog" = "\VMware\set-vmwsyslog.ps1";
  "SSH"    = "\VMware\set-vmwssh.ps1"
}

# Collect data and send to dashboard
# Code credit to cdituri
$jobMap.Keys | % {
  $scriptPath = Join-Path $PSScriptRoot $jobMap[$_]
  Start-Job -Name "$($_)" -ScriptBlock { Invoke-Expression $args[0] } -ArgumentList $scriptPath
}

Get-Job | Wait-Job
Get-Job | Remove-Job