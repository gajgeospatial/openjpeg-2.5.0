# - Find LCMS2 library
# Find the native LCMS2 includes and library
# Once done this will define
#
#  LCMS2_INCLUDE_DIR    - Where to find lcms2.h, etc.
#  LCMS2_LIBRARIES      - Libraries to link against to use LCMS2.
#  LCMS2_FOUND          - If false, do not try to use LCMS2.
#
# also defined, but not for general use are
#  LCMS2_LIBRARY        - Where to find the LCMS2 library.

#=============================================================================
#=============================================================================
MESSAGE("Specialized FindLCMS2 Called")
if( NOT $ENV{LCMS2_LIBRARY} STREQUAL "" )
  SET(LCMS2_LIBRARY $ENV{LCMS2_LIBRARY})
  if(NOT $ENV{LCMS2_LIBRARY_RELEASE} STREQUAL "")
    set(LCMS2_LIBRARY_RELEASE, $ENV{LCMS2_LIBRARY_RELEASE})
  else ()
    set (LCMS2_LIBRARY_RELEASE, ${LCMS2_LIBRARY})
  endif()

  if(NOT $ENV{LCMS2_LIBRARY_DEBUG} STREQUAL "")
    set(LCMS2_LIBRARY_DEBUG, $ENV{LCMS2_LIBRARY_DEBUG})
  else ()
    set (LCMS2_LIBRARY_DEBUG, ${LCMS2_LIBRARY})
  endif()

  SET(LCMS2_LIBRARIES ${LCMS2_LIBRARY})

  mark_as_advanced(LCMS2_LIBRARY_RELEASE LCMS2_LIBRARY_DEBUG)

  if( NOT $ENV{LCMS2_INCLUDE_DIR} STREQUAL "" )
     SET(LCMS2_INCLUDE_DIR $ENV{LCMS2_INCLUDE_DIR})
  else()
     SET(LCMS2_INCLUDE_DIR "Lcms2IncludeDir")
  endif()
  SET(LCMS2_INCLUDE_DIRS ${LCMS2_INCLUDE_DIR})
  mark_as_advanced(LCMS2_INCLUDE_DIR)

  SET(LCMS2_FOUND TRUE)
  MESSAGE("FindLCMS2 Set By Envionment")

else()
find_path(LCMS2_INCLUDE_DIR lcms2.h PATHS /usr/include /usr/local/include /opt/include /opt/local/include)

set(LCMS2_NAMES ${LCMS2_NAMES} lcms2 liblcms2 liblcms2_static)

find_library(LCMS2_LIBRARY NAMES ${LCMS2_NAMES} )

mark_as_advanced(LCMS2_INCLUDE_DIR LCMS2_LIBRARY)

# handle the QUIETLY and REQUIRED arguments and set LCMS2_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LCMS2  DEFAULT_MSG  LCMS2_LIBRARY  LCMS2_INCLUDE_DIR)

if(LCMS2_FOUND)
  set( LCMS2_INCLUDE_DIRS ${LCMS2_INCLUDE_DIR})
  set( LCMS2_LIBRARIES ${LCMS2_LIBRARY} )
endif()
endif()