//
// Created by coolder on 11/17/20.
//

#include "allheaders.h"

struct termios old, current;

/* Initialize new terminal i/o settings */
void initTermios(int echo)
{
    tcgetattr(0, &old); /* grab old terminal i/o settings */
    current = old; /* make new settings same as old settings */
    current.c_lflag &= ~ICANON; /* disable buffered i/o */
    if (echo) {
        current.c_lflag |= ECHO; /* set echo mode */
    } else {
        current.c_lflag &= ~ECHO; /* set no echo mode */
    }
    tcsetattr(0, TCSANOW, &current); /* use these new terminal i/o settings now */
}

/* Restore old terminal i/o settings */
void resetTermios(void)
{
    tcsetattr(0, TCSANOW, &old);
}

/* Read 1 character - echo defines echo mode */
char getch_(int echo)
{
    int ch;
    initTermios(echo);
    ch = getchar();
    resetTermios();
    return ch;
}

/* Read 1 character without echo */
char mygetch(void)
{
    return getch_(0);
}
