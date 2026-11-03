// RGB To Hex Conversion [5kyu]

// Complete it so that passing in RGB DECIMAL values will result in a hexadecimal representation being returned.
// Valid decimal values for RGB are 0 - 255.
// Any values > 255, must be replaced with 255 (closest valid value).
// Any values < 0, must be replaced with 0 (closest valid value).
// Your answer should always be 6 characters long, the shorthand with 3 will not work here.

// Link: https://www.codewars.com/kata/513e08acc600c94f01000001/train/c

#include <stdio.h> // printf(), snprintf()

#define CLAMP_RGB(n) ((n) < 0 ? 0 : (n) > 255 ? 255 : (n))

// SOLUTION 1...
int rgb1(int r, int g, int b, char hex[6 + 1]) {
    *hex = '\0'; // for snprintf()

    return snprintf(hex, 7, "%02X%02X%02X",
                    CLAMP_RGB(r), CLAMP_RGB(g), CLAMP_RGB(b));
}


// SOLUTION 2...
void dec_to_hex(int dec, char hex[2 + 1]) {
    const char lookup_table[] = "0123456789ABCDEF";
    int i = 1;
    hex[2] = '\0';

    do {
        hex[i--] = lookup_table[dec % 16];
    } while ((dec /= 16) > 0);

    while (i >= 0) hex[i--] = '0';
}

int rgb2(int r, int g, int b, char hex[6 + 1]) {
    *hex = '\0';
  
    char r_buf[3], g_buf[3], b_buf[3];
    dec_to_hex(CLAMP_RGB(r), r_buf);
    dec_to_hex(CLAMP_RGB(g), g_buf);
    dec_to_hex(CLAMP_RGB(b), b_buf);

    return snprintf(hex, 7, "%s%s%s", r_buf, g_buf, b_buf);
}




int main(void) {
    printf("\nTests for \"RGB to Hex Conversion\" [5 kyu]:\n");
    printf("------------------------------------------\n");

    char output[7 + 1];

    rgb1(0, 0, 0, output);
    printf("rgb1(0, 0, 0, output) = %s, expected: \"000000\"\n", output);
    rgb2(0, 0, 0, output);
    printf("rgb2(0, 0, 0, output) = %s, expected: \"000000\"\n\n", output);

    rgb1(1, 2, 3, output);
    printf("rgb1(1, 2, 3, output) = %s, expected: \"010203\"\n", output);
    rgb2(1, 2, 3, output);
    printf("rgb2(1, 2, 3, output) = %s, expected: \"010203\"\n\n", output);

    rgb1(255, 255, 255, output);
    printf("rgb1(255, 255, 255, output) = %s, expected: \"FFFFFF\"\n", output);
    rgb2(255, 255, 255, output);
    printf("rgb2(255, 255, 255, output) = %s, expected: \"FFFFFF\"\n\n", output);

    rgb1(-20, 275, 125, output);
    printf("rgb1(-20, 275, 125, output) = %s, expected: \"00FF7D\"\n", output);
    rgb2(-20, 275, 125, output);
    printf("rgb2(-20, 275, 125, output) = %s, expected: \"00FF7D\"\n\n", output);

    return 0;
}
