# Copyright (c) 2018, NikitaFeodonit. All rights reserved.
#
## ICU build file for CMake build tools

set(lib_NAME ${ICULIBS_IO})
set(lib_NAME_SUFFIX ${IO_STUBNAME})

add_library(${lib_NAME} "")

set_target_properties(${lib_NAME} PROPERTIES EXPORT_NAME ${lib_NAME_SUFFIX})

### Common libraries options
include(${PROJECT_SOURCE_DIR}/common_icu_lib_flags.cmake)
include(${PROJECT_SOURCE_DIR}/common_icu_lib_includes.cmake)

### Library's specific flags
# PRIVATE flags
set_property(TARGET ${lib_NAME} APPEND PROPERTY
  COMPILE_DEFINITIONS ${CPPFLAGSICUIO}
    U_IO_IMPLEMENTATION
)
set_property(TARGET ${lib_NAME} APPEND_STRING PROPERTY
  LINK_FLAGS ${LDFLAGSICUIO}
)

### Include directories
# PRIVATE
target_include_directories(${lib_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${PROJECT_SOURCE_DIR}/common
  ${PROJECT_SOURCE_DIR}/i18n
)

### Link libraries
# PUBLIC
# LIBS = $(LIBICUUC) $(LIBICUI18N) $(DEFAULT_LIBS)
target_link_libraries(${lib_NAME} PUBLIC ${ICULIBS_I18N})

target_sources(${lib_NAME}
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/locbund.cpp
    ${CMAKE_CURRENT_LIST_DIR}/sprintf.cpp
    ${CMAKE_CURRENT_LIST_DIR}/sscanf.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ucln_io.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ufile.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ufmt_cmn.cpp
    ${CMAKE_CURRENT_LIST_DIR}/uprintf.cpp
    ${CMAKE_CURRENT_LIST_DIR}/uprntf_p.cpp
    ${CMAKE_CURRENT_LIST_DIR}/uscanf_p.cpp
    ${CMAKE_CURRENT_LIST_DIR}/uscanf.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ustdio.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ustream.cpp

  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/locbund.h
    ${CMAKE_CURRENT_LIST_DIR}/ucln_io.h
    ${CMAKE_CURRENT_LIST_DIR}/ufile.h
    ${CMAKE_CURRENT_LIST_DIR}/ufmt_cmn.h
    ${CMAKE_CURRENT_LIST_DIR}/uprintf.h
    ${CMAKE_CURRENT_LIST_DIR}/uscanf.h

  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/unicode/ustdio.h
    ${CMAKE_CURRENT_LIST_DIR}/unicode/ustream.h
)

install(
  DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/unicode
  DESTINATION "${includedir}"
  FILES_MATCHING
  PATTERN "*.h"
)

install(
  TARGETS ${lib_NAME}
  EXPORT "${TARGETS_EXPORT_NAME}"
  ARCHIVE  DESTINATION "${libdir}"
  LIBRARY  DESTINATION "${libdir}"
  RUNTIME  DESTINATION "${bindir}"
  INCLUDES DESTINATION "${includedir}"
)
