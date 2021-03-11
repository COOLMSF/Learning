#include<stdio.h>

int int_shifts_are_arithmetic(void);

int
main(void) {
    if (int_shifts_are_arithmetic())
        puts("Yes");
    else
        puts("No");
}

int
int_shifts_are_arithmetic(void) {
    return !((~0 >> 1) ^ ~0);
}
