

set(HIGHS_DIR "")

if(NOT TARGET highs)
  include("${CMAKE_CURRENT_LIST_DIR}/highs-targets.cmake")
endif()

set(HIGHS_LIBRARIES highs)

set(HIGHS_INCLUDE_DIRS "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src;C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build")

set(HIGHS_FOUND TRUE)

include(CMakeFindDependencyMacro)
find_dependency(Threads)
