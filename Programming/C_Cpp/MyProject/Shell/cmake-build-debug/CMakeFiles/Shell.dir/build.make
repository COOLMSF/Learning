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
CMAKE_SOURCE_DIR = /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/Shell.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Shell.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Shell.dir/flags.make

CMakeFiles/Shell.dir/main.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Shell.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/main.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/main.c

CMakeFiles/Shell.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/main.c > CMakeFiles/Shell.dir/main.c.i

CMakeFiles/Shell.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/main.c -o CMakeFiles/Shell.dir/main.c.s

CMakeFiles/Shell.dir/sig_int_handler.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/sig_int_handler.c.o: ../sig_int_handler.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Shell.dir/sig_int_handler.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/sig_int_handler.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/sig_int_handler.c

CMakeFiles/Shell.dir/sig_int_handler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/sig_int_handler.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/sig_int_handler.c > CMakeFiles/Shell.dir/sig_int_handler.c.i

CMakeFiles/Shell.dir/sig_int_handler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/sig_int_handler.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/sig_int_handler.c -o CMakeFiles/Shell.dir/sig_int_handler.c.s

CMakeFiles/Shell.dir/clear_variables.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/clear_variables.c.o: ../clear_variables.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Shell.dir/clear_variables.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/clear_variables.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/clear_variables.c

CMakeFiles/Shell.dir/clear_variables.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/clear_variables.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/clear_variables.c > CMakeFiles/Shell.dir/clear_variables.c.i

CMakeFiles/Shell.dir/clear_variables.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/clear_variables.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/clear_variables.c -o CMakeFiles/Shell.dir/clear_variables.c.s

CMakeFiles/Shell.dir/print_history_list.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/print_history_list.c.o: ../print_history_list.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/Shell.dir/print_history_list.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/print_history_list.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/print_history_list.c

CMakeFiles/Shell.dir/print_history_list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/print_history_list.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/print_history_list.c > CMakeFiles/Shell.dir/print_history_list.c.i

CMakeFiles/Shell.dir/print_history_list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/print_history_list.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/print_history_list.c -o CMakeFiles/Shell.dir/print_history_list.c.s

CMakeFiles/Shell.dir/shell_prompt.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/shell_prompt.c.o: ../shell_prompt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/Shell.dir/shell_prompt.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/shell_prompt.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/shell_prompt.c

CMakeFiles/Shell.dir/shell_prompt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/shell_prompt.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/shell_prompt.c > CMakeFiles/Shell.dir/shell_prompt.c.i

CMakeFiles/Shell.dir/shell_prompt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/shell_prompt.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/shell_prompt.c -o CMakeFiles/Shell.dir/shell_prompt.c.s

CMakeFiles/Shell.dir/skipwhite.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/skipwhite.c.o: ../skipwhite.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/Shell.dir/skipwhite.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/skipwhite.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skipwhite.c

CMakeFiles/Shell.dir/skipwhite.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/skipwhite.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skipwhite.c > CMakeFiles/Shell.dir/skipwhite.c.i

CMakeFiles/Shell.dir/skipwhite.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/skipwhite.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skipwhite.c -o CMakeFiles/Shell.dir/skipwhite.c.s

CMakeFiles/Shell.dir/skip_double_quote.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/skip_double_quote.c.o: ../skip_double_quote.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/Shell.dir/skip_double_quote.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/skip_double_quote.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skip_double_quote.c

CMakeFiles/Shell.dir/skip_double_quote.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/skip_double_quote.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skip_double_quote.c > CMakeFiles/Shell.dir/skip_double_quote.c.i

CMakeFiles/Shell.dir/skip_double_quote.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/skip_double_quote.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/skip_double_quote.c -o CMakeFiles/Shell.dir/skip_double_quote.c.s

CMakeFiles/Shell.dir/change_directory.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/change_directory.c.o: ../change_directory.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/Shell.dir/change_directory.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/change_directory.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/change_directory.c

