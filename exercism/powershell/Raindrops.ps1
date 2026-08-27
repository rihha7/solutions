Function Get-Raindrops() {
    <#
    .SYNOPSIS
    Converts given number into raindrop sounds.

    .DESCRIPTION
    Returns in order a string of all sounds made:
    If number is divisible by 3, sound "Pling" is made.
    If number is divisible by 5, sound "Plang" is made.
    If number is divisible by 7, sound "Plong" is made.

    .PARAMETER Rain
    [int] A number representing raindrop sounds.

    .EXAMPLE
    Get-Raindrops -Rain 15
    Returns: "PlingPlang"
    
    .OUTPUTS
    [string]

    .LINK
    https://exercism.org/tracks/powershell/exercises/raindrops
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int]$Rain
    )

    # ----

    $sounds = switch ($Rain) {
        { $_ % 3 -eq 0 } { "Pling" }
        { $_ % 5 -eq 0 } { "Plang" }
        { $_ % 7 -eq 0 } { "Plong" }
        default   { $_ -as [string] }
    }

    Return -join $sounds
}
