cmake_minimum_required(VERSION 3.18)
project(FileLock C)

set(CMAKE_C_STANDARD 99)

add_executable(FileLock main.c)

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(FileLock Threads::Threads)
