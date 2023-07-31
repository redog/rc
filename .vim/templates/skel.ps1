Function Get-Something {

    [CmdletBinding()]
    param(
        [Parameter(
            Mandatory = $false,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            Position = 0
            )]
        [string[]]  $UserPrincipalName
    )

    Begin {#}
    Process {#}
    End {#}

<#
.SYNOPSIS
    This is a basic overview of what the script is used for..
 
.NOTES
    Name: Get-Something
    Author: eric@tonychachere.com
    Version: 1.0
    DateCreated: 2022-Sep-7
 
.EXAMPLE
    Get-Something -UserPrincipalName "username@contoso.com"
 
#>

}
