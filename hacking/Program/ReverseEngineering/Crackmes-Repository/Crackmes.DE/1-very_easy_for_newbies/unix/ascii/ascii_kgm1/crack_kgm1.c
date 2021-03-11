#include<stdio.h>
#include<stdint.h>

#define _BUFFER_SIZE 8
const uint8_t buffer[_BUFFER_SIZE] = {
  0x45, 0x36, 0xab, 0xc8, 0xcc, 0x11, 0xe3, 0x7a
};

/*
 * result is the password that we input, the password
 * is a 10 element string which contain '\n', we make
 * the 8 element 'abcdefgh', and guess the last element.
 */

char result[_BUFFER_SIZE] = {
    'z', 'b', 'c', 'd', 'e', 'f', 'g', 'h'
};

int
main(void) {
    for (int guess=0x20; guess<0x7f; guess++) {
        int sum = 0;
        for (int i=0; i<8; i++) {
            result[i] ^= buffer[i];
            sum += result[i];
        }

        if ((char)sum == guess) {
            putchar(guess);
            break;
        }
    }
}
