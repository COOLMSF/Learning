cmake_minimum_required(VERSION 3.18)
project(Ncurse C)

set(CMAKE_C_STANDARD 99)

add_executable(Ncurse main.c )

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

target_link_libraries(${PROJECT_NAME} ncurses)


set(CMAKE_CXX_FLAGS "-lncurses")
