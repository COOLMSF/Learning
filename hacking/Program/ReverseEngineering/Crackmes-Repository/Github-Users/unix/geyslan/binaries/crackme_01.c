#include<stdio.h>
#include<stdint.h>

const uint8_t buffer[6] = {
      0x1b, 0x04, 0x15, 0x02, 0x5c, 0x18 
          
};

int
main(void) {
    for (int i=0; i<6; i++) {
        for (int input=0x20; input<0x7f; input++) {
            if (buffer[i] == (input ^ 0x6c)) {
                putchar(input);
                continue;
            }
        }
        putchar('\n');
    }
}
