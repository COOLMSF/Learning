cmake_minimum_required(VERSION 3.18)
project(read_dir C)

set(CMAKE_C_STANDARD 99)

add_executable(read_dir main.c print_files_in_dir.c countDiskUsage.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")