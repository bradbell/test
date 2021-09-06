INCLUDE(CheckCXXSourceCompiles)
FUNCTION(compile_source_test source variable)
    #
    # check that variable is not yet defined
    IF( DEFINED ${variable} )
        MESSAGE(FATAL_ERROR
            "compile_source_test: ${variable} is defined before expected"
        )
    ENDIF( DEFINED ${variable} )
    #
    IF( DEFINED compiles_source_test_result)
        UNSET(compiles_source_test_result)
    ENDIF( DEFINED compiles_source_test_result )
    #
    # check that source codee compiles
    CHECK_CXX_SOURCE_COMPILES("${source}" compiles_source_test_result )
    #
    # change result varialbe to 0 (1) for fail (succeed).
    IF( compiles_source_test_result )
        SET(${variable} 1)
        SET(${variable} 1 PARENT_SCOPE )
    ELSE( compiles_source_test_result )
        SET(${variable} 0 PARENT_SCOPE )
    ENDIF( compiles_source_test_result )
    #
    # check that varialbe is defined
    IF( NOT DEFINED ${variable} )
        MESSAGE(FATAL_ERROR
            "compile_source_test: error in CMake script."
        )
    ENDIF( NOT DEFINED ${variable} )
    #
    MESSAGE(STATUS "${variable} = ${${variable}}" )
ENDFUNCTION( compile_source_test )
