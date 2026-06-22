add_library(
    buffer
    STATIC
        "${CMAKE_CURRENT_SOURCE_DIR}/buffer.cxx"
        "${CMAKE_CURRENT_SOURCE_DIR}/include/buffer.hxx"
        "${CMAKE_CURRENT_SOURCE_DIR}/include/iterator.hxx"
)

target_include_directories(
    buffer
    PUBLIC
        "${CMAKE_CURRENT_SOURCE_DIR}/include"
        "${CMAKE_SOURCE_DIR}/include"
)

set_target_properties(buffer PROPERTIES
        OUTPUT_NAME                 "jbox-buffer"
        ARCHIVE_OUTPUT_DIRECTORY    "${CMAKE_BINARY_DIR}/lib"
        LIBRARY_OUTPUT_DIRECTORY    "${CMAKE_BINARY_DIR}/lib"
)
