<#
.SYNOPSIS
Assigns each robot a random, unique name that can be reassigned with Reset().

.DESCRIPTION
Each name must be in the format: "^[A-Z]{2}\d{3}$" (e.g., AB123). Characters may repeat.
Each name is globally unique and can only be assigned once. Robots cannot share the same name and calling Reset() must also reassign a completely new and unique name.

.EXAMPLE
$robot1 = [Robot]::new()
$initialName = $robot1.Name

$robot1.Reset()
$secondName = $robot1.Name

$thirdName = [Robot]::new().Name

$initialName -ne $secondName -and $secondName -ne $thirdName -and $initialName -ne $thirdName
Returns: $True

.OUTPUTS
[void]

.LINK
https://exercism.org/tracks/powershell/exercises/robot-name
#>

Class Robot {
    [string]$Name
    static [System.Collections.Generic.HashSet[string]]$Names = [System.Collections.Generic.HashSet[string]]::new()
   
    Robot()
        { $this.Name = $this._GenerateUniqueName() }

    [void] Reset()
        { $this.Name = $this._GenerateUniqueName() }

    hidden [string] _GenerateUniqueName() {
        do {
            $prefix = (1..2).ForEach{ [char](Get-Random -Min 65 -Max 91) }
            $suffix = (1..3).ForEach{ Get-Random -Maximum 10 }
            $uniqueName = -join ($prefix + $suffix)
        } while ([Robot]::Names.Add($uniqueName) -eq $False)

        Return $uniqueName
    }
}

