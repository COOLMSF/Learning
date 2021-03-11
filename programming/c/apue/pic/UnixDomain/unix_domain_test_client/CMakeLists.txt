cmake_minimum_required(VERSION 3.18)
project(unix_domain_test_client C)

set(CMAKE_C_STANDARD 99)

add_executable(unix_domain_test_client main.c)

include_directories(/home/coolder/Learning/Programming/C_Cpp/Header)

target_link_libraries(${PROJECT_NAME} /home/coolder/Learning/Programming/C_Cpp/Lib/UNP/libunp.a)