function Get-LogonScripts {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [array]$Domain
    )
    $SysvolScripts = '\\' + (Get-ADDomain).DNSRoot + '\sysvol\' + (Get-ADDomain).DNSRoot + '\scripts'
    $ExtensionList = '.bat|.vbs|.ps1|.cmd'
    $LogonScripts = Get-ChildItem -Path $SysvolScripts -Recurse | Where-Object {$_.Extension -match $ExtensionList}

    return $LogonScripts
}