CMakeFiles/Shell.dir/change_directory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/change_directory.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/change_directory.c > CMakeFiles/Shell.dir/change_directory.c.i

CMakeFiles/Shell.dir/change_directory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/change_directory.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/change_directory.c -o CMakeFiles/Shell.dir/change_directory.c.s

CMakeFiles/Shell.dir/execute_inbuild_commands.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/execute_inbuild_commands.c.o: ../execute_inbuild_commands.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/Shell.dir/execute_inbuild_commands.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/execute_inbuild_commands.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_inbuild_commands.c

CMakeFiles/Shell.dir/execute_inbuild_commands.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/execute_inbuild_commands.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_inbuild_commands.c > CMakeFiles/Shell.dir/execute_inbuild_commands.c.i

CMakeFiles/Shell.dir/execute_inbuild_commands.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/execute_inbuild_commands.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_inbuild_commands.c -o CMakeFiles/Shell.dir/execute_inbuild_commands.c.s

CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o: ../tokenize_redirect_input_output.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input_output.c

CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input_output.c > CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.i

CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input_output.c -o CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.s

CMakeFiles/Shell.dir/tokenize_redirect_input.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/tokenize_redirect_input.c.o: ../tokenize_redirect_input.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/Shell.dir/tokenize_redirect_input.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/tokenize_redirect_input.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input.c

CMakeFiles/Shell.dir/tokenize_redirect_input.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/tokenize_redirect_input.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input.c > CMakeFiles/Shell.dir/tokenize_redirect_input.c.i

CMakeFiles/Shell.dir/tokenize_redirect_input.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/tokenize_redirect_input.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_input.c -o CMakeFiles/Shell.dir/tokenize_redirect_input.c.s

CMakeFiles/Shell.dir/execute_command.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/execute_command.c.o: ../execute_command.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/Shell.dir/execute_command.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/execute_command.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_command.c

CMakeFiles/Shell.dir/execute_command.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/execute_command.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_command.c > CMakeFiles/Shell.dir/execute_command.c.i

CMakeFiles/Shell.dir/execute_command.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/execute_command.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/execute_command.c -o CMakeFiles/Shell.dir/execute_command.c.s

CMakeFiles/Shell.dir/tokenize_by_space.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/tokenize_by_space.c.o: ../tokenize_by_space.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/Shell.dir/tokenize_by_space.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/tokenize_by_space.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_space.c

CMakeFiles/Shell.dir/tokenize_by_space.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/tokenize_by_space.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_space.c > CMakeFiles/Shell.dir/tokenize_by_space.c.i

CMakeFiles/Shell.dir/tokenize_by_space.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/tokenize_by_space.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_space.c -o CMakeFiles/Shell.dir/tokenize_by_space.c.s

CMakeFiles/Shell.dir/check_for_bckgrnd.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/check_for_bckgrnd.c.o: ../check_for_bckgrnd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/Shell.dir/check_for_bckgrnd.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/check_for_bckgrnd.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/check_for_bckgrnd.c

CMakeFiles/Shell.dir/check_for_bckgrnd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/check_for_bckgrnd.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/check_for_bckgrnd.c > CMakeFiles/Shell.dir/check_for_bckgrnd.c.i

CMakeFiles/Shell.dir/check_for_bckgrnd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/check_for_bckgrnd.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/check_for_bckgrnd.c -o CMakeFiles/Shell.dir/check_for_bckgrnd.c.s

CMakeFiles/Shell.dir/tokenize_by_pipe.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/tokenize_by_pipe.c.o: ../tokenize_by_pipe.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/Shell.dir/tokenize_by_pipe.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/tokenize_by_pipe.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_pipe.c

CMakeFiles/Shell.dir/tokenize_by_pipe.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/tokenize_by_pipe.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_pipe.c > CMakeFiles/Shell.dir/tokenize_by_pipe.c.i

