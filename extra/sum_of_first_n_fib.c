// Sum of First N Fibonacci terms...

// Nth Fib starting from 0, 1:   0 1 1 2 3 5 8 13
// Sum of the first Nth fib:     Fibonacci(n + 2) - 1

// Nth Fib starting from 1, 2:   1 2 3 5 8 13 21
// Sum of the first Nth fib:     Fibonacci(n + 2) - 2

// Sum:  Fibonacci(n + 2) - offset
// Hint: start with e.g., 13, and find the closest Fibonacci sum:
//       0 + 1 + 1 + 2 + 3 + 5 = 12
//       => so offset = 13 - 12 = 1

typedef unsigned long long ull;

ull sum_of_first_n_fib1(int n) {
    ull a = 0, b = 1, nextFib;

    n += 2;

    if (n == 1) return a;
    if (n == 2) return b;

    while (n-- >= 3) {
        nextFib = a + b;
        a = b, b = nextFib;
    }

    return nextFib - 1;
}


ull sum_of_first_n_fib2(int n) {
    ull a = 1, b = 2, nextFib;

    n += 2;
    
    if (n == 1) return a;
    if (n == 2) return a + b;

    while (n-- >= 3) {
        nextFib = a + b;
        a = b, b = nextFib;
    }

    return nextFib - 2;
}



#include <stdio.h>

int main(void) {
    printf("\nSum of First N Fibonacci terms:\n");
    printf("-------------------------------\n");

    printf("starting from 0, 1:  sum_of_first_n_fib1(1) = %llu, expected: 0\n", sum_of_first_n_fib1(1));
    printf("starting from 1, 2:  sum_of_first_n_fib2(1) = %llu, expected: 1\n\n", sum_of_first_n_fib2(1));

    printf("starting from 0, 1:  sum_of_first_n_fib1(2) = %llu, expected: 1\n", sum_of_first_n_fib1(2));
    printf("starting from 1, 2:  sum_of_first_n_fib2(2) = %llu, expected: 3\n\n", sum_of_first_n_fib2(2));

    printf("starting from 0, 1:  sum_of_first_n_fib1(3) = %llu, expected: 2\n", sum_of_first_n_fib1(3));
    printf("starting from 1, 2:  sum_of_first_n_fib2(3) = %llu, expected: 6\n\n", sum_of_first_n_fib2(3));

    printf("starting from 0, 1:  sum_of_first_n_fib1(4) = %llu, expected: 4\n", sum_of_first_n_fib1(4));
    printf("starting from 1, 2:  sum_of_first_n_fib2(4) = %llu, expected: 11\n\n", sum_of_first_n_fib2(4));

    printf("starting from 0, 1:  sum_of_first_n_fib1(5) = %llu, expected: 7\n", sum_of_first_n_fib1(5));
    printf("starting from 1, 2:  sum_of_first_n_fib2(5) = %llu, expected: 19\n\n", sum_of_first_n_fib2(5));

    return 0;
}
