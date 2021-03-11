cmake_minimum_required(VERSION 3.18)
project(setjump C)

set(CMAKE_C_STANDARD 99)

add_executable(setjump main.c)

include_directories(/home/coolder/CLionProjects/C_Cpp/Header)

target_link_libraries(${PROJECT_NAME} /home/coolder/CLionProjects/C_Cpp/Lib/UNP)