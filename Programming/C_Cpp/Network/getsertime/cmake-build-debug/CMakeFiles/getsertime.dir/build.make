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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/Network/getsertime

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/getsertime.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/getsertime.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/getsertime.dir/flags.make

CMakeFiles/getsertime.dir/library.c.o: CMakeFiles/getsertime.dir/flags.make
CMakeFiles/getsertime.dir/library.c.o: ../library.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/getsertime.dir/library.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/getsertime.dir/library.c.o -c /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/library.c

CMakeFiles/getsertime.dir/library.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/getsertime.dir/library.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/library.c > CMakeFiles/getsertime.dir/library.c.i

CMakeFiles/getsertime.dir/library.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/getsertime.dir/library.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/library.c -o CMakeFiles/getsertime.dir/library.c.s

# Object files for target getsertime
getsertime_OBJECTS = \
"CMakeFiles/getsertime.dir/library.c.o"

# External object files for target getsertime
getsertime_EXTERNAL_OBJECTS =

libgetsertime.a: CMakeFiles/getsertime.dir/library.c.o
libgetsertime.a: CMakeFiles/getsertime.dir/build.make
libgetsertime.a: CMakeFiles/getsertime.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libgetsertime.a"
	$(CMAKE_COMMAND) -P CMakeFiles/getsertime.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/getsertime.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/getsertime.dir/build: libgetsertime.a

.PHONY : CMakeFiles/getsertime.dir/build

CMakeFiles/getsertime.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/getsertime.dir/cmake_clean.cmake
.PHONY : CMakeFiles/getsertime.dir/clean

CMakeFiles/getsertime.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/Network/getsertime /home/coolder/Learning/Programming/C_Cpp/Network/getsertime /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/Network/getsertime/cmake-build-debug/CMakeFiles/getsertime.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/getsertime.dir/depend

