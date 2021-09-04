cmake_minimum_required(VERSION 3.18)
project(sniffer C)

set(CMAKE_C_STANDARD 99)

add_executable(sniffer main.c)

include(FindPkgConfig)

pkg_check_modules(PCAP libpcap REQUIRED)

include_directories(${PCAP_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${PCAP_LIBRARIES})

