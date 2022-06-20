cmake_minimum_required(VERSION 3.9)
project(appveyor)

set(OPENSSL_USE_STATIC_LIBS True)
set(OPENSSL_MSVC_STATIC_RT True)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")	
message(${CMAKE_MODULE_PATH})

set(ARCH "Win32")
if( MSVC )
  if( CMAKE_SIZEOF_VOID_P EQUAL 8 )    
	set(ARCH "x64")
  endif()
endif()

SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/openssl.1.0.23/build/native/include")
SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/openssl.1.0.23/build/native/${ARCH}/lib")	

SET(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/protobuf.1.0.5/build/native/include")
SET(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/protobuf.1.0.5/build/native/lib/${ARCH}")	
SET(CMAKE_PROGRAM_PATH ${CMAKE_PROGRAM_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packages/protobuf.1.0.5/build/native/bin/${ARCH}")	

message(${OPENSSL_USE_STATIC_LIBS})
add_subdirectory(source)
