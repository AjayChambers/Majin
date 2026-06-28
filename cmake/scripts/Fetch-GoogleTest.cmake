#=========================================================================#
# J-TOOL
# "A set of libraries for analyzing, manipulating, validating, formatting,
# and templating ECMA-404 JSON data. Also provides an interface for working
# with abstract generic JSON types in C++ environments, and a library for
# working with JSON Schema."
#
# Copyright (C) 2026 Andrew J Chambers Jr
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#=========================================================================#

#=========================================================================#
# FILE:  "Fetch-GoogleTest.cmake"
# DESC: "This CMake script defines the fetch_googletest function (for more
#   info @see the 'fetch_googletest' comment block below)."
# LICENSE:    "GNU General Public License v3.0 (GPL-3.0)"
# AUTHOR:     "Ajay Chambers <Ajay.Chambers@Outlook.com>"
# REPOSITORY: "https://GitHub.com/AjayChambers/J-Tool"
#=========================================================================#

#=========================================================================#
# FUNCTION:
#   fetch_googletest(GTestVersion)
# ARGUMENTS:
#   GTestVersion: The GoogleTest version to fetch (e.g. "v1.10.0").
# DESCRIPTION:
#   This function uses the FetchContent module to download and include
#   GoogleTest into the project's build. It also configures necessary
#   compile options and settings to ensure that GoogleTest is properly
#   integrated and does not produce unnecessary warnings.
#=========================================================================#
Include_Guard(GLOBAL)

function(fetch_googletest GTestVersion)
  include(FetchContent)
  FetchContent_Declare(googletest
    URL "https://github.com/google/googletest/archive/refs/tags/${GTestVersion}.zip")
  FetchContent_MakeAvailable(googletest)

  # Force shares CRT on Windows to avoid linker errors
  # when GoogleTest is linked to a static library
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

  # The following property settings isolate GoogleTest from the strict warnings that are
  # enabled throughout the Majin project. This workaround is necessary because the
  # compiler configuration used by all Majin targets is more strict than the the compiler
  # configuration used by GoogleTest.
  set_target_properties(gtest PROPERTIES COMPILE_OPTIONS "-Wno-character-conversion")
  set_target_properties(gmock PROPERTIES COMPILE_OPTIONS "-Wno-character-conversion")
  set_target_properties(gmock_main PROPERTIES COMPILE_OPTIONS "-Wno-character-conversion")
endfunction()