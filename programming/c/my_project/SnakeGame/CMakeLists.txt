cmake_minimum_required(VERSION 3.18)
project(SnakeGame C)

set(CMAKE_C_STANDARD 99)

add_executable(SnakeGame main.c snake.h)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

