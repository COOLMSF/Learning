#include<stdio.h>

int
main(void) {
    int a = 0x87654321;

    int b = ~(~0 ^ 0xff);

    /*
     * get 0x876543 but 0x21
     */
    
    int c = a & (~0 ^ 0xff);

    printf("%#X\n", c | b);
}
