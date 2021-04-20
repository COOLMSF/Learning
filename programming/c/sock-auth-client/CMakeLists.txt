cmake_minimum_required(VERSION 3.20)
project(sock_auth_client C)

set(CMAKE_C_STANDARD 99)

add_executable(sock_auth_client main.c transfer.h)