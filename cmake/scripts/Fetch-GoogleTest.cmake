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
# FUNCTION: "fetch_googletest(GTestVersion)"
# ARGUMENTS:
#   - GTestVersion: The version of GoogleTest to fetch
#     (`example: "v1.10.0"`)
# DESCRIPTION: "This function uses CMake's FetchContent module to
#   download and include GoogleTest into the project's build. It
#   also configures necessary compile options and settings to
#   ensure that GoogleTest is properly integrated and does not
#   produce unnecessary warnings."
#=========================================================================#
Include_Guard(GLOBAL)

function(fetch_googletest GTestVersion)
  include(FetchContent)
  FetchContent_Declare(googletest
    URL "https://github.com/google/googletest/archive/refs/tags/${GTestVersion}.zip")
  FetchContent_MakeAvailable(googletest)

  # The following compiler flags silence warnings about language extension tokens in
  # the GoogleTest framework's source code. The warnings are inconsequential, as they
  # don't state any actual issues that would affect the functionality of the tests or
  # J-Tool project.
  target_compile_options(gtest
    PRIVATE -Wno-language-extension-token)
  target_compile_options(gtest_main
    PRIVATE -Wno-language-extension-token)

  # Force shares CRT on Windows to avoid linker errors
  # when GoogleTest is linked to a static library
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endfunction()