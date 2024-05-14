$DomainComputers = Get-ADGroupMember -Identity "Domain Computers" | Select-Object -ExpandProperty Name
$Session = New-PSSession -ComputerName $DomainComputers -Credential AD\radmin
$Exceptions = @("Administrator", "WDAGUtilityAccount")

Invoke-Command -Session $Session {
    Get-LocalUser | Where-Object {
        $_.Enabled -eq $true -and $_.Name -notin $Exceptions
    } | ForEach-Object {
            Disable-LocalUser $_
    }
}
Get-PSSession | Remove-PSSession
