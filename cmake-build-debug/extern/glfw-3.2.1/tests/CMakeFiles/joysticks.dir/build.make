# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug"

# Include any dependencies generated for this target.
include extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/depend.make

# Include the progress variables for this target.
include extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/progress.make

# Include the compile flags for this target's objects.
include extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/flags.make

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/flags.make
extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o: ../extern/glfw-3.2.1/tests/joysticks.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/joysticks.dir/joysticks.c.o   -c "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/tests/joysticks.c"

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/joysticks.dir/joysticks.c.i"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/tests/joysticks.c" > CMakeFiles/joysticks.dir/joysticks.c.i

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/joysticks.dir/joysticks.c.s"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/tests/joysticks.c" -o CMakeFiles/joysticks.dir/joysticks.c.s

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.requires:

.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.requires

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.provides: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.requires
	$(MAKE) -f extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/build.make extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.provides.build
.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.provides

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.provides.build: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o


extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/flags.make
extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o: ../extern/glfw-3.2.1/deps/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/joysticks.dir/__/deps/glad.c.o   -c "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/deps/glad.c"

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/joysticks.dir/__/deps/glad.c.i"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/deps/glad.c" > CMakeFiles/joysticks.dir/__/deps/glad.c.i

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/joysticks.dir/__/deps/glad.c.s"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/deps/glad.c" -o CMakeFiles/joysticks.dir/__/deps/glad.c.s

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.requires:

.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.requires

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.provides: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.requires
	$(MAKE) -f extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/build.make extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.provides.build
.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.provides

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.provides.build: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o


# Object files for target joysticks
joysticks_OBJECTS = \
"CMakeFiles/joysticks.dir/joysticks.c.o" \
"CMakeFiles/joysticks.dir/__/deps/glad.c.o"

# External object files for target joysticks
joysticks_EXTERNAL_OBJECTS =

extern/glfw-3.2.1/tests/joysticks: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o
extern/glfw-3.2.1/tests/joysticks: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o
extern/glfw-3.2.1/tests/joysticks: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/build.make
extern/glfw-3.2.1/tests/joysticks: extern/glfw-3.2.1/src/libglfw3.a
extern/glfw-3.2.1/tests/joysticks: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable joysticks"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/joysticks.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/build: extern/glfw-3.2.1/tests/joysticks

.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/build

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/requires: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/joysticks.c.o.requires
extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/requires: extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/__/deps/glad.c.o.requires

.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/requires

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/clean:
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" && $(CMAKE_COMMAND) -P CMakeFiles/joysticks.dir/cmake_clean.cmake
.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/clean

extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/depend:
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/tests" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : extern/glfw-3.2.1/tests/CMakeFiles/joysticks.dir/depend

