Include("${CMAKE_CURRENT_LIST_DIR}/scripts/cache-var.cmake")



#-------------------------------------------#
# META INFORMATION VARIABLES
#-------------------------------------------#
cache_var(
    PROJECT_NAME__
    "Majin"
    "Project name (Majin)"
    FORCE)

cache_var(
    PROJECT_DESC__
    "Set of JSON utility interfaces"
    "Project description"
    FORCE)

cache_var(
    PROJECT_VERSION__
    "0.1.0"
    "Current build's version number"



#-------------------------------------------#
# ROOT DIRECTORY PATH
#-------------------------------------------#
cache_path(ROOTDIR__
    "${CMAKE_SOURCE_DIR}/.."
    "Project root directory"
    FORCE)
    "")



#-------------------------------------------#
# SOURCE PATHS
#-------------------------------------------#
cache_path(CMAKE_DIR__
    "${ROOTDIR__}/cmake"
    "CMake directory"
    FORCE)

cache_path(CMAKE_SCRIPTS_DIR__
    "${ROOTDIR__}/cmake/scripts"
    "CMake scripts/modules directory"
    FORCE)

cache_path(SOURCE_DIR__
    "${ROOTDIR__}/source"
    "Source directory"
    FORCE)

cache_path(SOURCE_LIB_DIR__
    "${ROOTDIR__}/source/lib"
    "Project directory for library sources"
    FORCE)

cache_path(SOURCE_CLI_DIR__
    "${ROOTDIR__}/source/cli"
    "Project directory for cli source files"
    FORCE)

cache_path(TEST_DIR__
    "${ROOTDIR__}/test"
    "Test directory"
    FORCE)


#-------------------------------------------#
# DEBUG BUILD PATHS
#-------------------------------------------#
cache_path(DEBUG_BUILD_DIR__
    "${ROOTDIR__}/build/debug"
    "Debug build directory"
    FORCE)

cache_path(DEBUG_BIN_DIR__
    "${DEBUG_BUILD_DIR__}/bin"
    "Debug build binary output directory"
    FORCE)

cache_path(DEBUG_LIB_DIR__
    "${DEBUG_BUILD_DIR__}/lib"
    "Debug build library output directory"
    FORCE)


#-------------------------------------------#
# RELEASE BUILD PATHS
#-------------------------------------------#
cache_path(RELEASE_BUILD_DIR__
    "${ROOTDIR__}/build/release"
    "Release build directory"
    FORCE)

cache_path(RELEASE_BIN_DIR__
    "${RELEASE_BUILD_DIR__}/bin"
    "Release build binary output directory"
    FORCE)

cache_path(RELEASE_LIB_DIR__
    "${RELEASE_BUILD_DIR__}/lib"
    "Release build library output directory"
    FORCE)
