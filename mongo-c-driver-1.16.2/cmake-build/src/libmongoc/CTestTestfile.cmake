# CMake generated Testfile for 
# Source directory: /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc
# Build directory: /Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test-libmongoc "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/cmake-build/src/libmongoc/test-libmongoc")
set_tests_properties(test-libmongoc PROPERTIES  WORKING_DIRECTORY "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/../.." _BACKTRACE_TRIPLES "/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/CMakeLists.txt;907;add_test;/Users/user165103/Desktop/MOP/mongo-c-driver-1.16.2/src/libmongoc/CMakeLists.txt;0;")
subdirs("build")
subdirs("examples")
subdirs("src")
subdirs("tests")
