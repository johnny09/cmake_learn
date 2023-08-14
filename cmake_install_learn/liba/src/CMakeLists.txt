cmake_minimum_required(VERSION 3.16.3)
project(liba VERSION 1.0)

find_package(spdlog REQUIRED)

add_library(a liba.cpp)
target_link_libraries(a PRIVATE spdlog::spdlog)
target_include_directories(a PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include> # <prefix>/include/)
)
set_target_properties(a PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/include/liba.h)

# install
install(TARGETS a
    EXPORT aTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBS}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBS}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BIN}
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDES})

install(EXPORT aTargets
    FILE aTargets.cmake
    NAMESPACE a::
    DESTINATION lib/cmake/a)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "aConfigVersion.cmake"
    VERSION ${liba_VERSION}
    COMPATIBILITY AnyNewerVersion)

install(FILES "${CMAKE_SOURCE_DIR}/cmake/aConfig.cmake" "${CMAKE_CURRENT_BINARY_DIR}/aConfigVersion.cmake"
    DESTINATION lib/cmake/a)