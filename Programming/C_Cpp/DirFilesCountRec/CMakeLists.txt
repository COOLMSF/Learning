cmake_minimum_required(VERSION 3.18)
project(DirFilesCountRec C)

set(CMAKE_C_STANDARD 99)

add_executable(DirFilesCountRec main.c print_dir_files.c nftw.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")
