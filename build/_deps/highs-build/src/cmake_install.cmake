# Install script for directory: C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/SGPviaZZLP")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/filereaderlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/filereaderlp/builder.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/filereaderlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/filereaderlp/def.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/filereaderlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/filereaderlp/model.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/filereaderlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/filereaderlp/reader.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdqsort" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/pdqsort/pdqsort.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/zstr" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/zstr/strict_fstream.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/zstr" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/../extern/zstr/zstr.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/interfaces" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/interfaces/highs_c_api.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/Filereader.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/FilereaderEms.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/FilereaderLp.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/FilereaderMps.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/HighsIO.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/HMpsFF.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/HMPSIO.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/io" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/io/LoadOptions.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/IpxSolution.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/IpxWrapper.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HConst.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsAnalysis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsCallback.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsCallbackStruct.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsDebug.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsInfo.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsInfoDebug.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsLp.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsLpSolverObject.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsLpUtils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsModelUtils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsOptions.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsRanging.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsRuntimeOptions.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsSolution.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsSolutionDebug.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsSolve.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HighsStatus.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/lp_data" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/lp_data/HStruct.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsCliqueTable.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsConflictPool.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsCutGeneration.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsCutPool.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsDebugSol.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsDomain.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsDomainChange.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsDynamicRowMatrix.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsGFkSolve.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsImplications.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsLpAggregator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsLpRelaxation.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsMipSolver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsMipSolverData.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsModkSeparator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsNodeQueue.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsObjectiveFunction.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsPathSeparator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsPrimalHeuristics.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsPseudocost.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsRedcostFixing.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsSearch.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsSeparation.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsSeparator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsTableauSeparator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/mip" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/mip/HighsTransformedLp.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/model" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/model/HighsHessian.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/model" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/model/HighsHessianUtils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/model" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/model/HighsModel.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsBinarySemaphore.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsCacheAlign.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsCombinable.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsMutex.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsParallel.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsRaceTimer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsSchedulerConstants.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsSpinMutex.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsSplitDeque.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsTask.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/parallel" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/parallel/HighsTaskExecutor.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/CupdlpWrapper.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/HighsPostsolveStack.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/HighsSymmetry.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/HPresolve.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/HPresolveAnalysis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/ICrash.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/ICrashUtil.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/ICrashX.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/presolve" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/presolve/PresolveComponent.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/a_asm.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/a_quass.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/basis.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/crashsolution.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/dantzigpricing.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/devexpricing.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/eventhandler.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/factor.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/feasibility_bounded.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/feasibility_highs.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/gradient.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/instance.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/matrix.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/perturbation.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/pricing.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/qpconst.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/qpvector.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/quass.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/ratiotest.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/runtime.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/scaling.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/settings.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/snippets.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/statistics.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/qpsolver" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/qpsolver/steepestedgepricing.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HApp.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HEkk.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HEkkDual.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HEkkDualRHS.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HEkkDualRow.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HEkkPrimal.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HighsSimplexAnalysis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HSimplex.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HSimplexDebug.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HSimplexNla.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/HSimplexReport.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/SimplexConst.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/SimplexStruct.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/simplex" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/simplex/SimplexTimer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/test" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/test/DevKkt.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/test" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/test/KktCh2.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/FactorTimer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HFactor.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HFactorConst.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HFactorDebug.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsCDouble.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsComponent.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsDataStack.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsDisjointSets.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsHash.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsHashTree.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsInt.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsIntegers.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsLinearSumBounds.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsMatrixPic.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsMatrixSlice.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsMatrixUtils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsMemoryAllocation.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsRandom.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsRbTree.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsSort.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsSparseMatrix.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsSparseVectorSum.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsSplay.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsTimer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HighsUtils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HSet.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HVector.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/HVectorBase.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/util" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/util/stringutil.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/Highs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_cs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_defs.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_linalg.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_proj.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_restart.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_scaling_cuda.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_solver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_step.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/pdlp/cupdlp" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/pdlp/cupdlp/cupdlp_utils.c")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/basiclu_kernel.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/basiclu_wrapper.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/basis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/conjugate_residuals.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/control.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/crossover.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/diagonal_precond.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/forrest_tomlin.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/guess_basis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/indexed_vector.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/info.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipm.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_c.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_config.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_info.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_internal.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_parameters.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/ipx_status.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/iterate.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/kkt_solver_basis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/kkt_solver_diag.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/kkt_solver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/linear_operator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/lp_solver.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/lu_factorization.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/lu_update.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/maxvolume.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/model.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/multistream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/normal_matrix.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/power_method.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/sparse_matrix.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/sparse_utils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/splitted_normal_matrix.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/starting_basis.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/symbolic_invert.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/timer.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/ipx" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/ipx/utils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_factorize.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_get_factors.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_initialize.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_factorize.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_free.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_get_factors.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_initialize.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_solve_dense.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_solve_for_update.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_solve_sparse.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_obj_update.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_object.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_solve_dense.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_solve_for_update.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_solve_sparse.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu_update.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/basiclu.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/lu_def.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/lu_file.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/lu_internal.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs/ipm/basiclu" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-src/src/ipm/basiclu/lu_list.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/highs" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build/HConfig.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/highs" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build/CMakeFiles/highs-config.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build/CMakeFiles/highs.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/SGPviaZZLP/SGPviaZZLP/build/_deps/highs-build/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
