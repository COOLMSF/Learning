#include <stdio.h>
#include "snake.h"
#include <stdlib.h>
#include <curses.h>
#include "allheaders.h"

int nbox = 0;
int my_x, my_y;

void sig_handler(void);
void init(void);
void print_usage(void);
void print_map(void);
void move_up(void);
void move_down(void);
void move_left(void);
void move_right(void);

// Swap two element
void swap(char *i, char *j);

int main() {

    signal(SIGINT, (__sighandler_t) sig_handler);

    init();
    print_usage();

    int c;

    while (1) {

        system("clear");
        print_map();

        if (0 == nbox) {
            puts("YOU WIN !!!");
            exit(EXIT_SUCCESS);
        }

        c = getchar();

        switch (c) {
            case 'w': move_up();
                break;
            case 's': move_down();
                break;
            case 'a': move_left();
                break;
            case 'd': move_right();
                break;
            default:
                break;
        }
    }

}

void print_usage(void) {
    puts("'#' represents the wall, '*' represents the boxes");
    puts("'$' represents the hole, 'w' represents myself.");
}

void sig_handler(void) {

    puts("SIGINT caught");
    puts("Exited");

    exit(EXIT_SUCCESS);
}

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

void print_map(void) {

    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {
            printf("%c", map[i][j]);
        }
        putchar('\n');
    }
}

void move_up(void) {
    // If next element is wall('#'), do nothing.
    if ('#' == map[my_x - 1][my_y])
        return;

    // If next element of box is nothing, replace the next element with myself,
    // replace myself with space
    if (' ' == map[my_x - 1][my_y]) {

        // Replace the next element with myself
        map[my_x - 1][my_y] = 'w';

        // Replace myself with space
        map[my_x][my_y] = ' ';
    }
    /*
     * If next element is box, this has two cases:
     *    1. If the next element of box is wall, then do nothing.
     *    2. If the next element of box is space(' '), then box and myself move on.
     *    3. If the next element of box is hole('$'), then replace hole('$') with
     *    box('*'), and myself move on, boxes--;
     */

    if ('*' == map[my_x - 1][my_y]) {

        // If the next element of box is the wall('#'), do nothing
        if ('#' == map[my_x - 2][my_y])
            return;

        // If the next element of box is the space(' '), then box and myself move on.
        if (' ' == map[my_x - 2][my_y]) {

            // Replace the next element of box with box
            map[my_x - 2][my_y] = '*';

            // Replace the element of box with myself('w')
            map[my_x - 1][my_y] = 'w';

            // Replace the element of myself with ' '
            map[my_x][my_y] = ' ';
        }

        /*
         * If the next element of box is the hole('$'), then replace hole('$') with box,
         * replace box with myself('w'), replace myself with space(' ')
         */

        if ('$' == map[my_x - 2][my_y]) {

            // Replace hole with box
            map[my_x - 2][my_y] = '*';

            // Replace box with myself
            map[my_x - 1][my_y] = 'w';

            // Replace myself with space ' '
            map[my_x][my_y] = ' ';

            // bbox --
            nbox--;
        }
    }

    my_x--;
}

void move_down(void) {
    // If next element is wall('#'), do nothing.
    if ('#' == map[my_x + 1][my_y])
        return;

    // If next element of box is nothing, replace the next element with myself,
    // replace myself with space
    if (' ' == map[my_x + 1][my_y]) {

        // Replace the next element with myself
        map[my_x + 1][my_y] = 'w';

        // Replace myself with space
        map[my_x][my_y] = ' ';
    }
    /*
     * If next element is box, this has two cases:
     *    1. If the next element of box is wall, then do nothing.
     *    2. If the next element of box is space(' '), then box and myself move on.
     *    3. If the next element of box is hole('$'), then replace hole('$') with
     *    box('*'), and myself move on, boxes--;
     */

    if ('*' == map[my_x + 1][my_y]) {

        // If the next element of box is the wall('#'), do nothing
        if ('#' == map[my_x + 2][my_y])
            return;

        // If the next element of box is the space(' '), then box and myself move on.
        if (' ' == map[my_x + 2][my_y]) {

            // Replace the next element of box with box
            map[my_x + 2][my_y] = '*';

            // Replace the element of box with myself('w')
            map[my_x + 1][my_y] = 'w';

            // Replace the element of myself with ' '
            map[my_x][my_y] = ' ';
        }

        /*
         * If the next element of box is the hole('$'), then replace hole('$') with box,
         * replace box with myself('w'), replace myself with space(' ')
         */

        if ('$' == map[my_x + 2][my_y]) {

            // Replace hole with box
            map[my_x + 2][my_y] = '*';

            // Replace box with myself
            map[my_x + 1][my_y] = 'w';

            // Replace myself with space ' '
            map[my_x][my_y] = ' ';

            // bbox --
            nbox--;
        }
    }

    my_x++;
}

