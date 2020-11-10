add_executable(deadlock main.c)
cmake_minimum_required(VERSION 3.18)
project(deadlock C)
set(CMAKE_C_STANDARD 99)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(deadlock Threads::Threads)
include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

