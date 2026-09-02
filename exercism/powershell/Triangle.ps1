Enum Triangle { EQUILATERAL; ISOSCELES; SCALENE }

Function Get-Triangle() {
    <#
    .SYNOPSIS
    Determines whether a triangle is equilateral, isosceles, or scalene.
    
    .DESCRIPTION
    A valid triangle must have three positive side lengths (all greater than 0).
    
    The side lengths must satisfy the triangle inequality; the sum of any two sides must be greater than or equal to the third:
        a + b >= c
        a + c >= b
        b + c >= a

    An equilateral triangle is a triangle where all sides are the same.
    An isosceles triangle has at least two identical side lengths.
    A scalene triangle has three different side lengths.
    
    The corresponding triangle type is returned as an enum member.

    .PARAMETER Sides
    The three side lengths of a triangle, represented as an array.
    
    .EXAMPLE
    Get-Triangle -Sides @(0, -1, 2)
    Throws: "All side lengths must be positive."

    Get-Triangle -Sides @(3, 1, 1)
    Throws: "Side lengths violate triangle inequality."

    Get-Triangle -Sides @(3, 5, 5)
    Returns: [Triangle]::ISOSCELES
    
    .OUTPUTS
    [Triangle]
    
    .LINK
    https://exercism.org/tracks/powershell/exercises/triangle
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [ValidateCount(3, 3)]
        [ValidateScript({
            if ($_ -le 0)
                { Throw "All side lengths must be positive." }
            Return $True
        })]
        [double[]]$Sides
    )

    # -----

    $a, $b, $c = $Sides | Sort-Object
    if ($a + $b -lt $c) { Throw "Side lengths violate triangle inequality." }

    $uniqueCount = ($Sides | Select-Object -Unique).Count

    if ($uniqueCount -eq 1)
        { Return [Triangle]::EQUILATERAL }
    if ($uniqueCount -le 2)
        { Return [Triangle]::ISOSCELES }
    Return [Triangle]::SCALENE
}
