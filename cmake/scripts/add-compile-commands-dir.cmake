include_guard(GLOBAL)
###########################################################################
# FUNC: add_compile_commands_dir
# DESC: Checks if the directory `build/compile_commands` exists, creates it
#   if not. Next the function links the generated 'compile_commands' file
#   to the build/compile_commands directory.
###########################################################################
function(add_compile_commands_dir)
    set(TGT_DIR "${CMAKE_SOURCE_DIR}/build/compile_commands")
    set(FPATH   "${TGT_DIR}/compile_commands.json")

    if(EXISTS FPATH)
        file(REMOVE ${FPATH})
    elseif(NOT EXISTS TGT_DIR)
        file(MAKE_DIRECTORY ${TGT_DIR})
    endif()

    add_custom_target(add_compile_commands_dir
        ALL COMMAND
            ${CMAKE_COMMAND} -E create_symlink
            ${CMAKE_BINARY_DIR}/compile_commands.json
            ${FPATH})
endfunction()