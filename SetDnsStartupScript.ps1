$primaryDNS = "192.168.50.4"
$secondaryDNS = "192.168.50.5"
$tertiaryDNS = "208.67.220.220"

$adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}

foreach ($adapter in $adapters) {
  Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ($primaryDNS, $secondaryDNS, $tertiaryDNS)
  Write-Host "Successfully set DNS servers for adapter: $($adapter.Name)"
}
