cmake_minimum_required(VERSION 3.9)
project(appveyor)

set(OPENSSL_USE_STATIC_LIBS True)
set(OPENSSL_MSVC_STATIC_RT True)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")	
message(${CMAKE_CURRENT_SOURCE_DIR})

set(ARCH "Win32")
if( MSVC )
  if( CMAKE_SIZEOF_VOID_P EQUAL 8 )    
	set(ARCH "x64")
  endif()
endif()

SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.openssl.1.0.27/build/include")
SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.openssl.1.0.27/build/${ARCH}/lib")	

SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/include")
SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/lib/${ARCH}")	
SET(CMAKE_PROGRAM_PATH ${CMAKE_PROGRAM_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/fluid.protobuf.1.0.13/build/bin/${ARCH}")	

message(${OPENSSL_USE_STATIC_LIBS})
add_subdirectory(source)