CMakeFiles/Shell.dir/tokenize_by_pipe.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/tokenize_by_pipe.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_by_pipe.c -o CMakeFiles/Shell.dir/tokenize_by_pipe.c.s

CMakeFiles/Shell.dir/tokenize_redirect_output.c.o: CMakeFiles/Shell.dir/flags.make
CMakeFiles/Shell.dir/tokenize_redirect_output.c.o: ../tokenize_redirect_output.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/Shell.dir/tokenize_redirect_output.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Shell.dir/tokenize_redirect_output.c.o -c /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_output.c

CMakeFiles/Shell.dir/tokenize_redirect_output.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Shell.dir/tokenize_redirect_output.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_output.c > CMakeFiles/Shell.dir/tokenize_redirect_output.c.i

CMakeFiles/Shell.dir/tokenize_redirect_output.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Shell.dir/tokenize_redirect_output.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/tokenize_redirect_output.c -o CMakeFiles/Shell.dir/tokenize_redirect_output.c.s

# Object files for target Shell
Shell_OBJECTS = \
"CMakeFiles/Shell.dir/main.c.o" \
"CMakeFiles/Shell.dir/sig_int_handler.c.o" \
"CMakeFiles/Shell.dir/clear_variables.c.o" \
"CMakeFiles/Shell.dir/print_history_list.c.o" \
"CMakeFiles/Shell.dir/shell_prompt.c.o" \
"CMakeFiles/Shell.dir/skipwhite.c.o" \
"CMakeFiles/Shell.dir/skip_double_quote.c.o" \
"CMakeFiles/Shell.dir/change_directory.c.o" \
"CMakeFiles/Shell.dir/execute_inbuild_commands.c.o" \
"CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o" \
"CMakeFiles/Shell.dir/tokenize_redirect_input.c.o" \
"CMakeFiles/Shell.dir/execute_command.c.o" \
"CMakeFiles/Shell.dir/tokenize_by_space.c.o" \
"CMakeFiles/Shell.dir/check_for_bckgrnd.c.o" \
"CMakeFiles/Shell.dir/tokenize_by_pipe.c.o" \
"CMakeFiles/Shell.dir/tokenize_redirect_output.c.o"

# External object files for target Shell
Shell_EXTERNAL_OBJECTS =

Shell: CMakeFiles/Shell.dir/main.c.o
Shell: CMakeFiles/Shell.dir/sig_int_handler.c.o
Shell: CMakeFiles/Shell.dir/clear_variables.c.o
Shell: CMakeFiles/Shell.dir/print_history_list.c.o
Shell: CMakeFiles/Shell.dir/shell_prompt.c.o
Shell: CMakeFiles/Shell.dir/skipwhite.c.o
Shell: CMakeFiles/Shell.dir/skip_double_quote.c.o
Shell: CMakeFiles/Shell.dir/change_directory.c.o
Shell: CMakeFiles/Shell.dir/execute_inbuild_commands.c.o
Shell: CMakeFiles/Shell.dir/tokenize_redirect_input_output.c.o
Shell: CMakeFiles/Shell.dir/tokenize_redirect_input.c.o
Shell: CMakeFiles/Shell.dir/execute_command.c.o
Shell: CMakeFiles/Shell.dir/tokenize_by_space.c.o
Shell: CMakeFiles/Shell.dir/check_for_bckgrnd.c.o
Shell: CMakeFiles/Shell.dir/tokenize_by_pipe.c.o
Shell: CMakeFiles/Shell.dir/tokenize_redirect_output.c.o
Shell: CMakeFiles/Shell.dir/build.make
Shell: CMakeFiles/Shell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking C executable Shell"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Shell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Shell.dir/build: Shell

.PHONY : CMakeFiles/Shell.dir/build

CMakeFiles/Shell.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Shell.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Shell.dir/clean

CMakeFiles/Shell.dir/depend:
	cd /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug /home/coolder/Learning/Programming/C_Cpp/MyProject/Shell/cmake-build-debug/CMakeFiles/Shell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Shell.dir/depend

