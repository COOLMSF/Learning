cmake_minimum_required(VERSION 3.18)
project(PortScanner C)

set(CMAKE_C_STANDARD 99)

add_executable(PortScanner main.c port_scanner.h scan.c has_network_addr.c resolve_domain_name.c sig_handler.c)

include_directories(/home/coolder/CLionProjects/C_Cpp/Header)

target_link_libraries(${PROJECT_NAME} /home/coolder/CLionProjects/C_Cpp/Lib/UNP/libunp.a)