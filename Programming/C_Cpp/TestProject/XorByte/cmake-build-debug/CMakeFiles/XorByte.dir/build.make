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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/XorByte

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/XorByte.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/XorByte.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/XorByte.dir/flags.make

CMakeFiles/XorByte.dir/main.c.o: CMakeFiles/XorByte.dir/flags.make
CMakeFiles/XorByte.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/XorByte.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/XorByte.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/XorByte/main.c

CMakeFiles/XorByte.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/XorByte.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/XorByte/main.c > CMakeFiles/XorByte.dir/main.c.i

CMakeFiles/XorByte.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/XorByte.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/XorByte/main.c -o CMakeFiles/XorByte.dir/main.c.s

# Object files for target XorByte
XorByte_OBJECTS = \
"CMakeFiles/XorByte.dir/main.c.o"

# External object files for target XorByte
XorByte_EXTERNAL_OBJECTS =

XorByte: CMakeFiles/XorByte.dir/main.c.o
XorByte: CMakeFiles/XorByte.dir/build.make
XorByte: CMakeFiles/XorByte.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable XorByte"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/XorByte.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/XorByte.dir/build: XorByte

.PHONY : CMakeFiles/XorByte.dir/build

CMakeFiles/XorByte.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/XorByte.dir/cmake_clean.cmake
.PHONY : CMakeFiles/XorByte.dir/clean

CMakeFiles/XorByte.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/XorByte /home/coolder/Learning/Programming/C_Cpp/XorByte /home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/XorByte/cmake-build-debug/CMakeFiles/XorByte.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/XorByte.dir/depend
