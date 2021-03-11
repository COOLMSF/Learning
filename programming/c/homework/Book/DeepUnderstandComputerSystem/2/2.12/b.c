#include<stdio.h>

int
main(void) {

    int a = 0x87654321;
    int b = 0xff;

    /*
     * C is the last bit 0x21
     */

    int c = a & b;

    /*
     * Get 0x876543 but 0x21
     */

    int d = ~0 ^ 0xff;
    int e = a & d;

    /*
     * Get fanma(ping yin) of 0x876543 and get 0x21 of last bit
     */

    int f = ~e;
    int g = f ^ 0xff;
    int h = g | c;

    printf("%#X\n", h);
}
