#include "box.h"
#include "allheaders.h"

int nbox = 0;
int my_x, my_y;

static char map[MAX_WIDTH][MAX_HIGHT] = {
        {' ', ' ', '#', '#', '#', ' ', ' ', ' '},
        {' ', ' ', '#', '$', '#', ' ', ' ', ' '},
        {' ', ' ', '#', ' ', '#', '#', '#', '#'},
        {'#', '#', '#', '*', ' ', '*', '$', '#'},
        {'#', '$', ' ', '*', 'w', '#', '#', '#'},
        {'#', '#', '#', '#', '*', '#', ' ', ' '},
        {' ', ' ', ' ', '#', '$', '#', ' ', ' '},
        {' ', ' ', ' ', '#', '#', '#', ' ', ' '}
};
static struct termios old, current;

int main() {

    // Press CTL^C to exit.
    signal(SIGINT, (__sighandler_t) sig_handler);

    // Init game data
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

        // getch in ncurse seems not working
        c = mygetch();

        // vim mode
        switch (c) {
            case 'k': move_up();
                break;
            case 'j': move_down();
                break;
            case 'h': move_left();
                break;
            case 'l': move_right();
                break;
            default:
                break;
        }
    }

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

void sig_handler(void) {

    puts("SIGINT caught");
    puts("Exited");

    exit(EXIT_SUCCESS);
}

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

void print_usage(void) {
    puts("'#' represents the wall, '*' represents the boxes");
    puts("'$' represents the hole, 'w' represents myself.");
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

