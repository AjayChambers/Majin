Include("cache-var")

#----------------------------------------------------------#
# Cached Include-Path: 'BUFFER_INC_DIR'
#----------------------------------------------------------#
cache_path(
    BUFFER_INC_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/include"
    "Buffer library's source include directory"
    FORCE
)



#----------------------------------------------------------#
# Target Static Library: 'buffer'
#----------------------------------------------------------#
add_library(
    buffer STATIC
        "${CMAKE_CURRENT_SOURCE_DIR}/buffer.cxx"
        "${CMAKE_CURRENT_SOURCE_DIR}/include/buffer.hxx"
        "${CMAKE_CURRENT_SOURCE_DIR}/include/iterator.hxx"
)
set_target_properties(
    buffer PROPERTIES
        OUTPUT_NAME                 "MajinBuffer"
        ARCHIVE_OUTPUT_DIRECTORY    "${LIB_OUTPUT_DIR}"
        LIBRARY_OUTPUT_DIRECTORY    "${LIB_OUTPUT_DIR}"
)
target_include_directories(buffer PUBLIC ${BUFFER_INC_DIR})
