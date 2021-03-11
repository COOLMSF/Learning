#include<stdio.h>
#include<string.h>

int
main(void) {
    char buf[] = "akhb~chdaZrdaZudqduvdZvvv|";

    for (int i = 0; i < strlen(buf); i++)
        printf("%c", (buf[i] - 1) ^ 6);
    putchar('\n');
}
