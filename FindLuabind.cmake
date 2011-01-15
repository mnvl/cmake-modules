# Locate LuaBind library
# This module defines
#  LUABIND_FOUND, if false, do not try to link to LuaBind
#  LUABIND_LIBRARIES
#  LUABIND_INCLUDE_DIR, where to find luabind.hpp

FIND_PATH(LUABIND_INCLUDE_DIR luabind/luabind.hpp
  HINTS
  $ENV{LUABIND_DIR}
  PATH_SUFFIXES include
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
  /opt
)

FIND_LIBRARY(LUABIND_RELEASE_LIBRARY
  NAMES LUABIND luabind libluabind
  HINTS
  $ENV{LUABIND_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(LUABIND_DEBUG_LIBRARY
  NAMES LUABIND luabindd libluabindd
  HINTS
  $ENV{LUABIND_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

IF(LUABIND_DEBUG_LIBRARY AND LUABIND_RELEASE_LIBRARY)
  SET(LUABIND_LIBRARIES debug ${LUABIND_DEBUG_LIBRARY} optimized ${LUABIND_RELEASE_LIBRARY} CACHE STRING "LuaBind Libraries")
ENDIF()

INCLUDE(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set LUABIND_FOUND to TRUE if 
# all listed variables are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(LUABIND DEFAULT_MSG LUABIND_LIBRARIES LUABIND_INCLUDE_DIR)

MARK_AS_ADVANCED(LUABIND_INCLUDE_DIR LUABIND_LIBRARIES LUABIND_DEBUG_LIBRARY LUABIND_RELEASE_LIBRARY)

