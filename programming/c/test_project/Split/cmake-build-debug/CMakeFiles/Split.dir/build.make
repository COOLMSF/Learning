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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/Split

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Split.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Split.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Split.dir/flags.make

CMakeFiles/Split.dir/main.c.o: CMakeFiles/Split.dir/flags.make
CMakeFiles/Split.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Split.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Split.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/Split/main.c

CMakeFiles/Split.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Split.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/Split/main.c > CMakeFiles/Split.dir/main.c.i

CMakeFiles/Split.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Split.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/Split/main.c -o CMakeFiles/Split.dir/main.c.s

CMakeFiles/Split.dir/split_glinked_list_version.c.o: CMakeFiles/Split.dir/flags.make
CMakeFiles/Split.dir/split_glinked_list_version.c.o: ../split_glinked_list_version.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Split.dir/split_glinked_list_version.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Split.dir/split_glinked_list_version.c.o -c /home/coolder/Learning/Programming/C_Cpp/Split/split_glinked_list_version.c

CMakeFiles/Split.dir/split_glinked_list_version.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Split.dir/split_glinked_list_version.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/Split/split_glinked_list_version.c > CMakeFiles/Split.dir/split_glinked_list_version.c.i

CMakeFiles/Split.dir/split_glinked_list_version.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Split.dir/split_glinked_list_version.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/Split/split_glinked_list_version.c -o CMakeFiles/Split.dir/split_glinked_list_version.c.s

CMakeFiles/Split.dir/test.c.o: CMakeFiles/Split.dir/flags.make
CMakeFiles/Split.dir/test.c.o: ../test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Split.dir/test.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Split.dir/test.c.o -c /home/coolder/Learning/Programming/C_Cpp/Split/test.c

CMakeFiles/Split.dir/test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Split.dir/test.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/Split/test.c > CMakeFiles/Split.dir/test.c.i

CMakeFiles/Split.dir/test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Split.dir/test.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/Split/test.c -o CMakeFiles/Split.dir/test.c.s

# Object files for target Split
Split_OBJECTS = \
"CMakeFiles/Split.dir/main.c.o" \
"CMakeFiles/Split.dir/split_glinked_list_version.c.o" \
"CMakeFiles/Split.dir/test.c.o"

# External object files for target Split
Split_EXTERNAL_OBJECTS =

Split: CMakeFiles/Split.dir/main.c.o
Split: CMakeFiles/Split.dir/split_glinked_list_version.c.o
Split: CMakeFiles/Split.dir/test.c.o
Split: CMakeFiles/Split.dir/build.make
Split: CMakeFiles/Split.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable Split"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Split.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Split.dir/build: Split

.PHONY : CMakeFiles/Split.dir/build

CMakeFiles/Split.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Split.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Split.dir/clean

CMakeFiles/Split.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/Split /home/coolder/Learning/Programming/C_Cpp/Split /home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Split/cmake-build-debug/CMakeFiles/Split.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Split.dir/depend

