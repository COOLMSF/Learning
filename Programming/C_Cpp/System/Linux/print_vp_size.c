#include<stdio.h>
#include<unistd.h>

int
main(void) {
    printf("pv size:%ld\n", sysconf(_SC_PAGESIZE));
}
