function(parse_version_number VERSION_NAME)
    if (${VERSION_NAME} MATCHES "^[vV]")
        string(SUBSTRING ${${VERSION_NAME}} 1 -1 _VERSION_VALUE)
    else ()
        set(_VERSION_VALUE ${${VERSION_NAME}})
    endif ()

    string(REPLACE "." ";" _VERSION_LIST ${_VERSION_VALUE})
    list(LENGTH _VERSION_LIST _VERSION_LIST_LENGTH)

    if (${_VERSION_LIST_LENGTH} GREATER_EQUAL 1)
        list(GET _VERSION_LIST 0 _TEMP)
    else ()
        set(_TEMP 0)
    endif ()
    set("${VERSION_NAME}_MAJOR" ${_TEMP} PARENT_SCOPE)

    if (${_VERSION_LIST_LENGTH} GREATER_EQUAL 2)
        list(GET _VERSION_LIST 1 _TEMP)
    else ()
        set(_TEMP 0)
    endif ()
    set("${VERSION_NAME}_MINOR" ${_TEMP} PARENT_SCOPE)

    if (${_VERSION_LIST_LENGTH} GREATER_EQUAL 3)
        list(GET _VERSION_LIST 2 _TEMP)
    else ()
        set(_TEMP 0)
    endif ()
    set("${VERSION_NAME}_PATCH" ${_TEMP} PARENT_SCOPE)

    if (${_VERSION_LIST_LENGTH} GREATER_EQUAL 4)
        list(GET _VERSION_LIST 3 _TEMP)
    else ()
        set(_TEMP 0)
    endif ()
    set("${VERSION_NAME}_TWEAK" ${_TEMP} PARENT_SCOPE)
endfunction()