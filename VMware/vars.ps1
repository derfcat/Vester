### DNS Entries
$global:esxdns = @("0.pool.ntp.org","1.pool.ntp.org","2.pool.ntp.org","3.pool.ntp.org")

### vCenter Server
$global:vc = 'vcsa1.glacier.local'

### NSX Manager
$global:nsx = 'nsx1.glacier.local'

### PernixData FVP
$global:prnx = 'pernixdata.glacier.local'

Write-Host -BackgroundColor:Black -ForegroundColor:Yellow "Creds file parsed."