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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/ErrorHandler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/ErrorHandler.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ErrorHandler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ErrorHandler.dir/flags.make

CMakeFiles/ErrorHandler.dir/main.c.o: CMakeFiles/ErrorHandler.dir/flags.make
CMakeFiles/ErrorHandler.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/ErrorHandler.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ErrorHandler.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/main.c

CMakeFiles/ErrorHandler.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ErrorHandler.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/main.c > CMakeFiles/ErrorHandler.dir/main.c.i

CMakeFiles/ErrorHandler.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ErrorHandler.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/main.c -o CMakeFiles/ErrorHandler.dir/main.c.s

CMakeFiles/ErrorHandler.dir/test1.c.o: CMakeFiles/ErrorHandler.dir/flags.make
CMakeFiles/ErrorHandler.dir/test1.c.o: ../test1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/ErrorHandler.dir/test1.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ErrorHandler.dir/test1.c.o -c /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/test1.c

CMakeFiles/ErrorHandler.dir/test1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ErrorHandler.dir/test1.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/test1.c > CMakeFiles/ErrorHandler.dir/test1.c.i

CMakeFiles/ErrorHandler.dir/test1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ErrorHandler.dir/test1.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/test1.c -o CMakeFiles/ErrorHandler.dir/test1.c.s

# Object files for target ErrorHandler
ErrorHandler_OBJECTS = \
"CMakeFiles/ErrorHandler.dir/main.c.o" \
"CMakeFiles/ErrorHandler.dir/test1.c.o"

# External object files for target ErrorHandler
ErrorHandler_EXTERNAL_OBJECTS =

ErrorHandler: CMakeFiles/ErrorHandler.dir/main.c.o
ErrorHandler: CMakeFiles/ErrorHandler.dir/test1.c.o
ErrorHandler: CMakeFiles/ErrorHandler.dir/build.make
ErrorHandler: CMakeFiles/ErrorHandler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ErrorHandler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ErrorHandler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ErrorHandler.dir/build: ErrorHandler

.PHONY : CMakeFiles/ErrorHandler.dir/build

CMakeFiles/ErrorHandler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ErrorHandler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ErrorHandler.dir/clean

CMakeFiles/ErrorHandler.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/ErrorHandler /home/coolder/Learning/Programming/C_Cpp/ErrorHandler /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/ErrorHandler/cmake-build-debug/CMakeFiles/ErrorHandler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ErrorHandler.dir/depend

