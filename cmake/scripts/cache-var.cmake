include_guard(GLOBAL)
#################################################################
# FUNC: cache_var
# DESC: Set a variable and cache it in the parent scope.
# ARGS:
#   NAME_  - The name of the variable to set and cache.
#   VALUE_ - The value to assign to the variable.
#   DESC_  - A description for the cached variable.
#################################################################
function(cache_var NAME_ VALUE_ DESC_ FORCE_)
  set(${NAME_} "${VALUE_}" PARENT_SCOPE)
  if(NOT FORCE_ EQUAL "FORCE")
    set(FORCE_ "")
  endif()
  set(${NAME_} "${VALUE_}" CACHE STRING "${DESC_}" ${FORCE_})
endfunction()




#################################################################
# FUNC: cache_path
# DESC: Set a variable as a path and cache it in the parent scope.
# ARGS:
#   NAME_  - The name of the variable to set and cache.
#   VALUE_ - The value to assign to the variable.
#   DESC_  - A description for the cached variable.
#################################################################
function(cache_path NAME_ VALUE_ DESC_ FORCE_)
  set(${NAME_} "${VALUE_}" PARENT_SCOPE)
    if(NOT FORCE_ EQUAL "FORCE")
      set(FORCE_ "")
    endif()
  set(${NAME_} "${VALUE_}" CACHE PATH "${DESC_}" ${FORCE_})
endfunction()




#################################################################
# FUNC: cache_filepath
# DESC: Set a variable as a file path and cache it in the parent scope.
# ARGS:
#   NAME_  - The name of the variable to set and cache.
#   VALUE_ - The value to assign to the variable.
#   DESC_  - A description for the cached variable.
#################################################################
function(cache_filepath NAME_ VALUE_ DESC_ FORCE_)
  set(${NAME_} "${VALUE_}" PARENT_SCOPE)
    if(NOT FORCE_ EQUAL "FORCE")
      set(FORCE_ "")
    endif()
  set(${NAME_} "${VALUE_}" CACHE FILEPATH "${DESC_}" ${FORCE_})
endfunction()




#################################################################
# FUNC: cache_boolean
# DESC: Set a variable as a boolean and cache it in the parent scope.
# ARGS:
#   NAME_  - The name of the variable to set and cache.
#   VALUE_ - The value to assign to the variable (ON/OFF).
#   DESC_  - A description for the cached variable.
#################################################################
function(cache_boolean NAME_ VALUE_ DESC_ FORCE_)
  set(${NAME_} "${VALUE_}" PARENT_SCOPE)
    if(NOT FORCE_ EQUAL "FORCE")
      set(FORCE_ "")
    endif()
  set(${NAME_} "${VALUE_}" CACHE BOOL "${DESC_}" ${FORCE_})
endfunction()




#################################################################
# FUNC: cache_list
# DESC: Sets a list variable and caches it in the parental scope.
# ARGS:
#    - NAME_  - The name of the variable to set and cache.
#    - DESC_  - A description for the cached variable.
#    - ...     - The items to include in the list variable.
#################################################################
function(cache_list NAME_ DESC_)
    set(_items "")

    foreach(i RANGE 2 ${ARGC}-1)
        list(APPEND _items "${ARGV${i}}")
    endforeach()

    # Set in parent scope
    set(${NAME_} "${_items}" PARENT_SCOPE)

    # Cache as a semicolon-separated list
    set(${NAME_} "${_items}" CACHE STRING "${DESC_}" FORCE)
endfunction()
