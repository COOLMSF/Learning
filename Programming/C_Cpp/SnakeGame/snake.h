//
// Created by coolder on 10/25/20.
//

#ifndef SNAKEGAME_SNAKE_H
#define SNAKEGAME_SNAKE_H

#endif //SNAKEGAME_SNAKE_H

#ifndef MAX_WIDTH
#define MAX_WIDTH 8
#endif

#ifndef MAX_HIGHT
#define MAX_HIGHT 8
#endif
/*
 * Map for Snake Game,
 * '#' represents the wall, '*' represents the boxes,
 * '$' represents the hole, 'w' represents myself.
 *
 * It's a little bit to draw, but I choose use :s command
 * in vim, ^_^.
 */

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

//void init(void);
//void print_usage(void);
//void print_map(void);
//void move_up(void);
//void move_down(void);
//void move_left(void);
//void move_right(void);