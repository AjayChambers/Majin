Include_Guard(GLOBAL)
###########################################################################
# MAJIN PROJECT: JSON Analyzer, Parser & Formatter
#
# Copyright (C) 2026 "Andrew Jay Chambers Jr"
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of
# the License, or at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public
# License along with this program. If you did not receive a copy
# visit <"https://www.gnu.org/licenses/">
#
# -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- #
#
# FILENAME: "cmake/MajinConfig.cmake"
# LICENSE:  "GNU General Public License v3.0"
# AUTHOR:   "Andrew J Chambers Jr"
# EMAIL:    "Ajay.Chambers@Outlook.com"
# REPO URL: "Https://GitHub.com/AjayChambers/Majin"
# BUGS URL: "Https://GitHub.com/AjayChambers/Majin/issues"
#
# DESCRIPTION:
#   "This file contains a few variables that are used to configure Majin's
#   CMake build system."
#
# INSTRUCTIONS:
#   To configure this file edit the variables below by changing the value
#   assigned to the variables set by the cmake `set()` function. Obviously
#   do not edit the includes or include guard below, and do not edit any
#   past the point that reads: "DO NOT EDIT CODE BELOW THIS LINE"
###########################################################################
Include("${CMAKE_CURRENT_LIST_DIR}/scripts/add-compile-commands-dir.cmake")
Include("${CMAKE_CURRENT_LIST_DIR}/scripts/cache-var.cmake")


# CMAKE CONFIG
set(MAJIN_CMAKE_VERSION_    "4.3.2")

# MAJIN META CONFIG
set(MAJIN_DESCRIPTION_      "JSON Analyzer, AST Generator & Formatter")
set(MAJIN_VER_MAJOR_        "0")
set(MAJIN_VER_MINOR_        "1")
set(MAJIN_VER_PATCH_        "0")

# MAJIN BUILD CONFIG
set(EXEC_OUTPUT_DIR_        "bin")
set(TEST_EXEC_OUTPUT_DIR_   "test/bin")
set(LIB_OUTPUT_DIR_         "lib")


    ###################################################
    ## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ##
    ## !!                                         !! ##
    ## !!  DO NOT EDIT THE CODE BELOW THIS POINT  !! ##
    ## !!                                         !! ##
    ## !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ##
    ###################################################

#-----------------------------------------------------------#
# CACHED & CONFIGURED META INFORMATION VALUES
#-----------------------------------------------------------#
cache_var(
    PROJECT_NAME
    "Majin"
    "Project's name (Majin)."
    FORCE)

cache_var(
    MAJIN_DESCRIPTION
    ${MAJIN_DESCRIPTION_}
    "Majin project's description."
    FORCE)

cache_var(
    MAJIN_VERSION
    "${MAJIN_VER_MAJOR_}.${MAJIN_VER_MINOR_}.${MAJIN_VER_PATCH_}"
    "Majin version to be built."
    "")




#----------------------------------------------------------#
# CACHED & CONFIGURED BUILD SYSTEM CONFIGURATION VALUES
#----------------------------------------------------------#
cache_path(EXEC_OUTPUT_DIR
    "${CMAKE_BINARY_DIR}/${EXEC_OUTPUT_DIR_}"
    "Directory where executable binaries are created and stored @(${CMAKE_BINARY_DIR}/${EXEC_OUTPUT_DIR_})"
    FORCE)

cache_path(TEST_EXEC_OUTPUT_DIR
    "${CMAKE_BINARY_DIR}/${TEST_EXEC_OUTPUT_DIR_}"
    "Directory where test executable binaries are created and stored @(${CMAKE_BINARY_DIR}/${TEST_EXEC_OUTPUT_DIR_})"
    FORCE)

cache_path(LIB_OUTPUT_DIR
    "${CMAKE_BINARY_DIR}/${LIB_OUTPUT_DIR_}"
    "Directory where library binaries are created and stored @(${CMAKE_BINARY_DIR}/${LIB_OUTPUT_DIR_})"
    FORCE)

add_compile_commands_dir()