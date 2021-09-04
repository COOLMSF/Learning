cmake_minimum_required(VERSION 3.18)
project(unp_test C)

set(CMAKE_C_STANDARD 99)

add_executable(unp_test main.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

target_link_libraries(unp_test /home/coolder/Learning/Programming/C_Cpp/Lib/UNP/libunp.a)