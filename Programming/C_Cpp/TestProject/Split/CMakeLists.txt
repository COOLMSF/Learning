cmake_minimum_required(VERSION 3.18)
project(Split C)
set(CMAKE_C_STANDARD 99)
add_executable(Split main.c split_glinked_list_version.c split.h test.c)

include(FindPkgConfig)
pkg_check_modules(GLIB glib-2.0 REQUIRED)
include_directories(${GLIB_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} ${GLIB_LIBRARIES})

include_directories("/home/coolder/Learning/Programming/C_Cpp/Header")