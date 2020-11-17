//
// Created by coolder on 11/17/20.
//
#include "box.h"

int my_x, my_y;

void init(void) {

    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {

            // If find myself, save it
            if ('w' == map[i][j]) {
                my_x = i;
                my_y = j;
            }

            // Count box in the map
            if ('*' == map[i][j])
                nbox++;
        }
    }
}
