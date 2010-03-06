# - Find Maya SDK
# Find Maya SDK includes and libraries
#
# Usage: FIND_PACKAGE(Maya COMPONENTS component1 component2 ...)
# e.g. FIND_PACKAGE(Maya COMPONENTS Foundation OpenMaya)
#
# Defines following variables:
#  MAYA_INCLUDE_DIR - Where to find xercesc include sub-directory.
#  MAYA_LIBRARIES   - List of libraries when using Xerces-C.
#  MAYA_FOUND       - True if Xerces-C found.

IF(MAYA_INCLUDE_DIR AND MAYA_LIBRARIES)
  SET(MAYA_FOUND TRUE)
ELSE()
  SET(MAYA_DIR_SEARCH $ENV{MAYA_ROOT})

  IF(MAYA_DIR_SEARCH)
    FILE(TO_CMAKE_PATH ${MAYA_DIR_SEARCH} MAYA_DIR_SEARCH)
  ENDIF(MAYA_DIR_SEARCH)

  SET(MAYA_DIR_SEARCH
    ${MAYA_DIR_SEARCH}
    "$ENV{ProgramFiles}/Maya*/"
    "$ENV{ProgramFiles}/Autodesk/Maya*/"
    "$ENV{ProgramFiles(x86)}/Maya*/"
    "$ENV{ProgramFiles(x86)}/Autodesk/Maya*/"
  )

  FILE(GLOB MAYA_DIR ${MAYA_DIR_SEARCH})

  SET(SUFFIX_FOR_INCLUDE_PATH include)
  SET(SUFFIX_FOR_LIBRARY_PATH lib)

  FIND_PATH(MAYA_INCLUDE_DIR
    maya/MObject.h
  
    PATH_SUFFIXES
    ${SUFFIX_FOR_INCLUDE_PATH}
  
    PATHS
    ${MAYA_DIR}
  )

  SET(MAYA_LIBRARIES)

  FOREACH (COMPONENT ${Maya_FIND_COMPONENTS})
    FIND_LIBRARY(MAYA_${COMPONENT}_LIBRARY

      NAMES
      ${COMPONENT}
  
      PATH_SUFFIXES
  	  ${SUFFIX_FOR_LIBRARY_PATH}

	  PATHS
  	  ${MAYA_DIR}
	)

	IF(NOT MAYA_${COMPONENT}_LIBRARY)
	  SET(MAYA_LIBRARIES)
	  BREAK()
	ENDIF()

	SET(MAYA_LIBRARIES ${MAYA_LIBRARIES} ${MAYA_${COMPONENT}_LIBRARY})
  ENDFOREACH()

  INCLUDE(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(Maya DEFAULT_MSG MAYA_INCLUDE_DIR MAYA_LIBRARIES)
ENDIF()
