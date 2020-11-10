#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include "bsd/stdlib.h"

int
main(void) {
    printf("%s", getprogname());
    setprogname("malware");

    printf("%s", getprogname());
    sleep(10);
}
