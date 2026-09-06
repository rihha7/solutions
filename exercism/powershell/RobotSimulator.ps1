<#
.SYNOPSIS
Rotates and moves a robot based on its cardinal direction and coordinates.

.DESCRIPTION
Creates a robot given a valid direction and integer X and Y coordinates.
The four valid cardinal directions are defined in the [Direction] enum.
A robot facing north at coordinates (0, 0) is instantiated if no arguments are provided.

Supports 3 valid instructions:
R: Rotate 90 degrees clockwise
L: Rotate 90 degrees anti-clockwise
A: Advance robot one step in the current direction

Exceptions will be thrown if an invalid instruction, an invalid direction (i.e., not in [Direction]), or non-integer coordinates are given. 

.PARAMETER Instruction
A string containing one or more instructions, where each character is used to rotate the robot or move it one position forward.

.EXAMPLE
$robot = [Robot]::new()
$robot.GetPosition()
Returns: @(0, 0)

$robot.Move("R")
Returns: @(0, 0)

$robot.Direction
Returns: [Direction]::NORTH

$robot.Move("X")
Throws: Throw "Error: Invalid instruction"

$robot2 = [Robot]::new('SOUTH', 1, '1')
Throws "Error: Invalid Y position"

$robot3 = [Robot]::new('SOUTH', '2', 2)
Throws "Error: Invalid X position"

$robot4 = [Robot]::new('UP', 0, 2)
Throws "Error: Invalid direction"

.OUTPUTS
[void]
[int[]]

.LINK
https://exercism.org/tracks/powershell/exercises/robot-simulator
#>

Enum Direction { NORTH; EAST; SOUTH; WEST }

Class Robot {
    [Direction]$Direction
    [System.Object]$Position

    Robot() {
        $this.Direction = [Direction]::NORTH
        $this.Position = [ordered]@{ X = 0; Y = 0 }
    }

    Robot([string]$cardinalDir, [object]$x, [object]$y) {
        if ($cardinalDir -notin 'NORTH', 'EAST', 'SOUTH', 'WEST')
            { Throw "Error: Invalid direction" }
        if ($x -isnot [int])
            { Throw "Error: Invalid X position" }
        if ($y -isnot [int])
            { Throw "Error: Invalid Y position" }
    
        $this.Direction = [Direction]::$cardinalDir
        $this.Position = [ordered]@{ X = $x; Y = $y }
    }

    # -----

    hidden [void] _Rotate([int]$step)
        { $this.Direction = [Direction]($this.Direction + $step + 4) % 4 }

    [void] Move([string]$Instruction) {
        $Instruction.ToCharArray().ForEach({
            switch ($_) {
                'L' { $this._Rotate(-1) }
                'R' { $this._Rotate(1) }
                'A' {
                    switch ($this.Direction) {
                        'NORTH' { $this.Position.Y++ }
                        'EAST'  { $this.Position.X++ }
                        'SOUTH' { $this.Position.Y-- }
                        'WEST'  { $this.Position.X-- }
                    }
                }

                default { Throw "Error: Invalid instruction" }
            }
        })
    }

    [int[]] GetPosition()
        { Return $this.Position.Values }
}
