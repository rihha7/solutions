// Dashatize it [6kyu]

// Given an integer, return a string with dash '-' marks before and after each odd digit, but do not begin or end the string with a dash mark.

// Link: https://www.codewars.com/kata/58223370aef9fc03fd000071/train/c

// SOLUTION 1: Tracks if previous digit is even, before inserting '-' before an odd digit. 
// SOLUTION 2: Inserts '-' on either side of an odd digit, and avoids duplicate dashes.
// SOLUTION 3: (BEST) Converts given number to a string and iterates over a copy.

#include <string.h> // strlen()

#define TO_UNSIGNED_INT(n) ((n) < 0 ? 0u - (unsigned int)(n) : (unsigned int)(n))

#define REVERSE(input, output, len) do { \
    for (size_t j = 0; j < len; j++) (output)[j] = (input)[(len) - 1 - j]; \
    (output)[(len)] = '\0'; \
} while (0)



// SOLUTION 1...

void dashatize1(int number, char string[32]) {
    char reversed[10 + 9 + 1];
    unsigned int n = TO_UNSIGNED_INT(number);
    int is_odd = 0;
    size_t i = 0;

    do {
        if (n == 0) {
            reversed[i++] = '0';
        } else {
            int rem = n % 10;
            if (i > 0 && !is_odd && rem % 2 == 1) reversed[i++] = '-';
            reversed[i++] = '0' + rem;
            is_odd = rem % 2;
            if (n >= 10 && is_odd) reversed[i++] = '-';
        }
    } while ((n /= 10) > 0);

    reversed[i] = '\0';

    REVERSE(reversed, string, strlen(reversed));
}



// SOLUTION 2...

void dashatize2(int number, char string[32]) {
    char reversed[10 + 9 + 1];
    unsigned int n = TO_UNSIGNED_INT(number);
    size_t i = 0;

    do {
        if (n == 0) {
            reversed[i++] = '0';
        } else {
            int rem = n % 10;
            int is_odd = rem % 2 != 0;
            if (is_odd && i > 0 && reversed[i - 1] != '-') reversed[i++] = '-';
            reversed[i++] = '0' + rem;
            if (n >= 10 && is_odd) reversed[i++] = '-';
        }
    } while ((n /= 10) > 0);

    reversed[i] = '\0';

    REVERSE(reversed, string, strlen(reversed));
}



// SOLUTION 3...

#include <stdlib.h> // llabs()
#include <stdio.h> // snprintf(), printf()

#define TO_UNSIGNED_INT(n) ((n) < 0 ? 0u - (unsigned int)(n) : (unsigned int)(n))

void dashatize3(int number, char string[32]) {
  char str[10+9+1];

  // snprintf(str, 21, "%llu", llabs(number));
  snprintf(str, 20, "%u", TO_UNSIGNED_INT(number)); // alternative to llabs()
  
  for (char *cpy = str; *cpy; cpy++) {
    if (*cpy & 1 && cpy != str && string[-1] != '-') *string++ = '-';
    *string++ = *cpy;
    if (*cpy & 1 && cpy[1]) *string++ = '-';
  }
  
  *string = '\0';
}





int main(void) {
    char actual[32];
    memset(actual, '@', sizeof(actual));

    dashatize1(-1111111111, actual);
    printf("\ndashatize1(-1111111111, actual) = %s, expected: \"1-1-1-1-1-1-1-1-1-1\"\n", actual);

    dashatize2(-1111111111, actual);
    printf("dashatize2(-1111111111, actual) = %s, expected: \"1-1-1-1-1-1-1-1-1-1\"\n", actual);

    dashatize3(-1111111111, actual);
    printf("dashatize3(-1111111111, actual) = %s, expected: \"1-1-1-1-1-1-1-1-1-1\"\n\n", actual);

    return 0;
}

