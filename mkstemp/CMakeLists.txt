# Determine if mkstemp is availabe on this system
CMAKE_MINIMUM_REQUIRED(VERSION 3.0)
PROJECT(mkstemp_detect)
#
INCLUDE(CheckCXXSourceCompiles)
INCLUDE(../cmake/compile_source_test.cmake)
#
# macos-latest by default does not support c++11
# so CppAD script sets these values
SET(CMAKE_CXX_STANDARD_11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)
#
# Same source code as is used by CppAD test for mkstemp
SET(source "
# include <stdlib.h>
# include <unistd.h>
int main(void)
{   char pattern[] = \"/tmp/fileXXXXXX\";
    int fd = mkstemp(pattern);
    return 0;
}
" )
#
# First call: compiles_source_test_result is not defined
compile_source_test("${source}" cxx_has_mkstemp_1)
#
# Second call: compiles_source_test_result is defined
compile_source_test("${source}" cxx_has_mkstemp_2)
