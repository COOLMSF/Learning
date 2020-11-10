cmake_minimum_required(VERSION 3.18)
project(CopyFile C)

set(CMAKE_C_STANDARD 99)

add_executable(CopyFile main.c do_copy.c show_usage.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")