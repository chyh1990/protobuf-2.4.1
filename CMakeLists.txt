project( protobuf )
cmake_minimum_required (VERSION 2.6)

include(GenerateConfigH.cmake)

add_definitions( -DHAVE_CONFIG_H )

if( MSVC )
add_definitions(
-D_CRT_SECURE_NO_WARNINGS=1
/wd4244 /wd4267 /wd4018 /wd4355 /wd4800 /wd4251 /wd4996 /wd4146 /wd4305
)
else()
add_definitions( -Wno-deprecated )
endif()

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories( src )

if (NOT MSVC)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC -fvisibility=hidden")
  set(CMAKE_C_FLAGS ${CMAKE_CXX_FLAGS})
endif()

set(SOURCES
  src/google/protobuf/compiler/importer.cc
  src/google/protobuf/compiler/parser.cc
  src/google/protobuf/descriptor.cc
  src/google/protobuf/descriptor_database.cc
  src/google/protobuf/descriptor.pb.cc
  src/google/protobuf/dynamic_message.cc
  src/google/protobuf/extension_set.cc
  src/google/protobuf/extension_set_heavy.cc
  src/google/protobuf/generated_message_reflection.cc
  src/google/protobuf/generated_message_util.cc
  src/google/protobuf/io/coded_stream.cc
  src/google/protobuf/io/gzip_stream.cc
  src/google/protobuf/io/printer.cc
  src/google/protobuf/io/tokenizer.cc
  src/google/protobuf/io/zero_copy_stream.cc
  src/google/protobuf/io/zero_copy_stream_impl.cc
  src/google/protobuf/io/zero_copy_stream_impl_lite.cc
  src/google/protobuf/message.cc
  src/google/protobuf/message_lite.cc
  src/google/protobuf/reflection_ops.cc
  src/google/protobuf/repeated_field.cc
  src/google/protobuf/service.cc
  src/google/protobuf/stubs/common.cc
  src/google/protobuf/stubs/once.cc
  src/google/protobuf/stubs/structurally_valid.cc
  src/google/protobuf/stubs/strutil.cc
  src/google/protobuf/stubs/substitute.cc
  src/google/protobuf/text_format.cc
  src/google/protobuf/unknown_field_set.cc
  src/google/protobuf/wire_format.cc
  src/google/protobuf/wire_format_lite.cc
)

add_library(protobuf STATIC ${SOURCES})
