# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cabernar/agc/virtualagc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cabernar/agc/virtualagc/bui

# Include any dependencies generated for this target.
include yaAGS/CMakeFiles/yaAGS.dir/depend.make

# Include the progress variables for this target.
include yaAGS/CMakeFiles/yaAGS.dir/progress.make

# Include the compile flags for this target's objects.
include yaAGS/CMakeFiles/yaAGS.dir/flags.make

yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.o: yaAGS/CMakeFiles/yaAGS.dir/flags.make
yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.o: ../yaAGS/mainAGS.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yaAGS.dir/mainAGS.c.o   -c /home/cabernar/agc/virtualagc/yaAGS/mainAGS.c

yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yaAGS.dir/mainAGS.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaAGS/mainAGS.c > CMakeFiles/yaAGS.dir/mainAGS.c.i

yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yaAGS.dir/mainAGS.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaAGS/mainAGS.c -o CMakeFiles/yaAGS.dir/mainAGS.c.s

yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.o: yaAGS/CMakeFiles/yaAGS.dir/flags.make
yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.o: ../yaAGS/symbol_table.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yaAGS.dir/symbol_table.c.o   -c /home/cabernar/agc/virtualagc/yaAGS/symbol_table.c

yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yaAGS.dir/symbol_table.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaAGS/symbol_table.c > CMakeFiles/yaAGS.dir/symbol_table.c.i

yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yaAGS.dir/symbol_table.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaAGS/symbol_table.c -o CMakeFiles/yaAGS.dir/symbol_table.c.s

yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.o: yaAGS/CMakeFiles/yaAGS.dir/flags.make
yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.o: ../yaAGS/nbfgets.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yaAGS.dir/nbfgets.c.o   -c /home/cabernar/agc/virtualagc/yaAGS/nbfgets.c

yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yaAGS.dir/nbfgets.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaAGS/nbfgets.c > CMakeFiles/yaAGS.dir/nbfgets.c.i

yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yaAGS.dir/nbfgets.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaAGS/nbfgets.c -o CMakeFiles/yaAGS.dir/nbfgets.c.s

yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.o: yaAGS/CMakeFiles/yaAGS.dir/flags.make
yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.o: ../yaAGS/Backtrace.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yaAGS.dir/Backtrace.c.o   -c /home/cabernar/agc/virtualagc/yaAGS/Backtrace.c

yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yaAGS.dir/Backtrace.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaAGS/Backtrace.c > CMakeFiles/yaAGS.dir/Backtrace.c.i

yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yaAGS.dir/Backtrace.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaAGS/Backtrace.c -o CMakeFiles/yaAGS.dir/Backtrace.c.s

yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o: yaAGS/CMakeFiles/yaAGS.dir/flags.make
yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o: ../yaAGC/NormalizeSourceName.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o   -c /home/cabernar/agc/virtualagc/yaAGC/NormalizeSourceName.c

yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaAGC/NormalizeSourceName.c > CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.i

yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaAGC/NormalizeSourceName.c -o CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.s

# Object files for target yaAGS
yaAGS_OBJECTS = \
"CMakeFiles/yaAGS.dir/mainAGS.c.o" \
"CMakeFiles/yaAGS.dir/symbol_table.c.o" \
"CMakeFiles/yaAGS.dir/nbfgets.c.o" \
"CMakeFiles/yaAGS.dir/Backtrace.c.o" \
"CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o"

# External object files for target yaAGS
yaAGS_EXTERNAL_OBJECTS =

yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/mainAGS.c.o
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/symbol_table.c.o
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/nbfgets.c.o
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/Backtrace.c.o
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/__/yaAGC/NormalizeSourceName.c.o
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/build.make
yaAGS/yaAGS: yaAGS/liblibyaAGS.a
yaAGS/yaAGS: yaAGC/liblibyaAGC.a
yaAGS/yaAGS: yaAGS/CMakeFiles/yaAGS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable yaAGS"
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yaAGS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
yaAGS/CMakeFiles/yaAGS.dir/build: yaAGS/yaAGS

.PHONY : yaAGS/CMakeFiles/yaAGS.dir/build

yaAGS/CMakeFiles/yaAGS.dir/clean:
	cd /home/cabernar/agc/virtualagc/bui/yaAGS && $(CMAKE_COMMAND) -P CMakeFiles/yaAGS.dir/cmake_clean.cmake
.PHONY : yaAGS/CMakeFiles/yaAGS.dir/clean

yaAGS/CMakeFiles/yaAGS.dir/depend:
	cd /home/cabernar/agc/virtualagc/bui && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cabernar/agc/virtualagc /home/cabernar/agc/virtualagc/yaAGS /home/cabernar/agc/virtualagc/bui /home/cabernar/agc/virtualagc/bui/yaAGS /home/cabernar/agc/virtualagc/bui/yaAGS/CMakeFiles/yaAGS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : yaAGS/CMakeFiles/yaAGS.dir/depend

