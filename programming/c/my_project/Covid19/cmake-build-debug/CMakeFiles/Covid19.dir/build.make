# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Covid19.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Covid19.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Covid19.dir/flags.make

CMakeFiles/Covid19.dir/main.c.o: CMakeFiles/Covid19.dir/flags.make
CMakeFiles/Covid19.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Covid19.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Covid19.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/main.c

CMakeFiles/Covid19.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Covid19.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/main.c > CMakeFiles/Covid19.dir/main.c.i

CMakeFiles/Covid19.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Covid19.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/main.c -o CMakeFiles/Covid19.dir/main.c.s

CMakeFiles/Covid19.dir/func.c.o: CMakeFiles/Covid19.dir/flags.make
CMakeFiles/Covid19.dir/func.c.o: ../func.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Covid19.dir/func.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Covid19.dir/func.c.o -c /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/func.c

CMakeFiles/Covid19.dir/func.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Covid19.dir/func.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/func.c > CMakeFiles/Covid19.dir/func.c.i

CMakeFiles/Covid19.dir/func.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Covid19.dir/func.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/func.c -o CMakeFiles/Covid19.dir/func.c.s

# Object files for target Covid19
Covid19_OBJECTS = \
"CMakeFiles/Covid19.dir/main.c.o" \
"CMakeFiles/Covid19.dir/func.c.o"

# External object files for target Covid19
Covid19_EXTERNAL_OBJECTS =

Covid19: CMakeFiles/Covid19.dir/main.c.o
Covid19: CMakeFiles/Covid19.dir/func.c.o
Covid19: CMakeFiles/Covid19.dir/build.make
Covid19: CMakeFiles/Covid19.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable Covid19"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Covid19.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Covid19.dir/build: Covid19

.PHONY : CMakeFiles/Covid19.dir/build

CMakeFiles/Covid19.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Covid19.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Covid19.dir/clean

CMakeFiles/Covid19.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19 /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19 /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/TestProject/Covid19/cmake-build-debug/CMakeFiles/Covid19.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Covid19.dir/depend
