cmake_minimum_required(VERSION 3.18)
project(untitled1 C)

set(CMAKE_C_STANDARD 99)

include_directories("/usr/lib/jvm/java-14-openjdk/include")
include_directories("/usr/lib/jvm/java-14-openjdk/include/linux")

add_executable(JNITest main.c)