void move_left(void) {
    // If next element is wall('#'), do nothing.
    if ('#' == map[my_x][my_y - 1])
        return;

    // If next element of box is nothing, replace the next element with myself,
    // replace myself with space
    if (' ' == map[my_x][my_y - 1]) {

        // Replace the next element with myself
        map[my_x][my_y - 1] = 'w';

        // Replace myself with space
        map[my_x][my_y] = ' ';
    }
    /*
     * If next element is box, this has two cases:
     *    1. If the next element of box is wall, then do nothing.
     *    2. If the next element of box is space(' '), then box and myself move on.
     *    3. If the next element of box is hole('$'), then replace hole('$') with
     *    box('*'), and myself move on, boxes--;
     */

    if ('*' == map[my_x][my_y - 1]) {

        // If the next element of box is the wall('#'), do nothing
        if ('#' == map[my_x][my_y - 2])
            return;

        // If the next element of box is the space(' '), then box and myself move on.
        if (' ' == map[my_x][my_y - 2]) {

            // Replace the next element of box with box
            map[my_x][my_y - 2] = '*';

            // Replace the element of box with myself('w')
            map[my_x][my_y - 1] = 'w';

            // Replace the element of myself with ' '
            map[my_x][my_y] = ' ';
        }

        /*
         * If the next element of box is the hole('$'), then replace hole('$') with box,
         * replace box with myself('w'), replace myself with space(' ')
         */

        if ('$' == map[my_x][my_y - 2]) {

            // Replace hole with box
            map[my_x][my_y - 2] = '*';

            // Replace box with myself
            map[my_x][my_y - 1] = 'w';

            // Replace myself with space ' '
            map[my_x][my_y] = ' ';

            // bbox --
            nbox--;
        }
    }

    my_y--;
}

void move_right(void) {
    // If next element is wall('#'), do nothing.
    if ('#' == map[my_x][my_y + 1])
        return;

    // If next element of box is nothing, replace the next element with myself,
    // replace myself with space
    if (' ' == map[my_x][my_y + 1]) {

        // Replace the next element with myself
        map[my_x][my_y + 1] = 'w';

        // Replace myself with space
        map[my_x][my_y] = ' ';
    }
    /*
     * If next element is box, this has two cases:
     *    1. If the next element of box is wall, then do nothing.
     *    2. If the next element of box is space(' '), then box and myself move on.
     *    3. If the next element of box is hole('$'), then replace hole('$') with
     *    box('*'), and myself move on, boxes--;
     */

    if ('*' == map[my_x][my_y + 1]) {

        // If the next element of box is the wall('#'), do nothing
        if ('#' == map[my_x][my_y + 2])
            return;

        // If the next element of box is the space(' '), then box and myself move on.
        if (' ' == map[my_x][my_y + 2]) {

            // Replace the next element of box with box
            map[my_x][my_y + 2] = '*';

            // Replace the element of box with myself('w')
            map[my_x][my_y + 1] = 'w';

            // Replace the element of myself with ' '
            map[my_x][my_y] = ' ';
        }

        /*
         * If the next element of box is the hole('$'), then replace hole('$') with box,
         * replace box with myself('w'), replace myself with space(' ')
         */

        if ('$' == map[my_x][my_y + 2]) {

            // Replace hole with box
            map[my_x][my_y + 2] = '*';

            // Replace box with myself
            map[my_x][my_y + 1] = 'w';

            // Replace myself with space ' '
            map[my_x][my_y] = ' ';

            // bbox --
            nbox--;
        }
    }

    my_y++;
}
