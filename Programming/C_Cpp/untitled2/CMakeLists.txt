cmake_minimum_required(VERSION 3.18)
project(untitled2 C)

set(CMAKE_C_STANDARD 99)

add_executable(untitled2 main.c isPalindromeNumber.c itoa.c itoa.h get_num_len.c PalindromeNumber.h)

target_link_libraries(untitled2 m)