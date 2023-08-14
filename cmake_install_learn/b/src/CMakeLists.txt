cmake_minimum_required(VERSION 3.16.3)
project(b)

find_package(a PATHS "/home/johnny/Documents/cmake_install_learn/install")

if(a_FOUND)
    message(STATUS "a_DIR:${a_DIR}")
    message(STATUS "a_INCLUDE_DIRS:${a_INCLUDE_DIR}")
endif()

add_executable(b main.cpp)
target_include_directories(b PRIVATE ${a_INCLUDE_DIR})
target_link_libraries(b PRIVATE a)