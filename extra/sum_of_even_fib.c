// Sum of Even Fibonacci...
// where the terms in the Fibonacci sequence do not exceed 4000000...

typedef unsigned long long ull;

ull sum_of_even_fib() {
    ull sum = 0;
    ull a = 2, b = 8, nextEvenFib;

    sum += a, sum += b;

    while (1) {
        nextEvenFib = a + (b * 4);
        if (nextEvenFib > 4000000) break; // allow 4000000, but no value greater

        a = b, b = nextEvenFib;
        sum += b;
    }

    return sum;
}



#include <stdio.h>

int main(void) {
    printf("\nSum Of Even Fibonacci\n\033[3mwhere final term doesn't exceed 4 million\033[0m\n");
    printf("-----------------------------------------\n");
    printf("sum_of_even_fib()\n");
    printf("Got: %llu, Expected: 4613732\n", sum_of_even_fib());

    return 0;
}
