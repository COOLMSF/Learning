#include "allheaders.h"
#include "snake.h"

//char map[MAX_WIDTH][MAX_HIGHT] = { 0 };

char map[MAX_WIDTH][MAX_HIGHT] = {
        {'#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'},
        {'#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'},
};

int snake_x = 0, snake_y = 0;
int food_x = 0, food_y = 0;
int score = 0;

// Status of the snake, 1 represents live, 0 represents die.
int live = 1;

int
main(void) {

    print_usage();

    // Initiation of the game

    // while (live) {
    //     init();
    //     print_map();
    //     switch (getchar()) {
    //         case 'w': move_up();
    //         break;
    //     }
    // }

    // While the snake is alive
    while (live) {
        draw_snake();
        draw_food();
        locate_snake();
        locate_food();
        print_map();

        switch (getchar()) {
            case 'w': move_up();
                break;
        }
    }

}

// void draw_ret(int witdh, int hight) {
//
//     // Check bound for secure
//     if (witdh > MAX_WIDTH || hight > MAX_HIGHT) {
//         fprintf(stderr, "Array out of bounds\n");
//         exit(EXIT_FAILURE);
//     }
//
//     // Draw rectangle in map
//         for(int i=0; i < witdh; i++) {
//             for(int j=0; j < hight; j++) {
//                 if (i == 0 || j == 0 || i == hight - 1 || j == witdh - 1) {
//                     map[i][j] = '#';
//                 }
//                 else {
//                     map[i][j] = ' ';
//                 }
//         }
//     }
// }

void print_usage(void) {
    puts("'#' represents the wall");
    puts("'%' represents the snake");
    puts("'$' represents the food");
}

void print_map(void) {
    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {
            printf("%c", map[i][j]);
        }

        putchar('\n');
    }
}

void init(void) {
    draw_snake();
    draw_food();
    locate_snake();
    locate_food();


}

void draw_snake(void) {

    /*
     * Note, computer run so fast that execute so many code within 1 second,
     * so, these code:
     * `srandom(time(NULL));
     * `snake_x = (rand() % (MAX_WIDTH - 2)) + 1;
     * `srandom(time(NULL));
     * `snake_y = (rand() % (MAX_HIGHT - 2)) + 1;
     *
     * may be executed in 1 second, which will cause all seed are the same,
     * and cause snake_y, snake_y are always the same.
     *
     * So I use some magic number to make sure they're different.
     *
     * But there is a bug !!!!.
     * if you run the program within 1 second, the result will be always the same;
     *
     * ***********************************
     * Updated, use clock_t is the best way.
     *
     */

    clock_t start;

    start = clock();
    // Generate a random location for snake
    // srandom(time(NULL) / 123);
    // snake_x = (rand() % (MAX_WIDTH - 2)) + 1;

    srandom(start);
    srandom(start);
    snake_x = (rand() % (MAX_WIDTH - 2)) + 1;

    start = clock();
    srandom(start);
    snake_y = (rand() % (MAX_HIGHT - 2)) + 1;

    // srandom(time(NULL) * 1263);
    // snake_y = (rand() % (MAX_HIGHT - 2)) + 1;


    // Draw snake
    map[snake_x][snake_y] = '%';

    /*
     * Note here, snake_x is actually the y of the map, snake_y is the x of the map.
     * So I use another function to locate the location of the snake.
     * Think of pointer array first.
     */
}

void draw_food(void) {

    // Generate a random location for snake

    // We should avoid the snake and the food are at the same location at begin.
    // Rerandom food location 3 times to avoid the same location
    // srandom(time(NULL) + 1);
    // food_x = (rand() % (MAX_WIDTH - 2)) + 1;

    // srandom(time(NULL) + 123);
    // food_y = (rand() % (MAX_HIGHT - 2)) + 1;

    // if (food_x == snake_x && food_y == snake_y) {
    //     srandom(time(NULL) + 821);
    //     food_x = (rand() % (MAX_WIDTH - 2)) + 1;
    //     srandom(time(NULL) + 271);
    //     food_y = (rand() % (MAX_HIGHT - 2)) + 1;

    //     if (food_x == snake_x && food_y == snake_y) {
    //         srandom(time(NULL) + 5678);
    //         food_x = (rand() % (MAX_WIDTH - 2)) + 1;
    //         srandom(time(NULL) - 312);
    //         food_y = (rand() % (MAX_HIGHT - 2)) + 1;
    //     }

    clock_t start;
    start = clock();
    srandom(start);
    food_x = (rand() % (MAX_WIDTH - 2)) + 1;

    start = clock();
    srandom(start);
    food_y = (rand() % (MAX_HIGHT - 2)) + 1;

    if (food_x == snake_x && food_y == snake_y) {

        start = clock();
        srandom(start);
        food_x = (rand() % (MAX_WIDTH - 2)) + 1;

        start = clock();
        srandom(start);
        food_y = (rand() % (MAX_HIGHT - 2)) + 1;

        if (food_x == snake_x && food_y == snake_y) {
            start = clock();
            srandom(start);
            food_x = (rand() % (MAX_WIDTH - 2)) + 1;

            start = clock();
            srandom(start);
            food_y = (rand() % (MAX_HIGHT - 2)) + 1;
        }
    }

    // Draw food
    map[food_x][food_y] = '$';

    /*
     * Note here, snake_x is actually the y of the map, snake_y is the x of the map.
     * So I use another function to locate the location of the snake.
     * Think of pointer array first.
     */
}


void move(char direction) {
    /*
     * This function keeps moving in one direction.
     * There are 3 situation,
     *  If the next of the snake is space(' '), then replace the space('%') with the snake,
     *  replace the snake with space.
     *  If the next of the snake is the wall('#'), then die and exit.
     */
}

void move_up(void) {
    // If next element is wall('#'), then die.
    if ('#' == map[snake_x - 1][snake_y])
        kill_snake();

    // If next element of snake is space(' '), replace the next element with snake,
    // replace snake with space
    if (' ' == map[snake_x - 1][snake_y]) {

        // Replace the next element with snake
        map[snake_x - 1][snake_y] = '%';

        // Replace myself with space
        map[snake_x][snake_y] = ' ';
    }
    /*
     * If next element is food, then
     * replace the food('$') with snake('%'),
     * replace the snake with space(' ').
     */

    if ('$' == map[snake_x - 1][snake_y]) {

        // Replace the food with snake
        map[snake_x - 1][snake_y] = '%';

        // Replace the snake with space
        map[snake_x][snake_y] = ' ';

        // Get food, score++
        score++;
    }

    // Reset location of snake
    snake_x--;
}

void locate_snake(void) {
    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {
            if ('%' == map[i][j]) {
                snake_x = j;
                snake_y = i;
            }
        }
    }
}

void locate_food(void) {
    for (int i = 0; i < MAX_WIDTH; ++i) {
        for (int j = 0; j < MAX_HIGHT; ++j) {
            if ('$' == map[i][j]) {
                food_x = j;
                food_y = i;
            }
        }
    }
}

void kill_snake(void) {
    // Set status
    live = 0;

    puts("You died");
    exit(EXIT_SUCCESS);
}