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
include extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/depend.make

# Include the progress variables for this target.
include extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/progress.make

# Include the compile flags for this target's objects.
include extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/flags.make

# Object files for target glfw
glfw_OBJECTS =

# External object files for target glfw
glfw_EXTERNAL_OBJECTS = \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/context.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/init.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/input.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/monitor.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/vulkan.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/window.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_init.m.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_joystick.m.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_monitor.m.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_window.m.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_time.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/posix_tls.c.o" \
"/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/nsgl_context.m.o"

extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/context.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/init.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/input.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/monitor.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/vulkan.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/window.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_init.m.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_joystick.m.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_monitor.m.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_window.m.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/cocoa_time.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/posix_tls.c.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw_objects.dir/nsgl_context.m.o
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/build.make
extern/nanogui/ext_build/glfw/src/libglfw3.a: extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Linking C static library libglfw3.a"
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src" && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean_target.cmake
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glfw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/build: extern/nanogui/ext_build/glfw/src/libglfw3.a

.PHONY : extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/build

extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/requires:

.PHONY : extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/requires

extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/clean:
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src" && $(CMAKE_COMMAND) -P CMakeFiles/glfw.dir/cmake_clean.cmake
.PHONY : extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/clean

extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/depend:
	cd "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/nanogui/ext/glfw/src" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src" "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/cmake-build-debug/extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : extern/nanogui/ext_build/glfw/src/CMakeFiles/glfw.dir/depend
