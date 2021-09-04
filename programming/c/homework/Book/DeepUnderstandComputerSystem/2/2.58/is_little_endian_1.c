#include<stdio.h>
#include<string.h>
#include<assert.h>

typedef unsigned char *byte_pointer;

int is_little_endian(void);

int
main(void) {
    if (is_little_endian())
        puts("yes");
    else
        puts("no");

    return 0;
}

int
is_little_endian(void) {

    /*
     * Int is 4 bytes
     */

    int test = 0x12345678;
    unsigned char *buf;

    buf = (unsigned char *)&test;

    if (buf[0] == 0x78)
        return 1;
    else
        return 0;
}
