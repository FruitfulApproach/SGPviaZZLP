cmake_minimum_required(VERSION 3.20)
project(SGPviaZZLP LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

include(FetchContent)

set(BUILD_TESTING OFF CACHE BOOL "" FORCE)
set(FAST_BUILD   ON  CACHE BOOL "" FORCE)

FetchContent_Declare(
    highs
    GIT_REPOSITORY https://github.com/ERGO-Code/HiGHS.git
    GIT_TAG        v1.7.2
    GIT_SHALLOW    TRUE
)
FetchContent_MakeAvailable(highs)

add_subdirectory(SGPviaZZLP)
