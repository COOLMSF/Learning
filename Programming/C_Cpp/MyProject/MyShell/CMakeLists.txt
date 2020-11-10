cmake_minimum_required(VERSION 3.18)
project(MyShell C)

set(CMAKE_C_STANDARD 99)

add_executable(MyShell main.c MyShell.h)
target_link_libraries(MyShell /usr/lib/libreadline.so)


include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")