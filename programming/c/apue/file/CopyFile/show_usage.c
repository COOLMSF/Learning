//
// Created by coolder on 10/18/20.
//

#include "stdio.h"
#include "stdlib.h"

void
show_usage(void) {
    fprintf(stderr, "Usage:a.out --source src_file(-s) --destination(-d) dst_file\n");
    exit(EXIT_FAILURE);
}

