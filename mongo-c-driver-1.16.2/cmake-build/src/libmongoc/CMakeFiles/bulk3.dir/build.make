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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build

# Include any dependencies generated for this target.
include src/libmongoc/CMakeFiles/bulk3.dir/depend.make

# Include the progress variables for this target.
include src/libmongoc/CMakeFiles/bulk3.dir/progress.make

# Include the compile flags for this target's objects.
include src/libmongoc/CMakeFiles/bulk3.dir/flags.make

src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o: src/libmongoc/CMakeFiles/bulk3.dir/flags.make
src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o: ../src/libmongoc/examples/bulk/bulk3.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o"
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o   -c /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/examples/bulk/bulk3.c

src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.i"
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/examples/bulk/bulk3.c > CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.i

src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.s"
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/examples/bulk/bulk3.c -o CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.s

# Object files for target bulk3
bulk3_OBJECTS = \
"CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o"

# External object files for target bulk3
bulk3_EXTERNAL_OBJECTS =

src/libmongoc/bulk3: src/libmongoc/CMakeFiles/bulk3.dir/examples/bulk/bulk3.c.o
src/libmongoc/bulk3: src/libmongoc/CMakeFiles/bulk3.dir/build.make
src/libmongoc/bulk3: src/libmongoc/libmongoc-1.0.0.0.0.dylib
src/libmongoc/bulk3: /usr/lib/libsasl2.dylib
src/libmongoc/bulk3: /usr/lib/libz.dylib
src/libmongoc/bulk3: src/libbson/libbson-1.0.0.0.0.dylib
src/libmongoc/bulk3: src/libmongoc/CMakeFiles/bulk3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable bulk3"
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bulk3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/libmongoc/CMakeFiles/bulk3.dir/build: src/libmongoc/bulk3

.PHONY : src/libmongoc/CMakeFiles/bulk3.dir/build

src/libmongoc/CMakeFiles/bulk3.dir/clean:
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc && $(CMAKE_COMMAND) -P CMakeFiles/bulk3.dir/cmake_clean.cmake
.PHONY : src/libmongoc/CMakeFiles/bulk3.dir/clean

src/libmongoc/CMakeFiles/bulk3.dir/depend:
	cd /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2 /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/CMakeFiles/bulk3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/libmongoc/CMakeFiles/bulk3.dir/depend

