# Install script for directory: /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc

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
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-1.0.0.0.0.dylib"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-1.0.0.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.0.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.0.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-1.0.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libbson"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-1.0.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-static-1.0.a")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-static-1.0.a" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-static-1.0.a")
    execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmongoc-static-1.0.a")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libmongoc-1.0/mongoc" TYPE FILE FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/mongoc/mongoc-config.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/mongoc/mongoc-version.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-apm.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-bulk-operation.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-change-stream.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-client.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-client-pool.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-client-side-encryption.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-collection.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-cursor.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-database.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-error.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-flags.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-find-and-modify.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-gridfs.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-gridfs-bucket.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-gridfs-file.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-gridfs-file-page.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-gridfs-file-list.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-handshake.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-host-list.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-init.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-index.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-iovec.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-log.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-macros.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-matcher.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-opcode.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-prelude.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-read-concern.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-read-prefs.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-server-description.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-client-session.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-socket.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-tls-libressl.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-tls-openssl.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-buffered.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-file.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-gridfs.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-socket.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-topology-description.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-uri.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-version-functions.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-write-concern.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-rand.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-stream-tls.h"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/mongoc-ssl.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/libmongoc-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/src/mongoc/forwarding/mongoc.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/libmongoc-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/libmongoc-static-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/libmongoc-ssl-1.0.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0/mongoc-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0/mongoc-targets.cmake"
         "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/CMakeFiles/Export/lib/cmake/mongoc-1.0/mongoc-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0/mongoc-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0/mongoc-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/CMakeFiles/Export/lib/cmake/mongoc-1.0/mongoc-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/CMakeFiles/Export/lib/cmake/mongoc-1.0/mongoc-targets-relwithdebinfo.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/mongoc-1.0" TYPE FILE FILES
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/mongoc/mongoc-1.0-config.cmake"
    "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/mongoc/mongoc-1.0-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-1.0-config-version.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-static-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-static-1.0-config.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/libmongoc-static-1.0" TYPE FILE FILES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/libmongoc-static-1.0-config-version.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/build/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/examples/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/src/cmake_install.cmake")
  include("/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/tests/cmake_install.cmake")

endif()

