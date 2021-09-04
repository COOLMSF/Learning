#include<stdio.h>
#include<string.h>

typedef unsigned char *byte_pointer;

void show_byte(byte_pointer, int);

int
main(void) {
    const char *c = "abcdef";

    show_byte((byte_pointer)c, strlen(c));
}

void
show_byte(byte_pointer p, int len) {
    for (int i=0; i<len; i++)
        printf("%.2x", *(p+i));
}
