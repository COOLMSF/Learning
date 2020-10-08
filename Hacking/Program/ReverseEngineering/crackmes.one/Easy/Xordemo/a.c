#include<stdio.h>
#include<string.h>

int
main(void) {
    int arr[] = { 0x10, 0x14, 0x0a, 0x05, 0x0c, 0x17, 0x0a, 0x02, 0x06 };
    char s[]  = "badbeef12";

    for (int i=0; i<9; i++) {
        for (int input=33; input<127; input++) {
            if ((input ^ s[i]) == arr[i]) {
                putchar(input);
                break;
            }
        }
    }
}
