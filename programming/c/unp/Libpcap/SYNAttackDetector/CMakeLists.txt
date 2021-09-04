cmake_minimum_required(VERSION 3.18)
project(SYNAttackDetector C)

set(CMAKE_C_STANDARD 99)

add_executable(SYNAttackDetector main.c syn_attack_detector.h process_packet.c check_syn_attack.c collect_attack_info.c)

include_directories(/home/coolder/CLionProjects/C_Cpp/Header)

include(FindPkgConfig)

pkg_check_modules(PCAP libpcap REQUIRED)

include_directories(${PCAP_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${PCAP_LIBRARIES})

target_link_libraries(${PROJECT_NAME} /home/coolder/CLionProjects/C_Cpp/Lib/UNP/libunp.a)