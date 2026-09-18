<#
.SYNOPSIS
Implements the Vigenère cipher, a simple substitution cipher.

.DESCRIPTION
Encodes text by shifting each letter forward according to the character at the corresponding position (index) in the given lowercase string key.

E.g., if the key only contains the letter "a", the key is reused cyclically, resulting in every letter to shift forward with a step of 0.

If no key is provided, a key consisting of 100 randomly generated lowercase letters is set.

`Decode` shifts the characters of the ciphertext backwards, to reveal the original plaintext.

.PARAMETER key
The key/cipher used to encrypt or decrypt the given text.

.PARAMETER plaintext
The plaintext to be encrypted using simple subsitution cipher.

.PARAMETER ciphertext
The ciphertext to be decrypted using simple subsitution cipher.

.EXAMPLE
$cipher1 = [SimpleCipher]::new()
$text    = "abcdefghij"

$cipher1.Decode($cipher1.Encode($text))
Returns: "abcdefghij"

$cipher1._key.Length -ge 100
Returns: $True

$cipher2 = [SimpleCipher]::new("abc")
$cipher2.Decode("iboaqcnecbfcr")
Returns: "iamapandabear"

.OUTPUTS
[string]

.LINK
https://exercism.org/tracks/powershell/exercises/simple-cipher
#>

Class SimpleCipher {
    [string]$_key

    SimpleCipher([string]$key)
        { $this._key = $key }
    SimpleCipher() {
        $this._key = -join (1..100).ForEach({
            [char](Get-Random -Min 97 -Max 123)
        })
    }

    # -----

    hidden [string] _Transform([string]$text, [int]$dir) {
        $result = for ($i = 0; $i -lt $text.Length; $i++) {
            $shift = $this._key[$i % $this._key.Length] - 97
            [char](($text[$i] - 97 + ($shift*$dir) + 26) % 26 + 97)
        }
        Return -join $result
    }
    
    [string] Encode([string]$plaintext)
        { Return $this._Transform($plaintext, 1) }

    [string] Decode([string]$ciphertext)
        { Return $this._Transform($ciphertext, -1) }
}
