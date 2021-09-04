cmake_minimum_required(VERSION 3.18)
project(MymvCommand C)

set(CMAKE_C_STANDARD 99)

add_executable(MymvCommand main.c countDiskUsage.c MymvCommand.h call_mv.c call_progress.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

