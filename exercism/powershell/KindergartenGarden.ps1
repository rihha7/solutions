<#
.SYNOPSIS
Returns the 4 plants a given student is responsible for in a class garden.

.DESCRIPTION
Represents a kindergarten class garden containing two rows of plants.
Four types of seeds planted: G (Grass), C (Clover), R (Radishes), V (Violets).

Students are alphabetically ordered, and are each assigned four plants in a cup (i.e., two consecutive from same index on each row).
GetPlants() returns the four plants assigned to a student.

.PARAMETER ClassGarden
[string] A string representation of a class garden. First letter of each seed is used to represent each plant. The 2 rows of plants are separated by a newline "`n".

.PARAMETER Students
[string[]] An optional list of students to be alphabetically ordered. When omitted, the default student list is used.

.PARAMETER Student
[string] The name of the student whose four assigned plants should be returned.

.EXAMPLE
$garden = [Garden]::new("RC`nGG")
$garden.GetPlants("Alice")
Returns: @(
    'Radishes', 'Clover', 'Grass', 'Grass'
)

.OUTPUTS
[string[]]

.LINK
https://exercism.org/tracks/powershell/exercises/kindergarten-garden
#>
Class Garden {
    [string[]]$ClassGarden
    [string[]]$Students
    [hashtable]$Seeds = @{ G="Grass"; C="Clover"; R="Radishes"; V="Violets" }
    
    Garden([string]$garden) {
        $this.ClassGarden = $garden -split "`n"
        $this.Students = @( "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry" )
    }

    Garden([string]$garden, [string[]]$children) {
        $this.ClassGarden = $garden -split "`n"
        $this.Students = $children | Sort-Object
    }

    # -----

    [string[]] GetPlants([string]$Student) {
        $ind = $this.Students.IndexOf($Student) * 2

        Return $this.ClassGarden.ForEach({
            $_[$ind..($ind + 1)].ForEach({ $this.Seeds["$_"] })
        })
    }
}
