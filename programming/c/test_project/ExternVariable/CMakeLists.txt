cmake_minimum_required(VERSION 3.18)
project(ExternVariable C)

set(CMAKE_C_STANDARD 99)

add_executable(ExternVariable main.c var.h fun.c)