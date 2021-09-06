# Determine if mkstemp is availabe on this system
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)
PROJECT(cmake_test)
SET(CMAKE_CXX_STANDARD_11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)
INCLUDE(../cmake/compile_source_test.cmake)
SET(source "
# include <stdlib.h>
# include <unistd.h>
int main(void)
{   char pattern[] = \"/tmp/fileXXXXXX\";
    int fd = mkstemp(pattern);
    return 0;
}
" )
compile_source_test("${source}" cxx_has_mkstemp_1)
compile_source_test("${source}" cxx_has_mkstemp_2)
