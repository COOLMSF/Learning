#include<stdio.h>

/*
 *  I don't understand what syscall close(3) do here, 
 * it seems not working for anti debugging.
 */

int
main(void) {

    char auStack28[8] = { 0 };
    auStack28[0] = 0x41;
    auStack28[1] = 0x42;
    auStack28[2] = 0x43;
    auStack28[3] = 0x44;
    auStack28[4] = 0x45;
    auStack28[5] = 0x46;
    auStack28[6] = 0x47;
    auStack28[7] = 0x48;

    for (int i=0; i<8; i++) {
        putchar((auStack28[7-i]^auStack28[i])+0x40);
    }
}
