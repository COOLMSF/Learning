#include <stdio.h>
#include "ncurses.h"

int main() {
    initscr();
    int c = getch();

    switch (c) {
        case KEY_UP: puts("up");
        case KEY_DOWN: puts("down");
        case KEY_LEFT: puts("left");
        case KEY_RIGHT: puts("right");
    }
}