# Determine if mkstemp is availabe on this system
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)
PROJECT(cmake_test)
SET(CMAKE_CXX_STANDARD_11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)
INCLUDE(CheckCXXSourceCompiles)
SET(source "
# include <stdlib.h>
# include <unistd.h>
int main(void)
{   char pattern[] = \"/tmp/fileXXXXXX\";
    int fd = mkstemp(pattern);
    return 0;
}
" )
IF( DEFINED(cxx_has_mkstemp) )
    UNSET(cxx_has_mkstemp)
ENDIF( DEFINED(cxx_has_mkstemp) )
CHECK_CXX_SOURCE_COMPILES("${source}" cxx_has_mkstemp)
IF( ${cxx_has_mkstemp} )
    MESSAGE(STATUS "mkstemp: OK")
ELSE( ${cxx_has_mkstemp} )
    MESSAGE(STATUS "mkstemp: Error")
ENDIF( ${cxx_has_mkstemp} )
