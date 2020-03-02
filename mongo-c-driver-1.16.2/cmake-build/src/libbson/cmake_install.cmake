# Install script for directory: /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-1.0.0.0.0.dylib"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-1.0.0.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.0.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.0.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-1.0.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-1.0.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-static-1.0.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-static-1.0.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-static-1.0.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libbson-static-1.0.a")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libbson-1.0/bson" TYPE FILE FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/src/bson/bson-config.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/src/bson/bson-version.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bcon.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-atomic.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-clock.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-compat.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-context.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-decimal128.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-endian.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-error.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-iter.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-json.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-keys.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-macros.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-md5.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-memory.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-oid.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-prelude.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-reader.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-string.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-types.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-utf8.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-value.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-version-functions.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/bson-writer.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libbson-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libbson/src/bson/forwarding/bson.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/src/libbson-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/src/libbson-static-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0/bson-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0/bson-targets.cmake"
         "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/CMakeFiles/Export/lib/cmake/bson-1.0/bson-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0/bson-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0/bson-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/CMakeFiles/Export/lib/cmake/bson-1.0/bson-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/CMakeFiles/Export/lib/cmake/bson-1.0/bson-targets-relwithdebinfo.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/bson-1.0" TYPE FILE FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/bson/bson-1.0-config.cmake"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/bson/bson-1.0-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-1.0-config-version.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-static-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-static-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libbson-static-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/libbson-static-1.0-config-version.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/build/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/examples/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/src/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson/tests/cmake_install.cmake")

endif()

