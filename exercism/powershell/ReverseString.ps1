Function Get-ReverseString() {
    <#
    .SYNOPSIS
    Reverses a given string.

    .PARAMETER Forward
    [string] The text to be reversed (can be empty).

    .EXAMPLE
    Get-ReverseString -Forward "Hello."
    Returns: ".olleH"
    
    .OUTPUTS
    [string]

    .LINK
    https://exercism.org/tracks/powershell/exercises/reverse-string
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Position=0, ValueFromPipeline=$True)]
        [string]$Forward
    )

    Return -join $Forward[($Forward.Length - 1)..0]
}
