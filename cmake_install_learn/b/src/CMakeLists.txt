cmake_minimum_required(VERSION 3.16.3)
project(b)

find_package(a PATHS "/home/johnny/Documents/cmake_learn/cmake_install_learn/install")

if(a_FOUND)
    message(STATUS "a_DIR:${a_DIR}")
    message(STATUS "a_INCLUDE_DIR:${a_INCLUDE_DIR}")
    message(STATUS "a_LIBRARY:${a_LIB}")
endif()

add_executable(b main.cpp)

# target_include_directories(b PRIVATE "/home/johnny/Documents/cmake_learn/cmake_install_learn/install/include")
# target_link_directories(b PRIVATE "/home/johnny/Documents/cmake_learn/cmake_install_learn/install/lib")
target_link_libraries(b PUBLIC a::a spdlog::spdlog)