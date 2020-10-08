#include<stdio.h>

int
main(void) {
    int a = 0;

    puts("Input a number:");
    scanf("%d", &a);

    switch(a) {
        case 0 ... 10:
            puts("0...10");
            break;
        case 100 ... 200:
            puts("100...200");
            break;
    }
}
