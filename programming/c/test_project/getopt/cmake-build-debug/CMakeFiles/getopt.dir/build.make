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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/getopt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/getopt.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/getopt.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/getopt.dir/flags.make

CMakeFiles/getopt.dir/main.c.o: CMakeFiles/getopt.dir/flags.make
CMakeFiles/getopt.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/getopt.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/getopt.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/getopt/main.c

CMakeFiles/getopt.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/getopt.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/getopt/main.c > CMakeFiles/getopt.dir/main.c.i

CMakeFiles/getopt.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/getopt.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/getopt/main.c -o CMakeFiles/getopt.dir/main.c.s

# Object files for target getopt
getopt_OBJECTS = \
"CMakeFiles/getopt.dir/main.c.o"

# External object files for target getopt
getopt_EXTERNAL_OBJECTS =

getopt: CMakeFiles/getopt.dir/main.c.o
getopt: CMakeFiles/getopt.dir/build.make
getopt: CMakeFiles/getopt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable getopt"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/getopt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/getopt.dir/build: getopt

.PHONY : CMakeFiles/getopt.dir/build

CMakeFiles/getopt.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/getopt.dir/cmake_clean.cmake
.PHONY : CMakeFiles/getopt.dir/clean

CMakeFiles/getopt.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/getopt /home/coolder/Learning/Programming/C_Cpp/getopt /home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/getopt/cmake-build-debug/CMakeFiles/getopt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/getopt.dir/depend

