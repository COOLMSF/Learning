#include<stdio.h>
#include<stdint.h>

const uint8_t buffer[0xa] = {
      0xf7, 0xf8, 0xf1, 0xf4, 0xf1, 0xf8, 0xb3, 0xfc, 0xfc, 0x00
          
};

int
main(void) {
    for (int i=0x0; i<0xa; i++)
        for (int input=0x20; input<0x7f; input++) {
            if (buffer[i] == (input | 0x90)) {
                putchar(input);
                break;
            }
        }
}
