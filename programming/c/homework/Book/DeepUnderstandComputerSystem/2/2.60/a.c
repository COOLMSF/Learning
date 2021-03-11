#include<stdio.h>
#include<math.h>

/*
 * Warnning!!!
 * This proram is buggy, because integer is a complete object,
 * we cannot modify some of its bits
 */

typedef unsigned char * byte_pointer;

unsigned int 
replace_byte(unsigned int x, unsigned int n_byte, 
        unsigned int new_hex);

int
main(void) {
    int a = 0x12345678;
    printf("%#X\n", replace_byte(a, 0, 0xff));
}

unsigned int
replace_byte(unsigned int x, unsigned int n_byte,
        unsigned int new_hex) {

    byte_pointer p = (byte_pointer)&x;

    /*
    for (int cnt = n_byte, i = 0; i < cnt; i++) {
    }
    */

    //p[n_byte] = ((unsigned int)pow(new_hex, n_byte));
    p[n_byte] &= 0x00;
    printf("%x\n", p[n_byte]);
    p[n_byte] |= new_hex;
    printf("%x\n", p[n_byte]);

    printf("%x\n", *p);

    return *p;
}
