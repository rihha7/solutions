// Link: https://www.codewars.com/kata/513e08acc600c94f01000001/train/c

// Valid decimal values for RGB are 0 - 255.
// Any values > 255, must be replaced with 255 (closest valid value).
// Any values < 0, must be replaced with 0 (closest valid value).

#include <stdio.h> // printf and snprintf

#define CLAMP_RGB(n) ((n) < 0 ? 0 : (n) > 255 ? 255 : (n))  // for method 3

int clamp_rgb(int n)  // for method 2
  { return (n < 0) ? 0 : (n > 255) ? 255 : n; }


// Method 1:
int rgb1(int r, int g, int b, char hex[6 + 1]) {
    *hex = '\0';

    if (r < 0) r = 0;
    if (r > 255) r = 255;
  
    if (g < 0) g = 0;
    if (g > 255) g = 255;
  
    if (b < 0) b = 0;
    if (b > 255) b = 255;
  
    return snprintf(hex, 7, "%02X%02X%02X", r, g, b);
}


// Method 2:
int rgb2(int r, int g, int b, char hex[6 + 1]) {
    *hex = '\0';
    return snprintf(hex, 7, "%02X%02X%02X", clamp_rgb(r), clamp_rgb(g), clamp_rgb(b));
}


// Method 3:
void dec_to_hex(int n, char result[2 + 1]) {
    result[2] = '\0';
    int index = 1;
    const char lookup_table[] = "0123456789ABCDEF";

    do {
        result[index--] = lookup_table[n % 16];
    } while ((n/= 16) > 0);

    // method 1:
    // if (index == -1) return; // check index, not result (pointer)!
    // result[0] = '0';

    // method 2:
    while (index >= 0) result[index--] = '0';
}

int rgb3(int r, int g, int b, char hex[6 + 1]) {
    *hex = '\0';
  
    char r_buffer[2 + 1], g_buffer[2 + 1], b_buffer[2 + 1];

    dec_to_hex(CLAMP_RGB(r), r_buffer);
    dec_to_hex(CLAMP_RGB(g), g_buffer);
    dec_to_hex(CLAMP_RGB(b), b_buffer);

    return snprintf(hex, 6 + 1, "%s%s%s",
                    r_buffer, g_buffer, b_buffer);
}




int main(void) {
    printf("\nTests for \"RGB to Hex Conversion\" [5 kyu]:\n");
    printf("------------------------------------------\n");

    char output[7 + 1];

    rgb1(0, 0, 0, output);
    printf("rgb1(0, 0, 0, output) = %s, expected: \"000000\"\n", output);

    rgb2(0, 0, 0, output);
    printf("rgb2(0, 0, 0, output) = %s, expected: \"000000\"\n", output);

    rgb3(0, 0, 0, output);
    printf("rgb3(0, 0, 0, output) = %s, expected: \"000000\"\n\n", output);



    rgb1(1, 2, 3, output);
    printf("rgb1(1, 2, 3, output) = %s, expected: \"010203\"\n", output);

    rgb2(1, 2, 3, output);
    printf("rgb2(1, 2, 3, output) = %s, expected: \"010203\"\n", output);

    rgb3(1, 2, 3, output);
    printf("rgb3(1, 2, 3, output) = %s, expected: \"010203\"\n\n", output);



    rgb1(255, 255, 255, output);
    printf("rgb1(255, 255, 255, output) = %s, expected: \"FFFFFF\"\n", output);

    rgb2(255, 255, 255, output);
    printf("rgb2(255, 255, 255, output) = %s, expected: \"FFFFFF\"\n", output);

    rgb3(255, 255, 255, output);
    printf("rgb3(255, 255, 255, output) = %s, expected: \"FFFFFF\"\n\n", output);



    rgb1(-20, 275, 125, output);
    printf("rgb1(-20, 275, 125, output) = %s, expected: \"00FF7D\"\n", output);

    rgb2(-20, 275, 125, output);
    printf("rgb2(-20, 275, 125, output) = %s, expected: \"00FF7D\"\n", output);

    rgb3(-20, 275, 125, output);
    printf("rgb3(-20, 275, 125, output) = %s, expected: \"00FF7D\"\n\n", output);

    return 0;
}
