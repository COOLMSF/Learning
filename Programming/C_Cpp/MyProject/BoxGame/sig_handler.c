//
// Created by coolder on 11/17/20.
//
#include "allheaders.h"

void sig_handler(void) {

    puts("SIGINT caught");
    puts("Exited");

    exit(EXIT_SUCCESS);
}

