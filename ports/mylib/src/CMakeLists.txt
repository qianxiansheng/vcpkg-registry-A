cmake_minimum_required(VERSION 3.20)
project(mylib CXX)

add_library(mylib STATIC mylib.cpp)
target_include_directories(mylib PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")

install(TARGETS mylib ARCHIVE DESTINATION lib)
install(FILES mylib.h DESTINATION include)
