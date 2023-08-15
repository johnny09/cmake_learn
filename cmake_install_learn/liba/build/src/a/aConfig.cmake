include(CMakeFindDependencyMacro)

# find_dependency(xxx 2.0)
find_dependency(spdlog REQUIRED)
include(${CMAKE_CURRENT_LIST_DIR}/aTargets.cmake)