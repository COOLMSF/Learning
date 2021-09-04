#include<stdio.h>

int
main(void) {
    char buf[0x10];

    fgets(buf, 0x30, stdin);
}
