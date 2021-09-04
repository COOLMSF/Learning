//
// Created by coolder on 10/25/20.
//

#include <termios.h>

#ifndef SNAKEGAME_SNAKE_H

#define SNAKEGAME_SNAKE_H
#define MAX_WIDTH 8
#define MAX_HIGHT 8

/*
 * Map for Snake Game,
 * '#' represents the wall, '*' represents the boxes,
 * '$' represents the hole, 'w' represents myself.
 *
 * It's a little bit to draw, but I choose use :s command
 * in vim, ^_^.
 */

extern int nbox;
extern char map[MAX_WIDTH][MAX_HIGHT];
extern struct termios old, current;
extern int my_x, my_y;

void sig_handler(void);
// Init some information about the game
void init(void);

void print_usage(void);
void print_map(void);

void move_up(void);
void move_down(void);
void move_left(void);
void move_right(void);

void initTermios(int echo);
void resetTermios(void);
char getch_(int echo);
char mygetch(void);

#endif

