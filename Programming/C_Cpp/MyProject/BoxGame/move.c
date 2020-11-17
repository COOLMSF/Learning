//
// Created by coolder on 11/17/20.
//
#include "box.h"

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
