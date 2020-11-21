#include "box.h"
#include "allheaders.h"

int nbox = 0;

char map[MAX_WIDTH][MAX_HIGHT] = {
        {' ', ' ', '#', '#', '#', ' ', ' ', ' '},
        {' ', ' ', '#', '$', '#', ' ', ' ', ' '},
        {' ', ' ', '#', ' ', '#', '#', '#', '#'},
        {'#', '#', '#', '*', ' ', '*', '$', '#'},
        {'#', '$', ' ', '*', 'w', '#', '#', '#'},
        {'#', '#', '#', '#', '*', '#', ' ', ' '},
        {' ', ' ', ' ', '#', '$', '#', ' ', ' '},
        {' ', ' ', ' ', '#', '#', '#', ' ', ' '}
};

int main()
{
    int c;

    // Press CTL^C to exit.
    signal(SIGINT, (__sighandler_t) sig_handler);

    // Init game data
    init();
    print_usage();

    while (1) {
        system("clear");
        print_map();

        if (0 == nbox) {
            puts("YOU WIN !!!");
            exit(EXIT_SUCCESS);
        }

        c = mygetch();

        // Move in vim mode
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
