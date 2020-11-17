//
// Created by coolder on 11/17/20.
//
#include "box.h"
#include "allheaders.h"

void print_map(void) {

    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {
            printf("%c", map[i][j]);
        }
        putchar('\n');
    }
}
