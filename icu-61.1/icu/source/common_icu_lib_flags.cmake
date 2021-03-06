# Copyright (c) 2018, NikitaFeodonit. All rights reserved.
#
## ICU build file for CMake build tools

### Common libraries flags

# INTERFACE flags
set_property(TARGET ${lib_NAME} APPEND PROPERTY
  INTERFACE_COMPILE_DEFINITIONS ${UCONFIG_CPPFLAGS}
)

# PRIVATE flags
set_property(TARGET ${lib_NAME} APPEND PROPERTY
  COMPILE_DEFINITIONS ${CPPFLAGS}
)
set_property(TARGET ${lib_NAME} APPEND PROPERTY
  COMPILE_OPTIONS $<$<COMPILE_LANGUAGE:C>:${CFLAGS}>
)
set_property(TARGET ${lib_NAME} APPEND PROPERTY
  COMPILE_OPTIONS $<$<COMPILE_LANGUAGE:CXX>:${CXXFLAGS}>
)
set_property(TARGET ${lib_NAME} APPEND_STRING PROPERTY
  LINK_FLAGS ${LDFLAGS}
)

if(BUILD_SHARED_LIBS)
  set_property(TARGET ${lib_NAME} APPEND PROPERTY
    COMPILE_DEFINITIONS ${SHAREDLIBCPPFLAGS}
  )
  set_property(TARGET ${lib_NAME} APPEND PROPERTY
    COMPILE_OPTIONS $<$<COMPILE_LANGUAGE:C>:${SHAREDLIBCFLAGS}>
  )
  set_property(TARGET ${lib_NAME} APPEND PROPERTY
    COMPILE_OPTIONS $<$<COMPILE_LANGUAGE:CXX>:${SHAREDLIBCXXFLAGS}>
  )
endif()

if(NOT lib_NAME STREQUAL ICULIBS_DT)
  set_property(TARGET ${lib_NAME} APPEND PROPERTY
    COMPILE_DEFINITIONS ${LIBCPPFLAGS}
  )
endif()

if(NOT lib_NAME STREQUAL ICULIBS_DT OR NOT lib_NAME STREQUAL ICULIBS_STUBDT)
  set_property(TARGET ${lib_NAME} APPEND PROPERTY
    COMPILE_OPTIONS $<$<COMPILE_LANGUAGE:CXX>:${LIBCXXFLAGS}>
  )
endif()
