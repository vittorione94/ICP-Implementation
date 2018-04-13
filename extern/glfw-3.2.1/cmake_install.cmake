# Install script for directory: /Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/include/GLFW" FILES_MATCHING REGEX "/glfw3\\.h$" REGEX "/glfw3native\\.h$")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3" TYPE FILE FILES
    "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/src/glfw3Config.cmake"
    "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/src/glfw3ConfigVersion.cmake"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3/glfw3Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3/glfw3Targets.cmake"
         "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/CMakeFiles/Export/lib/cmake/glfw3/glfw3Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3/glfw3Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3/glfw3Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3" TYPE FILE FILES "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/CMakeFiles/Export/lib/cmake/glfw3/glfw3Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/glfw3" TYPE FILE FILES "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/CMakeFiles/Export/lib/cmake/glfw3/glfw3Targets-noconfig.cmake")
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/src/glfw3.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/src/cmake_install.cmake")
  include("/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/examples/cmake_install.cmake")
  include("/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/tests/cmake_install.cmake")
  include("/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/docs/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/vittorione/Documents/3DGeometryWorkspcae/Load mesh/extern/glfw-3.2.1/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
