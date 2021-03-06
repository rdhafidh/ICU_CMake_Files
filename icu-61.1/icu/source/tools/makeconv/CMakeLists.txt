# Copyright (c) 2018, NikitaFeodonit. All rights reserved.
#
## ICU build file for CMake build tools

set(exe_NAME makeconv)

add_executable(${exe_NAME} "")

### Common executables options
include(${PROJECT_SOURCE_DIR}/common_tools_exe_flags.cmake)
include(${PROJECT_SOURCE_DIR}/common_tools_exe_libs.cmake)

### Executable's specifics

### Include directories
# PRIVATE
target_include_directories(${exe_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${PROJECT_SOURCE_DIR}/common
  ${PROJECT_SOURCE_DIR}/tools/toolutil
)

target_sources(${exe_NAME}
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/genmbcs.cpp
    ${CMAKE_CURRENT_LIST_DIR}/makeconv.cpp
    ${CMAKE_CURRENT_LIST_DIR}/gencnvex.c
    ${CMAKE_CURRENT_LIST_DIR}/ucnvstat.c

  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/genmbcs.h
    ${CMAKE_CURRENT_LIST_DIR}/makeconv.h
)

install(
  TARGETS ${exe_NAME}
  EXPORT "${TARGETS_EXPORT_NAME}"
  ARCHIVE  DESTINATION "${libdir}"
  LIBRARY  DESTINATION "${libdir}"
  RUNTIME  DESTINATION "${bindir}"
  INCLUDES DESTINATION "${includedir}"
)
