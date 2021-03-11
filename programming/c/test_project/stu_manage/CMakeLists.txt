cmake_minimum_required(VERSION 3.19)
project(stu_manage C)

set(CMAKE_C_STANDARD 99)

add_executable(stu_manage main.c stu_info.h stu_info_op.c)