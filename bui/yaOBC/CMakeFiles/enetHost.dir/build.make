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
include yaOBC/CMakeFiles/enetHost.dir/depend.make

# Include the progress variables for this target.
include yaOBC/CMakeFiles/enetHost.dir/progress.make

# Include the compile flags for this target's objects.
include yaOBC/CMakeFiles/enetHost.dir/flags.make

yaOBC/CMakeFiles/enetHost.dir/enetHost.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/enetHost.c.o: ../yaOBC/enetHost.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object yaOBC/CMakeFiles/enetHost.dir/enetHost.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/enetHost.c.o   -c /home/cabernar/agc/virtualagc/yaOBC/enetHost.c

yaOBC/CMakeFiles/enetHost.dir/enetHost.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/enetHost.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/yaOBC/enetHost.c > CMakeFiles/enetHost.dir/enetHost.c.i

yaOBC/CMakeFiles/enetHost.dir/enetHost.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/enetHost.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/yaOBC/enetHost.c -o CMakeFiles/enetHost.dir/enetHost.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.o: ../enet/callbacks.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/callbacks.c.o   -c /home/cabernar/agc/virtualagc/enet/callbacks.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/callbacks.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/callbacks.c > CMakeFiles/enetHost.dir/__/enet/callbacks.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/callbacks.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/callbacks.c -o CMakeFiles/enetHost.dir/__/enet/callbacks.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.o: ../enet/compress.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/compress.c.o   -c /home/cabernar/agc/virtualagc/enet/compress.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/compress.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/compress.c > CMakeFiles/enetHost.dir/__/enet/compress.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/compress.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/compress.c -o CMakeFiles/enetHost.dir/__/enet/compress.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.o: ../enet/host.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/host.c.o   -c /home/cabernar/agc/virtualagc/enet/host.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/host.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/host.c > CMakeFiles/enetHost.dir/__/enet/host.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/host.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/host.c -o CMakeFiles/enetHost.dir/__/enet/host.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.o: ../enet/list.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/list.c.o   -c /home/cabernar/agc/virtualagc/enet/list.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/list.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/list.c > CMakeFiles/enetHost.dir/__/enet/list.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/list.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/list.c -o CMakeFiles/enetHost.dir/__/enet/list.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.o: ../enet/packet.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/packet.c.o   -c /home/cabernar/agc/virtualagc/enet/packet.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/packet.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/packet.c > CMakeFiles/enetHost.dir/__/enet/packet.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/packet.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/packet.c -o CMakeFiles/enetHost.dir/__/enet/packet.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.o: ../enet/peer.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/peer.c.o   -c /home/cabernar/agc/virtualagc/enet/peer.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/peer.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/peer.c > CMakeFiles/enetHost.dir/__/enet/peer.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/peer.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/peer.c -o CMakeFiles/enetHost.dir/__/enet/peer.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.o: ../enet/protocol.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/protocol.c.o   -c /home/cabernar/agc/virtualagc/enet/protocol.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/protocol.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/protocol.c > CMakeFiles/enetHost.dir/__/enet/protocol.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/protocol.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/protocol.c -o CMakeFiles/enetHost.dir/__/enet/protocol.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.o: ../enet/unix.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/unix.c.o   -c /home/cabernar/agc/virtualagc/enet/unix.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/unix.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/unix.c > CMakeFiles/enetHost.dir/__/enet/unix.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/unix.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/unix.c -o CMakeFiles/enetHost.dir/__/enet/unix.c.s

yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.o: yaOBC/CMakeFiles/enetHost.dir/flags.make
yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.o: ../enet/win32.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.o"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/enetHost.dir/__/enet/win32.c.o   -c /home/cabernar/agc/virtualagc/enet/win32.c

yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/enetHost.dir/__/enet/win32.c.i"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cabernar/agc/virtualagc/enet/win32.c > CMakeFiles/enetHost.dir/__/enet/win32.c.i

yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/enetHost.dir/__/enet/win32.c.s"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cabernar/agc/virtualagc/enet/win32.c -o CMakeFiles/enetHost.dir/__/enet/win32.c.s

# Object files for target enetHost
enetHost_OBJECTS = \
"CMakeFiles/enetHost.dir/enetHost.c.o" \
"CMakeFiles/enetHost.dir/__/enet/callbacks.c.o" \
"CMakeFiles/enetHost.dir/__/enet/compress.c.o" \
"CMakeFiles/enetHost.dir/__/enet/host.c.o" \
"CMakeFiles/enetHost.dir/__/enet/list.c.o" \
"CMakeFiles/enetHost.dir/__/enet/packet.c.o" \
"CMakeFiles/enetHost.dir/__/enet/peer.c.o" \
"CMakeFiles/enetHost.dir/__/enet/protocol.c.o" \
"CMakeFiles/enetHost.dir/__/enet/unix.c.o" \
"CMakeFiles/enetHost.dir/__/enet/win32.c.o"

# External object files for target enetHost
enetHost_EXTERNAL_OBJECTS =

yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/enetHost.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/callbacks.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/compress.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/host.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/list.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/packet.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/peer.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/protocol.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/unix.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/__/enet/win32.c.o
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/build.make
yaOBC/enetHost: yaOBC/CMakeFiles/enetHost.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cabernar/agc/virtualagc/bui/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking C executable enetHost"
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/enetHost.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
yaOBC/CMakeFiles/enetHost.dir/build: yaOBC/enetHost

.PHONY : yaOBC/CMakeFiles/enetHost.dir/build

yaOBC/CMakeFiles/enetHost.dir/clean:
	cd /home/cabernar/agc/virtualagc/bui/yaOBC && $(CMAKE_COMMAND) -P CMakeFiles/enetHost.dir/cmake_clean.cmake
.PHONY : yaOBC/CMakeFiles/enetHost.dir/clean

yaOBC/CMakeFiles/enetHost.dir/depend:
	cd /home/cabernar/agc/virtualagc/bui && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cabernar/agc/virtualagc /home/cabernar/agc/virtualagc/yaOBC /home/cabernar/agc/virtualagc/bui /home/cabernar/agc/virtualagc/bui/yaOBC /home/cabernar/agc/virtualagc/bui/yaOBC/CMakeFiles/enetHost.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : yaOBC/CMakeFiles/enetHost.dir/depend

