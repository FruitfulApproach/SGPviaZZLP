# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src")
  file(MAKE_DIRECTORY "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src")
endif()
file(MAKE_DIRECTORY
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build"
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix"
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/tmp"
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/src/highs-populate-stamp"
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/src"
  "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/src/highs-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/src/highs-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-subbuild/highs-populate-prefix/src/highs-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
