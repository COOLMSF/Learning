#include<stdio.h>

int odd_ones(unsigned int x);
int is_odd(unsigned int x);

int
main(void) {
    if (odd_ones(123))
        puts("Odd bits of 1s");
    else
        puts("No");
}

int
odd_ones(unsigned int x) {
    int i;
    int n = 0;

    for (i = 0; i < sizeof(unsigned int) * 8; i++) {
        if (x >> i & 0x1)
            n++;
    }

    if (is_odd(i))
        return 1;

    return 0;
}

int
is_odd(unsigned int x) {
    return (x % 2) ? 0 : 1;
}
