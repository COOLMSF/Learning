# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/Network/unp_test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/unp_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/unp_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/unp_test.dir/flags.make

CMakeFiles/unp_test.dir/main.c.o: CMakeFiles/unp_test.dir/flags.make
CMakeFiles/unp_test.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/unp_test.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/unp_test.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/main.c

CMakeFiles/unp_test.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/unp_test.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/main.c > CMakeFiles/unp_test.dir/main.c.i

CMakeFiles/unp_test.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/unp_test.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/main.c -o CMakeFiles/unp_test.dir/main.c.s

# Object files for target unp_test
unp_test_OBJECTS = \
"CMakeFiles/unp_test.dir/main.c.o"

# External object files for target unp_test
unp_test_EXTERNAL_OBJECTS =

unp_test: CMakeFiles/unp_test.dir/main.c.o
unp_test: CMakeFiles/unp_test.dir/build.make
unp_test: /home/coolder/Learning/Programming/C_Cpp/Lib/UNP/libunp.a
unp_test: CMakeFiles/unp_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable unp_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/unp_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/unp_test.dir/build: unp_test

.PHONY : CMakeFiles/unp_test.dir/build

CMakeFiles/unp_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/unp_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/unp_test.dir/clean

CMakeFiles/unp_test.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/Network/unp_test /home/coolder/Learning/Programming/C_Cpp/Network/unp_test /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Network/unp_test/cmake-build-debug/CMakeFiles/unp_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/unp_test.dir/depend
