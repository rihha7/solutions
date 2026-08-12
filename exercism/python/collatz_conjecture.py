"""Each implementation returns the number of steps it takes to reach 1 using the Collatz Conjecture.

If `n` is even, divide it by 2.
If `n` is odd, multiply by 3 and add 1.

Example:
    >>> steps_while(10)
    6

Raises:
    ValueError: If `n` is less than 1.
"""

def steps_recurse(n: int) -> int:
    """Implements the Collatz Conjecture using recursion."""
    
    if (n < 1):
        raise ValueError("Only positive integers are allowed")
    if (n == 1):
        return 0
    
    return steps_recurse(n // 2) + 1 if n % 2 == 0 else steps_recurse(n * 3 + 1) + 1


def steps_tailrec(n: int, step_count: int = 0) -> int:
    """Implements the Collatz Conjecture using tail recursion."""
    
    if (n < 1):
        raise ValueError("Only positive integers are allowed")
    if (n == 1):
        return step_count
    
    return steps_tailrec(n // 2, step_count + 1) if n % 2 == 0 else steps_tailrec(n * 3 + 1, step_count + 1)


def steps_while(n: int, step_count: int = 0) -> int:
    """Implements the Collatz Conjecture using a while loop."""
    
    if (n < 1):
        raise ValueError("Only positive integers are allowed")

    num = n
    while num > 1:
        num = num // 2 if num % 2 == 0 else num * 3 + 1
        step_count += 1

    return step_count

