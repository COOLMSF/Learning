cmake_minimum_required(VERSION 3.20)
project(sock_auth_server C)

set(CMAKE_C_STANDARD 99)

add_executable(sock_auth_server main.c transfer.h)