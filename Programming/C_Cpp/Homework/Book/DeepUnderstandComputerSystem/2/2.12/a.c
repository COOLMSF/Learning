#include<stdio.h>

int
main(void) {
    int a = 0x87654320;
    int b = 0xff;

    printf("%#X\n", a & b);
}
