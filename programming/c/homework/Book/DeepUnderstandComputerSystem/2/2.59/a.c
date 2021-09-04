#include<stdio.h>

unsigned int fun(unsigned int x, unsigned int y);

int
main(void) {
    printf("%#X", fun(0x12345678, 0x87654321));
}

unsigned int
fun(unsigned int x, unsigned int y) {
    return ((x & 0xff) | (y & ~0xff));
}
