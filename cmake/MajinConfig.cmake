###########################################################################
#
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
Include_Guard(GLOBAL)
Include("${CMAKE_CURRENT_LIST_DIR}/MajinGlobals.cmake")


set(COMPILE_COMMANDS_OUTPUT_DIR "${CMAKE_BINARY_DIR}/compile_commands")

















###########################################################################
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
# !!                                                                   !! #
# !!                                                                   !! #
# !!              DO NOT EDIT THE CODE BELOW THIS POINT                !! #
# !!                                                                   !! #
# !!                                                                   !! #
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
###########################################################################



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
    "") # Does not force set the variable, as the version
        # must be dynamically settable.



#-------------------------------------------#
# ROOT DIRECTORY PATH:
#   A sugary variable that is equal to using
#   'CMAKE_SOURCE_DIR'.
#-------------------------------------------#
cache_path(ROOTDIR__
    "${CMAKE_SOURCE_DIR}/.."
    "Project root directory"
    FORCE)



#-------------------------------------------#
# COMPILER CONFIGURATION VARIABLES:
#   Variables that are used to configure the
#   directory structure of the build output.
#-------------------------------------------#
# DEBUG BUILD PATHS
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


# RELEASE BUILD PATHS
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