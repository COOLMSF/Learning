cmake_minimum_required(VERSION 3.18)
project(Glibtest C)
set(CMAKE_C_STANDARD 99)
add_executable(Glibtest main.c)

include(FindPkgConfig)
pkg_check_modules(GLIB glib-2.0 REQUIRED)
include_directories(${GLIB_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} ${GLIB_LIBRARIES})
