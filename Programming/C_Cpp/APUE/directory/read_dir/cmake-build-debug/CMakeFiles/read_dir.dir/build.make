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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/read_dir

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/read_dir.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/read_dir.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/read_dir.dir/flags.make

CMakeFiles/read_dir.dir/main.c.o: CMakeFiles/read_dir.dir/flags.make
CMakeFiles/read_dir.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/read_dir.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_dir.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/read_dir/main.c

CMakeFiles/read_dir.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_dir.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/read_dir/main.c > CMakeFiles/read_dir.dir/main.c.i

CMakeFiles/read_dir.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_dir.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/read_dir/main.c -o CMakeFiles/read_dir.dir/main.c.s

CMakeFiles/read_dir.dir/print_files_in_dir.c.o: CMakeFiles/read_dir.dir/flags.make
CMakeFiles/read_dir.dir/print_files_in_dir.c.o: ../print_files_in_dir.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/read_dir.dir/print_files_in_dir.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_dir.dir/print_files_in_dir.c.o -c /home/coolder/Learning/Programming/C_Cpp/read_dir/print_files_in_dir.c

CMakeFiles/read_dir.dir/print_files_in_dir.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_dir.dir/print_files_in_dir.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/read_dir/print_files_in_dir.c > CMakeFiles/read_dir.dir/print_files_in_dir.c.i

CMakeFiles/read_dir.dir/print_files_in_dir.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_dir.dir/print_files_in_dir.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/read_dir/print_files_in_dir.c -o CMakeFiles/read_dir.dir/print_files_in_dir.c.s

CMakeFiles/read_dir.dir/countDiskUsage.c.o: CMakeFiles/read_dir.dir/flags.make
CMakeFiles/read_dir.dir/countDiskUsage.c.o: ../countDiskUsage.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/read_dir.dir/countDiskUsage.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/read_dir.dir/countDiskUsage.c.o -c /home/coolder/Learning/Programming/C_Cpp/read_dir/countDiskUsage.c

CMakeFiles/read_dir.dir/countDiskUsage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/read_dir.dir/countDiskUsage.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/read_dir/countDiskUsage.c > CMakeFiles/read_dir.dir/countDiskUsage.c.i

CMakeFiles/read_dir.dir/countDiskUsage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/read_dir.dir/countDiskUsage.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/read_dir/countDiskUsage.c -o CMakeFiles/read_dir.dir/countDiskUsage.c.s

# Object files for target read_dir
read_dir_OBJECTS = \
"CMakeFiles/read_dir.dir/main.c.o" \
"CMakeFiles/read_dir.dir/print_files_in_dir.c.o" \
"CMakeFiles/read_dir.dir/countDiskUsage.c.o"

# External object files for target read_dir
read_dir_EXTERNAL_OBJECTS =

read_dir: CMakeFiles/read_dir.dir/main.c.o
read_dir: CMakeFiles/read_dir.dir/print_files_in_dir.c.o
read_dir: CMakeFiles/read_dir.dir/countDiskUsage.c.o
read_dir: CMakeFiles/read_dir.dir/build.make
read_dir: CMakeFiles/read_dir.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable read_dir"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/read_dir.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/read_dir.dir/build: read_dir

.PHONY : CMakeFiles/read_dir.dir/build

CMakeFiles/read_dir.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/read_dir.dir/cmake_clean.cmake
.PHONY : CMakeFiles/read_dir.dir/clean

CMakeFiles/read_dir.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/read_dir /home/coolder/Learning/Programming/C_Cpp/read_dir /home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/read_dir/cmake-build-debug/CMakeFiles/read_dir.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/read_dir.dir/depend
