Enum Allergens {
    eggs = 1
    peanuts = 2
    shellfish = 4
    strawberries = 8
    tomatoes = 16
    chocolate = 32
    pollen = 64
    cats = 128
}

<#
.SYNOPSIS
Determines which allergens a person is allergic to based on their allergy score.

.DESCRIPTION
Each allergen and their numeric score is defined by the [Allergens] enum.
Ignores allergens with a score > 128.

IsAllergicTo() checks whether a person is allergic to a given item.
GetAllergies() returns an array of items a person is allergic to, in the order defined by the [Allergens] enum.

.PARAMETER item
[string] The allergen to be checked by the IsAllergicTo() method.

.EXAMPLE
$person = [Allergies]::new(248)

$person.IsAllergicTo("eggs")
Returns: $False

$person.GetAllergies()
Returns: @("strawberries", "tomatoes", "chocolate", "pollen", "cats")

.OUTPUTS
[bool]
IsAllergicTo() returns $True if a person is allergic to the item; otherwise $False.

[string[]]
GetAllergies() returns an array of allergens as strings.

.LINK
https://exercism.org/tracks/powershell/exercises/allergies
#>

Class Allergies {
    [int]$AllergyScore
    
    Allergies([int]$score)
        { $this.AllergyScore = $score % 256 }

    [bool] IsAllergicTo([string]$item) {
        Return ($this.AllergyScore -band [int]([Allergens]::$item)) -ne 0
    }

    [string[]] GetAllergies() {
        Return [Allergens].GetEnumNames().Where{ $this.IsAllergicTo($_) }
    }
}
