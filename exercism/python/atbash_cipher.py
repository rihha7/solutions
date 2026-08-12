from textwrap import fill, wrap
from itertools import batched
from string import ascii_lowercase

ATBASH_TR = str.maketrans(ascii_lowercase, ascii_lowercase[::-1], " .,")

def decode(ciphertext: str) -> str:
    """Decodes text using the atbash cipher.
    
    Atbash normalizes and encodes plaintext (a-z) using its inverse (z-a) as the cipher.
    To normalize the text, lowercase it and remove spaces, non-letters and non-digits.

    Example:
        >>> decode("nrmwy oldrm t123")
        "mindblowing123"
    """
    return ciphertext.lower().translate(ATBASH_TR)

# ---

def encode_fill(plaintext: str) -> str:
    """Encodes text using the Atbash cipher (reuses decode) and groups using  `textwrap.fill`.
    Atbash encoding inserts a space after every 5 chars.
    """
    encoded = fill(decode(plaintext), 5)
    return encoded.replace("\n", " ")


def encode_wrap(plaintext: str) -> str:
    """Encodes using the Atbash cipher and groups using `textwrap.wrap`."""
    chunks = wrap(decode(plaintext), 5)
    return " ".join(chunks)


def encode_slicing(plaintext: str) -> str:
    """Encodes using the Atbash cipher and groups using built-in slicing (no imports)."""
    encoded = decode(plaintext)
    return " ".join(encoded[start:start+5] for start in range(0, len(encoded), 5))


def encode_batched(plaintext: str) -> str:
    """Encodes using the Atbash cipher and groups using `itertools.batched`."""
    encoded = batched(decode(plaintext), 5)
    return " ".join("".join(chunk) for chunk in encoded)

