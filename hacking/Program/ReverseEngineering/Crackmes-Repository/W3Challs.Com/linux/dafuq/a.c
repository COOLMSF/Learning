#include<stdio.h>
int
main(void) {
    int a = 0xfde7f0da;
    int b = 0xffffff89;

    printf("%x\n", a & b);
}
