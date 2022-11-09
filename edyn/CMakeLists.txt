cmake_minimum_required(VERSION 3.9)
project(appveyor)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(ARCH "Win32")
if( MSVC )
  if( CMAKE_SIZEOF_VOID_P EQUAL 8 )    
	set(ARCH "x64")
  endif()
endif()

SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.entt.1.0.8/build/include")

#SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.openssl.1.0.27/build/include")
#SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.openssl.1.0.27/build/${ARCH}/lib")	

#SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/include")
#SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/lib/${ARCH}")	
#SET(CMAKE_PROGRAM_PATH ${CMAKE_PROGRAM_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/bin/${ARCH}")	

add_subdirectory(source)

message(${PROJECT_BINARY_DIR})

SET(SOURCE_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/source/include" CACHE STRING "source include directory")

install(TARGETS Edyn DESTINATION lib)
install(
        DIRECTORY ${SOURCE_INCLUDE_DIR}/edyn/ src/edyn/ ${PROJECT_BINARY_DIR}/source/include/edyn/
        DESTINATION include/edyn	
        FILES_MATCHING
            PATTERN "*.h"
            PATTERN "*.hpp"
    )
