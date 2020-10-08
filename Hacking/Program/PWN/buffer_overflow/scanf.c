#include<stdio.h>

void fun(void);

int
main(void) {
    fun();
}

void
fun(void) {
    char buf[0x10];

    scanf("%s", buf);
}
