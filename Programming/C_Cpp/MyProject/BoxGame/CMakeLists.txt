cmake_minimum_required(VERSION 3.18)
project(BoxGame C)

set(CMAKE_C_STANDARD 99)

add_executable(BoxGame main.c box.h)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")