CMAKE_MINIMUM_REQUIRED(VERSION 4.3.2)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

Include("${CMAKE_SOURCE_DIR}/cmake/MajinConfig.cmake")

project(
    "Majin"
    VERSION     ${MAJIN_VERSION}
    DESCRIPTION ${MAJIN_DESCRIPTION}
    LANGUAGES   CXX)

list(APPEND
    CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/cmake/scripts")

include_directories("${CMAKE_SOURCE_DIR}/include")

# PROJECT DEBUG CONFIG
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "BUILD TYPE = 'Debug'")
    add_compile_options(-g -O0 -std=c++23 -Wall -Wextra -Wpedantic)
    add_subdirectory("source")
    add_subdirectory("test")
endif()


# PROJECT RELEASE CONFIG
if(CMAKE_BUILD_TYPE STREQUAL "Release") # RELEASE FLAGS
    message(STATUS "BUILD TYPE = 'Release'")
    add_compile_options(
        -Wall -Wextra -Wpedantic -O3 -DNDEBUG -std=c++23 -flto=full)
    add_link_options(-flto=full)
    add_subdirectory("source")
endif()



if (CMAKE_BUILD_TYPE STREQUAL "Debug")
endif()