#include<stdio.h>

int odd_ones(unsigned int x);
int is_odd(unsigned int x);

int
main(void) {
    if (odd_ones(44))
        puts("Yes");
    else
        puts("No");

    return 0;
}

int
odd_ones(unsigned int x) {
    unsigned int n_bits = sizeof(unsigned int);

    for (int i=1; i <= n_bits; i++) {
        if (is_odd(i) && ((x >> (i - 1)) & 0x1))
            return 1;
    }

    return 0;
}

int
is_odd(unsigned int x) {
    return (x % 2) ? 1 : 0;
}
