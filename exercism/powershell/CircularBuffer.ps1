<#
.SYNOPSIS
Implements a circular buffer data structure.

.DESCRIPTION
Initialises a buffer of a fixed size, `bufSize`.

Items can be added to a non-full buffer using Write(). However, attempting to write to a full buffer will throw an exception. Overwrite() allows the buffer to be written to, even if buffer is full.

Reading from a buffer pops out the oldest item, removing it. Attempting to read from an empty buffer will throw an exception.
Read and write positions must be tracked independently so that items can be read in FIFO order.

All items can be removed from a buffer using Clear().

.PARAMETER bufSize
The maximum number of items the buffer can hold.

.PARAMETER item
The item to add to the buffer when Write() or Overwrite() is called, provided the buffer is not full.
If Overwrite() is called on a full buffer, item will replace the oldest value, and read index will be incremented to the next oldest value.

.EXAMPLE
$buffer = [CircularBuffer]::new(2)
$buffer.Write(1)
$buffer.Write(2)
$buffer.Write(4)
Throws: "BufferError: Circular buffer is full"

$buffer.Overwrite(3)
$buffer.Read()
Returns: 2

$buffer.Read()
Returns: 3

$buffer.Read()
Throws: "BufferError: Circular buffer is empty"

.OUTPUTS
[void]
[int]

.LINK
https://exercism.org/tracks/powershell/exercises/circular-buffer
#>

Class CircularBuffer {
    [int[]]$Buffer
    [int]$Size
    [int]$Count
    [int]$writeIndex
    [int]$readIndex
    
    CircularBuffer([int]$bufSize) {
        $this.Size = $bufSize
        $this.Buffer = [int[]]::new($bufSize)
    }

    # ----

    hidden [void] _AdvanceReadIndex()
        { $this.readIndex = ($this.readIndex + 1) % $this.Size }

    hidden [void] _AdvanceWriteIndex()
        { $this.writeIndex = ($this.writeIndex + 1) % $this.Size }
    
    [void] Write([int]$item) {
        if ($this.Count -eq $this.Size)
            { Throw "BufferError: Circular buffer is full" }

        $this.Buffer[$this.writeIndex] = $item
        $this._AdvanceWriteIndex()
        $this.Count++
    }

    [void] Overwrite([int]$item) {
        if ($this.Count -lt $this.Size) {
            $this.Write($item)
        } else {
            $this.Buffer[$this.writeIndex] = $item
            $this._AdvanceWriteIndex()
            $this._AdvanceReadIndex()
        }
    }

    [void] Clear() {
        $this.Buffer = [int[]]::new($this.Size)
        $this.readIndex = $this.writeIndex = $this.Count = 0
    }

    [int] Read() {
        if ($this.Count -eq 0)
            { Throw "BufferError: Circular buffer is empty" }

        $item = $this.Buffer[$this.readIndex]
        $this._AdvanceReadIndex()
        $this.Count--
        
        Return $item
    }
}

