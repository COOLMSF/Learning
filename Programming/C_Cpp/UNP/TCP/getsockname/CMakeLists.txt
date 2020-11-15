cmake_minimum_required(VERSION 3.18)
project(getsockname C)

set(CMAKE_C_STANDARD 99)

add_executable(getsockname main.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

target_link_libraries(getsockname /home/coolder/Learning/Programming/C_Cpp/Lib/UNP/libunp.a)