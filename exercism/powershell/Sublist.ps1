Enum Sublist { SUBLIST; SUPERLIST; EQUAL; UNEQUAL }

Function Invoke-Sublist() {
    <#
    .SYNOPSIS
    Determines the relationship between two arrays.

    .DESCRIPTION
    Determines whether the first array is a sublist, superlist, equal to or unequal to the second.

    .PARAMETER Data1
    [System.Object[]] The main array; may contain any type.

    .PARAMETER Data2
    [System.Object[]] The array to compare to; may contain any type.

    .EXAMPLE
    Invoke-Sublist -Data1 @(1, 2, 3) -Data2 @()
    Returns: [Sublist]::SUPERLIST
    
    .OUTPUTS
    [Sublist] Inherits from [System.Enum]

    .LINK
    https://exercism.org/tracks/powershell/exercises/sublist
    #>
    [CmdletBinding()]
    Param (
        [object[]]$Data1,
        [object[]]$Data2
    )

    # -----

    if ($Data2.Count -gt $Data1.Count)
        { $large, $small = $Data2, $Data1 }
    else
        { $large, $small = $Data1, $Data2 }

    $isSublist = $False


    for ($i = 0; $i -le ($large.Count - $small.Count); $i++) {
        $count = 0
        for ($j = 0; $j -lt $small.Count; $j++) {
            if ($small[$j] -eq $large[$i + $j]) { $count++ }
        }
        
        if ($count -eq $small.Count) {
            $isSublist = $True
            break
        }
    }

    if (-not $isSublist)
        { Return [Sublist]::UNEQUAL }

    # guaranteed sublist...

    if ($small.Count -eq $large.Count)
        { Return [Sublist]::EQUAL }

    if ($small.Count -eq $Data1.Count)
        { Return [Sublist]::SUBLIST }
    
    Return [Sublist]::SUPERLIST
}
