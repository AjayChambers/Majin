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
# FILENAME: "add-gtest-test.cmake"
# DIR_LOC:  "cmake/scripts"
# LICENSE:  "GNU General Public License v3.0"
# DEV:      "Andrew Chambers (Ajay.Chambers@Outlook.com)"
# REPO URL: "Https://GitHub.com/AjayChambers/Majin"
# ISSUES:   "Https://GitHub.com/AjayChambers/Majin/issues"
#
# DESCRIPTION:
#       This file contains a function that is used to add unit tests to the
#       Majin CMake build system.
###########################################################################
Include_Guard(GLOBAL)




function(add_gtest_test TEST_NAME SOURCES_ EXE_NAME INC_DIRS LIBS)
    set(TGT "buffer_test")
    add_executable("buffer_test" ${SOURCES_})

    target_include_directories(${TGT} PRIVATE ${INC_DIRS})
    target_link_libraries(     ${TGT} PRIVATE ${LIBS})

    set_target_properties(${TGT}
        PROPERTIES
            RUNTIME_OUTPUT_DIRECTORY    ${TEST_EXEC_OUTPUT_DIR}
            OUTPUT_NAME                 ${EXE_NAME}
    )

    add_test(
        NAME    ${TGT}
        COMMAND ${EXE_NAME})
endfunction()

# Consider adding the line below to gtest_discover_tests
# PROPERTIES VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"