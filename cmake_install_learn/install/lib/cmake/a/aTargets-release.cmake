#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "a::a" for configuration "Release"
set_property(TARGET a::a APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(a::a PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liba.so"
  IMPORTED_SONAME_RELEASE "liba.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS a::a )
list(APPEND _IMPORT_CHECK_FILES_FOR_a::a "${_IMPORT_PREFIX}/lib/liba.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
