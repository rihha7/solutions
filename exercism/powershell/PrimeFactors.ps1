<#
.SYNOPSIS
Returns the prime factors of a given number using 3 different methods.

.DESCRIPTION
Method 1: Returns prime factors using the GNU Coreutils `factor` command.
          Uses a double-quoted string (PowerShell parser) as -replace argument.

Method 2: Returns prime factors using the GNU Coreutils `factor` command.
          Uses a single-quoted string (Regex parser) as -replace argument.

Method 3: Returns prime factors using a while loop.

1 is not a prime number.
A prime number is only evenly divisible by itself and 1.
If a number is prime, a list of one value (itself) is returned.

.EXAMPLE
Invoke-PrimeFactors1 -Number 1
Returns: $null

Invoke-PrimeFactors1 -Number 2
Returns: @(2)

Invoke-PrimeFactors1 -Number 4
Returns: @(2, 2)

Invoke-PrimeFactors1 -Number 315
Returns: @(3, 3, 5, 7)

.OUTPUTS
[int[]]

.LINK
https://exercism.org/tracks/powershell/exercises/prime-factors
#>

Function Invoke-PrimeFactors1 {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int64]$Number # aka [long]
    )

    Return ((factor $Number) -replace "$Number`:" -split ' ').Where{ $_ }
}



Function Invoke-PrimeFactors2 {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int64]$Number
    )

    if ($factors = (factor $Number) -replace '\d+:\s*')
        { Return $factors -split ' ' }
}



Function Invoke-PrimeFactors3 {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int64]$Number
    )
    
    $n, $prime = $Number, 2
    
    Return @(
        while ($n -gt 1) {
            if ($n % $prime -eq 0)
                { $n /= $prime; $prime } # yielding $prime...
            else
                { if ($prime -eq 2) { $prime++ } else { $prime += 2 } }
        }
    )
}


$hasFactors = [bool](Get-Command Factor -ErrorAction SilentlyContinue)

Function Invoke-Test {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [int64]$TestInput,

        [Parameter(Mandatory)]
        [string]$Expected
    )

    if ($hasFactors) {
        "Invoke-PrimeFactors1 -Number $TestInput = `@($((Invoke-PrimeFactors1 -Number $TestInput) -join ", ")), expected: $Expected"
        "Invoke-PrimeFactors2 -Number $TestInput = `@($((Invoke-PrimeFactors2 -Number $TestInput) -join ", ")), expected: $Expected"
    }

    "Invoke-PrimeFactors3 -Number $TestInput = `@($((Invoke-PrimeFactors3 -Number $TestInput) -join ", ")), expected: $Expected"
    ""
}


Write-Output (Invoke-Test -TestInput 1 -Expected "@()")
Write-Output (Invoke-Test -TestInput 2 -Expected "@(2)")
Write-Output (Invoke-Test -TestInput 4 -Expected "@(2, 2)")
Write-Output (Invoke-Test -TestInput 6 -Expected "@(2, 3)")
Write-Output (Invoke-Test -TestInput 625 -Expected "@(5, 5, 5, 5)")
Write-Output (Invoke-Test -TestInput 93819012551 -Expected "@(11, 9539, 894119)")
