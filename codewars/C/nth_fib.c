// Link: https://www.codewars.com/kata/522551eee9abb932420004a0/train/c

// Return the nth number in the Fibonacci Sequence where n >= 1.
// F₁ = 0, F₂ = 1

typedef unsigned long long ull;  // e.g., Expected: 12200160415121876738

// METHOD 1 (no recurse):
ull nth_fib_no_recurse(int n) {
    ull a = 0, b = 1, nextFib;

    if (n == 1) return a;
    if (n == 2) return b;
    
    while (n-- >= 3) {
        nextFib = a + b;
        a = b, b = nextFib;
    }

    return nextFib; // or b
}


// ---------------------------

// METHOD 2 (recurse helper):
ull fib_recurse_helper(int n, ull a, ull b) {
    if (n == 1) return a;
    return fib_recurse_helper(n - 1, b, a + b);
}

ull nth_fib_recurse(int n) {
    return fib_recurse_helper(n, 0, 1);
}



// ---------------------------

// TEST:
#include <stdio.h>

int main() {
    printf("\nTests For \"N-th Fibonacci\" [6 kyu]:\n----------------------------------\n");

    printf("nth_fib_no_recurse solution(1): %llu\n", nth_fib_no_recurse(1));
    printf("nth_fib_recurse solution(1):    %llu\n\n", nth_fib_recurse(1));

    printf("nth_fib_no_recurse solution(2): %llu\n", nth_fib_no_recurse(2));
    printf("nth_fib_recurse solution(2):    %llu\n\n", nth_fib_recurse(2));

    printf("nth_fib_no_recurse solution(4): %llu\n", nth_fib_no_recurse(4));
    printf("nth_fib_recurse solution(4):    %llu\n\n", nth_fib_recurse(4));

    printf("nth_fib_no_recurse solution(10): %llu\n", nth_fib_no_recurse(10));
    printf("nth_fib_recurse solution(10):    %llu\n", nth_fib_recurse(10));
    return 0;
}

