# - Find Xerces-C 3.x.x
# Find the Xerces-C 3.x.x includes and library
#
#  XERCESC3_INCLUDE_DIR - Where to find xercesc include sub-directory.
#  XERCESC3_LIBRARIES   - List of libraries when using Xerces-C.
#  XERCESC3_FOUND       - True if Xerces-C found.
#  XERCESC3_USE_STATIC_LIBS - Set to ON to link to Xerces-C statically.
#
# Based on original FindXercesC.cmake by Aleksandar Samardzic taken
# from http://www.cmake.org/pipermail/cmake/2008-October/024383.html
#

FIND_PATH(XERCESC3_INCLUDE_DIR xercesc/util/XercesVersion.hpp

	PATHS
	${XERCESC3_ROOT}

	PATH_SUFFIXES
	include
)

IF(XERCESC3_USE_STATIC_LIBS)
	SET(XERCESC3_LIBRARY_NAMES xerces-c_satic_3)
ELSE()
	SET(XERCESC3_LIBRARY_NAMES xerces-c_3)
ENDIF()

FIND_LIBRARY(XERCESC3_LIBRARY_OPTIMIZED

	NAMES
	${XERCESC3_LIBRARY_NAMES}

	PATHS
	${XERCESC3_ROOT}

	PATH_SUFFIXES
	lib)

FIND_LIBRARY(XERCESC3_LIBRARY_DEBUG

	NAMES
	${XERCESC3_LIBRARY_NAMES}D

	PATHS
	${XERCESC3_ROOT}

	PATH_SUFFIXES
	lib)

IF(XERCESC3_LIBRARY_OPTIMIZED AND XERCESC3_LIBRARY_DEBUG)
	SET(XERCESC3_LIBRARIES optimized ${XERCESC3_LIBRARY_OPTIMIZED} debug ${XERCESC3_LIBRARY_DEBUG})
ELSE()
	IF(XERCESC3_LIBRARY_OPTIMIZED)
		SET(XERCESC3_LIBRARIES ${XERCESC3_LIBRARY_OPTIMIZED})
    ENDIF()
    IF(XERCESC3_LIBRARY_DEBUG)
		SET (XERCESC3_LIBRARIES ${XERCESC3_LIBRARY_DEBUG})
    ENDIF()
ENDIF()

# Handle the QUIETLY and REQUIRED arguments and set XERCESC3_FOUND to
# TRUE if all listed variables are TRUE.
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
  XercesC3 DEFAULT_MSG
  XERCESC3_LIBRARIES XERCESC3_INCLUDE_DIR
)

MARK_AS_ADVANCED(XERCESC3_LIBRARIES XERCESC3_INCLUDE_DIR)

