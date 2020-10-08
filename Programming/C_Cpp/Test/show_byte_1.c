#include<stdio.h>

// typedef unsigned char *byte_pointer;

// void show_byte(byte_pointer, int);
void show_byte(char *, int);

int
main(void) {
    char c = 'A';
    int w = 0x12345;

    // show_byte((byte_pointer)&w, sizeof(int));
    show_byte(&w, sizeof(int));
}

void
show_byte(char *p, int len) {
    for (int i=0; i<len; i++)
        printf("%.2x", *(p+i));
}
