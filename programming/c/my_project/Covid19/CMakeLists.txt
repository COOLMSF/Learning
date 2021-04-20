cmake_minimum_required(VERSION 3.19)
project(Covid19 C)

set(CMAKE_C_STANDARD 99)

add_executable(Covid19 main.c func.c user_info.h)
