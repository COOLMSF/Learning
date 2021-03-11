#include<stdio.h>
#include<string.h>

int
main(void) {
    char encrypted_str[] = "akhb~chdaZrdaZudqduvdZvvv|";

    for (int i = 0; i < strlen(encrypted_str); i++) {
        putchar((encrypted_str[i] - 1) ^ 6);
    }
}
