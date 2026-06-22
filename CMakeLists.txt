CMAKE_MINIMUM_REQUIRED(VERSION 4.3.2)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

Include("cmake/MajinGlobals.cmake")

list(APPEND CMAKE_MODULE_PATH
    "cmake"
    "cmake/scripts")

project(${PROJECT_NAME__}
    VERSION ${PROJECT_VERSION__}
    DESCRIPTION ${PROJECT_DESC__}
    LANGUAGES CXX)

add_compile_options(-g -O0 -Wall -Wextra)

include_directories(
    "${CMAKE_SOURCE_DIR}/include"
    "${CMAKE_SOURCE_DIR}/source/lib/buffer/include"
    "${CMAKE_SOURCE_DIR}/source/lib/text-file/include")

add_subdirectory("source")

# if (CMAKE_BUILD_TYPE STREQUAL "Debug")
#     add_subdirectory("test")
# endif()