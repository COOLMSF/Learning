cmake_minimum_required(VERSION 3.18)
project(SnakeGame C)

set(CMAKE_C_STANDARD 99)

add_executable(SnakeGame main.c snake.h print_usage.c print_map.c move_up.c init.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

target_link_libraries(${PROJECT_NAME} ncurses)


set(CMAKE_CXX_FLAGS "-lncurses")
