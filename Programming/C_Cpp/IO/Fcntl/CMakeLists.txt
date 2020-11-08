cmake_minimum_required(VERSION 3.18)
project(Fcntl C)

set(CMAKE_C_STANDARD 99)

add_executable(Fcntl main.c)

include_directories("/home/coolder/CLionProjects/C_Cpp/Header")

target_link_libraries(${PROJECT_NAME} /home/coolder/CLionProjects/C_Cpp/Lib/UNP/libunp.a)