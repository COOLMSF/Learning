#include<stdio.h>

int
main(void) {
  char buf[] = { 28, 40, 120, -101, 1, 112, 45, -98, 76, 124, 124, -56, 77, 116, 33, -102, 27, 33, 32, -59, 73, 39, 41, -60, 77, 37, 120, -103, 24, 112, 122, -53, 74,124, 33, -98, 78, 57 };

	char v8[] = { 0x7a, 0x44, 0x19, 0xfc };
    for ( int k = 0; k <= 37; ++k )
      putchar(buf[k] ^ v8[k % 4]);

}