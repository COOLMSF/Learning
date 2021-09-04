#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int __attribute__((cdecl)) fun(int a, int b);

int
main(void) {
    fun(1, 2);
}


int
__attribute__((cdecl))
    fun(int a, int b) {
        char buf[10];

        memset(buf, 0, 10);
        return a + b;
    }
