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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/readINTR.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/readINTR.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/readINTR.dir/flags.make

CMakeFiles/readINTR.dir/main.c.o: CMakeFiles/readINTR.dir/flags.make
CMakeFiles/readINTR.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/readINTR.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/readINTR.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/main.c

CMakeFiles/readINTR.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/readINTR.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/main.c > CMakeFiles/readINTR.dir/main.c.i

CMakeFiles/readINTR.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/readINTR.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/main.c -o CMakeFiles/readINTR.dir/main.c.s

# Object files for target readINTR
readINTR_OBJECTS = \
"CMakeFiles/readINTR.dir/main.c.o"

# External object files for target readINTR
readINTR_EXTERNAL_OBJECTS =

readINTR: CMakeFiles/readINTR.dir/main.c.o
readINTR: CMakeFiles/readINTR.dir/build.make
readINTR: /home/coolder/Learning/Programming/C_Cpp/Lib/UNP/libunp.a
readINTR: CMakeFiles/readINTR.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable readINTR"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/readINTR.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/readINTR.dir/build: readINTR

.PHONY : CMakeFiles/readINTR.dir/build

CMakeFiles/readINTR.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/readINTR.dir/cmake_clean.cmake
.PHONY : CMakeFiles/readINTR.dir/clean

CMakeFiles/readINTR.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/TestProject/readINTR/cmake-build-debug/CMakeFiles/readINTR.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/readINTR.dir/depend

