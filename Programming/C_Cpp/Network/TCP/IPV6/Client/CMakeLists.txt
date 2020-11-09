cmake_minimum_required(VERSION 3.18)
project(Client C)

set(CMAKE_C_STANDARD 99)

add_executable(Client main.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")
include_directories("/home/coolder/Learning/Programming/C_Cpp/Network/unpv13e/lib/")

target_link_libraries(Client /home/coolder/Learning/Programming/C_Cpp/Network/unpv13e/libunp.a)
