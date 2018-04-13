cmake_minimum_required(VERSION 3.7)
project(load_mesh)

set(CMAKE_CXX_STANDARD 11)

#include_directories(/usr/local/Cellar/libigl/include/)
add_definitions(-DIGL_VIEWER_WITH_NANOGUI)

### LIBRARIES ###
#-lglfw -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo
### EIGEN
set(EIGEN3_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/eigen/3.3.4/include/eigen3/ )
INCLUDE_DIRECTORIES(${EIGEN3_INCLUDE_DIR})
LIST(APPEND LIB_LIBRARIES ${EIGEN3_INCLUDE_DIR})

### LIBIGL
set(LIBIGL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/libigl/)
INCLUDE_DIRECTORIES(${LIBIGL_DIR})
LIST(APPEND LIB_LIBRARIES ${LIBIGL_DIR} )


### GLEW
set(GLEW_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/ext/glew/include/)
INCLUDE_DIRECTORIES(${GLEW_DIR})
LIST(APPEND LIB_LIBRARIES ${GLEW_DIR} )

### OPENGL
FIND_PACKAGE(OpenGL REQUIRED)
INCLUDE_DIRECTORIES(${OPENGL_INCLUDE_DIR})
LIST(APPEND LIB_LIBRARIES ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY} )
LINK_LIBRARIES(${OPENGL_gl_LIBRARY})
LINK_LIBRARIES(${OPENGL_glu_LIBRARY})

### GLFW
# Assuming glfw was built and installed in ../extern
#set( GLFW3_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/extern/glfw-3.2.1/include/GLFW/" )
#INCLUDE_DIRECTORIES(${GLFW3_INCLUDE_DIR})
#LIST(APPEND LIB_LIBRARIES ${GLFW3_LIBRARY} )
#target_link_libraries(${CMAKE_CURRENT_SOURCE_DIR}/cmake-build-debug/main.cpp GLFW3_INCLUDE_DIR)
#main.cpp.o
#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/extern/glfw-3.2.1/)
#link_libraries(${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/ext_build/glfw/src/libglfw.3.2.dylib)

### GLEW
if(WIN32)
    set(GLEW_DIR "${CMAKE_CURRENT_SOURCE_DIR}/extern/glew-1.13.0/")
    set(GLEW_INSTALL_DIR "${GLEW_DIR}")
    set(GLEW_LIBRARIES "glew32")
    set(GLEW_INCLUDE_DIRS "${GLEW_INSTALL_DIR}/include")
    set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};${GLFW_LIBRARY_DIR};${GLEW_INSTALL_DIR}/lib/Release/x64")
else(WIN32)
    SET(GLEW_STATIC)
    FIND_PACKAGE(GLEW REQUIRED)
    MESSAGE(STATUS "GLEW_INCLUDE_DIRS: ${GLEW_INCLUDE_DIRS}" )
    MESSAGE(STATUS "GLEW_LIBRARIES: ${GLEW_LIBRARIES}" )
endif(WIN32)
INCLUDE_DIRECTORIES(${GLEW_INCLUDE_DIRS})
LIST(APPEND LIB_LIBRARIES ${GLEW_LIBRARIES})


### NANO-GUI
#set(NANO_GUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/include)
#set(NANO_GUI_SRC ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/src/)
#INCLUDE_DIRECTORIES(${NANO_GUI_DIR})
#LINK_LIBRARIES(${NANO_GUI_SRC})
#LIST(APPEND LIB_LIBRARIES ${NANO_GUI_DIR})
#file(GLOB LIBRARIES ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/libnanogui.dylib)

# Add the configurations from nanogui
set(NANOGUI_BUILD_EXAMPLE OFF CACHE BOOL " " FORCE)
set(NANOGUI_BUILD_PYTHON  OFF CACHE BOOL " " FORCE)
set(NANOGUI_INSTALL       OFF CACHE BOOL " " FORCE)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui)
if (NOT WIN32)
    set_target_properties(nanogui-obj PROPERTIES COMPILE_FLAGS -Wno-deprecated-declarations)
    set_target_properties(nanogui PROPERTIES COMPILE_FLAGS -Wno-deprecated-declarations)
endif()
set(NANO_GUI_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/include)
INCLUDE_DIRECTORIES(${NANO_GUI_DIR})

set_property(TARGET glfw glfw_objects nanogui PROPERTY FOLDER "dependencies")

add_definitions(${NANOGUI_EXTRA_DEFS})
MESSAGE(STATUS "NANOGUI_EXTRA_DEFS ${NANOGUI_EXTRA_DEFS}")

include_directories(${NANOGUI_EXTRA_INCS})
MESSAGE(STATUS "NANOGUI_EXTRA_INCS: ${NANOGUI_EXTRA_INCS}")

MESSAGE(STATUS "NANOGUI_EXTRA_LIBS: ${NANOGUI_EXTRA_LIBS}")
link_libraries(${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/ext_build/glfw/src/libglfw.3.2.dylib)

### NANOVG
#set(NANOVG_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/extern/nanogui/ext/nanovg/src/ )
#INCLUDE_DIRECTORIES(${NANOVG_INCLUDE_DIR})
#LIST(APPEND LIB_LIBRARIES ${NANOVG_INCLUDE_DIR})

set(SOURCE_FILES main.cpp cmake-build-debug/main.cpp cmake-build-debug/ICP.cpp cmake-build-debug/ICP.h cmake-build-debug/ICPSubset.cpp cmake-build-debug/ICPSubset.h cmake-build-debug/MultiviewRegistration.cpp cmake-build-debug/MultiviewRegistration.h cmake-build-debug/ICP_Point2Plane.cpp cmake-build-debug/ICP_Point2Plane.h test.cpp test.h)
add_executable(load_mesh ${SOURCE_FILES} test.cpp test.h)
#target_link_libraries(load_mesh ${LIB_LIBRARIES} ${LIBRARIES})

# Add defines
#target_compile_definitions(load_mesh PUBLIC -DNANOVG_GL3_IMPLEMENTATION)
if (WIN32)
    target_compile_definitions(load_mesh PUBLIC -DGLFW_INCLUDE_NONE -DNDEBUG -D_CONSOLE -D_USE_MATH_DEFINES -D_CRT_SECURE_NO_WARNINGS -DGLEW_STATIC)
endif()

if (NOT WIN32)
    set_target_properties(load_mesh PROPERTIES COMPILE_FLAGS -Wno-deprecated-declarations)
endif()

# Link dependency libraries
target_link_libraries(load_mesh
        nanogui
        ${NANOGUI_EXTRA_LIBS}
        ${GLEW_LIBRARIES}
        )