cmake_minimum_required(VERSION 3.18)
project(GetDeviceInfo C)

set(CMAKE_C_STANDARD 99)

add_executable(GetDeviceInfo main.c)

include_directories(/home/coolder/CLionProjects/C_Cpp/Header)

include(FindPkgConfig)

pkg_check_modules(PCAP libpcap REQUIRED)

include_directories(${PCAP_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${PCAP_LIBRARIES})