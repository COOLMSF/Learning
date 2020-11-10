//
// Created by coolder on 10/26/20.
//

#ifndef SNAKEGAME_SNAKE_H
#define SNAKEGAME_SNAKE_H

#endif //SNAKEGAME_SNAKE_H

#define MAX_WIDTH 20
#define MAX_HIGHT 15



void init(void);
void print_usage(void);
void print_map(void);

void draw_snake(void);
void locate_snake(void);
void kill_snake(void);

void draw_food(void);
void locate_food(void);

// Draw a rectangle
void draw_ret(int width, int hight);

void move(char direction);
void move_up(void);