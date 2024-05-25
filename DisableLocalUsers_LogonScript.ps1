$Exceptions = @("Administrator", "WDAGUtilityAccount")
Write-Host "Exceptions: $Exceptions"
Get-LocalUser | Where-Object {
    $_.Enabled -eq $true -and $_.Name -notin $Exceptions
} | ForEach-Object {
    Disable-LocalUser $_.Name
}