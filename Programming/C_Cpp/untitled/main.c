//
// Created by coolder on 10/4/20.
//
#include <stdio.h>
#include <libnet.h>

int
main(void) {
    char *a;

    a = getenv("PATH");

    printf("%s", a);
}
