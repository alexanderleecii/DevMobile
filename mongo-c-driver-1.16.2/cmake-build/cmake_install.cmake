# Install script for directory: /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2

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
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mongo-c-driver" TYPE FILE FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/COPYING"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/NEWS"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/README.rst"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/THIRD_PARTY_NOTICES"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/build/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/orchestration_configs/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/generate_uninstall/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
