#include "allheaders.h"
#include "snake.h"

char map[MAX_WIDTH][MAX_HIGHT] = { 0 };

int
main(void) {
    draw_ret(MAX_WIDTH, MAX_HIGHT);
    print_map();
}

void draw_ret(int witdh, int hight) {

    // Check bound for secure
    if (witdh > MAX_WIDTH || hight > MAX_HIGHT) {
        fprintf(stderr, "Array out of bounds\n");
        exit(EXIT_FAILURE);
    }

    // Draw rectangle in map
        for(int i=0; i < hight; i++) {
            for(int j=0; j < witdh; j++) {
                if (i == 0 || j == 0 || i == hight - 1 || j == witdh - 1)
                    map[i][j] = '#';
                else
                    map[i][j] = ' ';
        }
    }
}

void print_map(void) {
    for (int i = 0; i < MAX_HIGHT; ++i) {
        for (int j = 0; j < MAX_WIDTH; ++j) {
            printf("%c", map[i][j]);
        }

        putchar('\n');
    }
}