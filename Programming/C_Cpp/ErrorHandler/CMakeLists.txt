cmake_minimum_required(VERSION 3.18)
project(ErrorHandler C)

set(CMAKE_C_STANDARD 99)

add_executable(ErrorHandler main.c test1.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")