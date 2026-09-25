// Nth even Fibonacci...

// Nth fib starting from 1, 2:   1 2 3 5 8 13 21 34 55 89 144
// Nth even fib:                 _ 2 _ _ 8 __ __ 34 __ __ 144

// Every 3rd term is an even Fibonacci number, with an offset of 1
// ==> 3n - 1 (if starting from 1, 2)
//    e.g., 2nd even = 3(2) - 1 = 5, fib(5) = 8

typedef unsigned long long ull;

ull nth_even_fib1(int n) {
    ull a = 1, b = 2, nextFib;

    int count = 1, limit = n * 3 - 1;

    while (count < limit) {
        nextFib = a + b;
        a = b, b = nextFib;
        count++;
    }

    return a;
}

ull nth_even_fib2(int n) {
    ull a = 2, b = 8, nextFib;

    if (n == 1) return a;
    if (n == 2) return b;

    while (n-- > 2) {
        nextFib = b * 4 + a;
        a = b, b = nextFib;
    }

    return b;
}



#include <stdio.h>

int main(void) {
    printf("\nNth even fib starting from 1, 2:\n");
    printf("--------------------------------\n");
    printf("using 3n - 1:  nth_even_fib1(1) = %llu, expected: 2\n",  nth_even_fib1(1));
    printf("standard:      nth_even_fib2(1) = %llu, expected: 2\n\n",  nth_even_fib2(1));

    printf("using 3n - 1:  nth_even_fib1(2) = %llu, expected: 8\n",  nth_even_fib1(2));
    printf("standard:      nth_even_fib2(2) = %llu, expected: 8\n\n",  nth_even_fib2(2));

    printf("using 3n - 1:  nth_even_fib1(3) = %llu, expected: 34\n",  nth_even_fib1(3));
    printf("standard:      nth_even_fib2(3) = %llu, expected: 34\n\n",  nth_even_fib2(3));

    printf("using 3n - 1:  nth_even_fib1(4) = %llu, expected: 144\n",  nth_even_fib1(4));
    printf("standard:      nth_even_fib2(4) = %llu, expected: 144\n\n",  nth_even_fib2(4));

    printf("using 3n - 1:  nth_even_fib1(10) = %llu, expected: 832040\n",  nth_even_fib1(10));
    printf("standard:      nth_even_fib2(10) = %llu, expected: 832040\n\n",  nth_even_fib2(10));

    return 0;
}
