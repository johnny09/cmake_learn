cmake_minimum_required(VERSION 3.16.3)
project(a VERSION 1.0)

find_package(spdlog REQUIRED)
add_library(a SHARED liba.cpp)

target_link_libraries(a PUBLIC spdlog::spdlog)
target_include_directories(a PUBLIC
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include> # <prefix>/include/)
)
set_target_properties(a PROPERTIES PUBLIC_HEADER ${CMAKE_SOURCE_DIR}/include/liba.h)

# install
install(TARGETS a EXPORT aTargets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION include
)
install(
    FILES
    ${CMAKE_SOURCE_DIR}/include/liba.h
    DESTINATION
    include
    COMPONENT
    Devel
)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/a/aConfigVersion.cmake"
    VERSION ${a_VERSION}
    COMPATIBILITY AnyNewerVersion
)

export(EXPORT aTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/a/aTargets.cmake"
    NAMESPACE a::
)
configure_file(${CMAKE_SOURCE_DIR}/cmake/aConfig.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/a/aConfig.cmake"
    COPYONLY
)

set(ConfigPackageLocation lib/cmake/a)
install(EXPORT aTargets
    FILE
    aTargets.cmake
    NAMESPACE
    a::
    DESTINATION
    ${ConfigPackageLocation}
)
install(
    FILES
    ${CMAKE_SOURCE_DIR}/cmake/aConfig.cmake
    "${CMAKE_CURRENT_BINARY_DIR}/a/aConfigVersion.cmake"
    DESTINATION
    ${ConfigPackageLocation}
    COMPONENT
    Devel
)