#include<stdio.h>
#include<math.h>

typedef unsigned char * byte_pointer;

unsigned int 
replace_byte(unsigned int x, unsigned int n_byte, 
        unsigned int new_hex);

int
main(void) {
    int a = 0x12345678;
    printf("%#X\n", replace_byte(a, 2, 0xff));
}

unsigned int
replace_byte(unsigned int x, unsigned int n_byte,
        unsigned int new_hex) {

    /*
     *   For some secure reason,
     *   integer overflow may happen here.
     */

    if (new_hex > sizeof(unsigned int) - 1)
        return x;

    unsigned int mask = new_hex << n_byte * 8;

    return (x & ~mask) | mask;
}
