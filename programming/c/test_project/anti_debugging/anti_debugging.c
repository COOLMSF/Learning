#include<sys/ptrace.h>
#include<stdlib.h>
#include<stdio.h>

int
main(void) {
    if ( ptrace(PTRACE_TRACEME, 0, 0, 0) == -1) {
        puts("debugging found, exit!!!");
        exit(-1);
    } else {
        puts("not found");
    }
}
