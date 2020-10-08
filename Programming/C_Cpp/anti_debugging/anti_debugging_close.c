#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int
main(void) {
    puts("Anti debugging by close");

    /*
     * The program which not being debugged open fd 0, 1, 2.
     *
     */

    if (close(3) != -1) {
        puts("debugger detected");
        exit(-1);
    }

    puts("debugger not detected");

    return 0;
}
