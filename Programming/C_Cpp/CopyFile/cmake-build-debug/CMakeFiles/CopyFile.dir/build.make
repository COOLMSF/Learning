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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/CopyFile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/CopyFile.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/CopyFile.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CopyFile.dir/flags.make

CMakeFiles/CopyFile.dir/main.c.o: CMakeFiles/CopyFile.dir/flags.make
CMakeFiles/CopyFile.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/CopyFile.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CopyFile.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/CopyFile/main.c

CMakeFiles/CopyFile.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CopyFile.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/CopyFile/main.c > CMakeFiles/CopyFile.dir/main.c.i

CMakeFiles/CopyFile.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CopyFile.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/CopyFile/main.c -o CMakeFiles/CopyFile.dir/main.c.s

CMakeFiles/CopyFile.dir/do_copy.c.o: CMakeFiles/CopyFile.dir/flags.make
CMakeFiles/CopyFile.dir/do_copy.c.o: ../do_copy.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/CopyFile.dir/do_copy.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CopyFile.dir/do_copy.c.o -c /home/coolder/Learning/Programming/C_Cpp/CopyFile/do_copy.c

CMakeFiles/CopyFile.dir/do_copy.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CopyFile.dir/do_copy.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/CopyFile/do_copy.c > CMakeFiles/CopyFile.dir/do_copy.c.i

CMakeFiles/CopyFile.dir/do_copy.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CopyFile.dir/do_copy.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/CopyFile/do_copy.c -o CMakeFiles/CopyFile.dir/do_copy.c.s

CMakeFiles/CopyFile.dir/show_usage.c.o: CMakeFiles/CopyFile.dir/flags.make
CMakeFiles/CopyFile.dir/show_usage.c.o: ../show_usage.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/CopyFile.dir/show_usage.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/CopyFile.dir/show_usage.c.o -c /home/coolder/Learning/Programming/C_Cpp/CopyFile/show_usage.c

CMakeFiles/CopyFile.dir/show_usage.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CopyFile.dir/show_usage.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/CopyFile/show_usage.c > CMakeFiles/CopyFile.dir/show_usage.c.i

CMakeFiles/CopyFile.dir/show_usage.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CopyFile.dir/show_usage.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/CopyFile/show_usage.c -o CMakeFiles/CopyFile.dir/show_usage.c.s

# Object files for target CopyFile
CopyFile_OBJECTS = \
"CMakeFiles/CopyFile.dir/main.c.o" \
"CMakeFiles/CopyFile.dir/do_copy.c.o" \
"CMakeFiles/CopyFile.dir/show_usage.c.o"

# External object files for target CopyFile
CopyFile_EXTERNAL_OBJECTS =

CopyFile: CMakeFiles/CopyFile.dir/main.c.o
CopyFile: CMakeFiles/CopyFile.dir/do_copy.c.o
CopyFile: CMakeFiles/CopyFile.dir/show_usage.c.o
CopyFile: CMakeFiles/CopyFile.dir/build.make
CopyFile: CMakeFiles/CopyFile.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable CopyFile"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CopyFile.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CopyFile.dir/build: CopyFile

.PHONY : CMakeFiles/CopyFile.dir/build

CMakeFiles/CopyFile.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CopyFile.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CopyFile.dir/clean

CMakeFiles/CopyFile.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/CopyFile /home/coolder/Learning/Programming/C_Cpp/CopyFile /home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/CopyFile/cmake-build-debug/CMakeFiles/CopyFile.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CopyFile.dir/depend
