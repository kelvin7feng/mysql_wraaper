# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 


# Handle/create the "INFO_*" files describing a MySQL (server) binary.
# This is part of the fix for bug#42969.


# Several of cmake's variables need to be translated from '@' notation
# to '${}', this is done by the "configure" call in top level "CMakeLists.txt".
# If further variables are used in this file, add them to this list.

SET(VERSION "6.1.0")
SET(CMAKE_SOURCE_DIR "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src")
SET(CMAKE_BINARY_DIR "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src")
SET(CMAKE_GENERATOR "Unix Makefiles")
SET(CMAKE_SIZEOF_VOID_P "8")
SET(BZR_EXECUTABLE "")
SET(CMAKE_CROSSCOMPILING "FALSE")
SET(CMAKE_HOST_SYSTEM "Linux-4.10.4-1.el7.elrepo.x86_64")
SET(CMAKE_HOST_SYSTEM_PROCESSOR "x86_64")
SET(CMAKE_SYSTEM "Linux-4.10.4-1.el7.elrepo.x86_64")
SET(CMAKE_SYSTEM_PROCESSOR "x86_64")
 
 
# Create an "INFO_SRC" file with information about the source (only).
# We use "bzr version-info", if possible, and the "VERSION" contents.
#
# Outside development (BZR tree), the "INFO_SRC" file will not be modified
# provided it exists (from "make dist" or a source tarball creation).

MACRO(CREATE_INFO_SRC target_dir)
  SET(INFO_SRC "${target_dir}/INFO_SRC")

  IF(BZR_EXECUTABLE AND EXISTS ${CMAKE_SOURCE_DIR}/.bzr)
    # Sources are in a BZR repository: Always update.
    # Add a timeout in case BZR hangs forever ...
    EXECUTE_PROCESS(
      COMMAND ${BZR_EXECUTABLE} version-info ${CMAKE_SOURCE_DIR}
      OUTPUT_VARIABLE VERSION_INFO
      RESULT_VARIABLE RESULT
      ERROR_VARIABLE ERROR
      TIMEOUT 10
    )
    IF(NOT RESULT EQUAL 0)
      MESSAGE(STATUS "Error from ${BZR_EXECUTABLE}: ${ERROR}")
      SET(BZR_EXECUTABLE)
    ENDIF()
    FILE(WRITE ${INFO_SRC} "${VERSION_INFO}\n")
    # to debug, add: FILE(APPEND ${INFO_SRC} "\nResult ${RESULT}\n")
    # For better readability ...
    FILE(APPEND ${INFO_SRC} "\nMySQL source ${VERSION}\n")
  ELSEIF(EXISTS ${INFO_SRC})
    # Outside a BZR tree, there is no need to change an existing "INFO_SRC",
    # it cannot be improved.
  ELSEIF(EXISTS ${CMAKE_SOURCE_DIR}/Docs/INFO_SRC)
    # If we are building from a source distribution, it also contains "INFO_SRC".
    # Similar, the export used for a release build already has the file.
    FILE(READ ${CMAKE_SOURCE_DIR}/Docs/INFO_SRC SOURCE_INFO)
    FILE(WRITE ${INFO_SRC} "${SOURCE_INFO}\n")
  ELSEIF(EXISTS ${CMAKE_SOURCE_DIR}/INFO_SRC)
    # This is not the proper location, but who knows ...
    FILE(READ ${CMAKE_SOURCE_DIR}/INFO_SRC SOURCE_INFO)
    FILE(WRITE ${INFO_SRC} "${SOURCE_INFO}\n")
  ELSE()
    # This is a fall-back.
    FILE(WRITE ${INFO_SRC} "\nMySQL source ${VERSION}\n")
  ENDIF()
ENDMACRO(CREATE_INFO_SRC)


# This is for the "real" build, must be run again with each cmake run
# to make sure we report the current flags (not those of some previous run).

MACRO(CREATE_INFO_BIN)
  SET(INFO_BIN "Docs/INFO_BIN")

  FILE(WRITE ${INFO_BIN} "===== Information about the build process: =====\n")
  IF (WIN32)
    EXECUTE_PROCESS(COMMAND cmd /c date /T
        OUTPUT_VARIABLE TMP_DATE OUTPUT_STRIP_TRAILING_WHITESPACE)
  ELSEIF(UNIX)
    EXECUTE_PROCESS(COMMAND date "+%Y-%m-%d %H:%M:%S"
        OUTPUT_VARIABLE TMP_DATE OUTPUT_STRIP_TRAILING_WHITESPACE)
  ELSE()
    SET(TMP_DATE "(no date command known for this platform)")
  ENDIF()
  SITE_NAME(HOSTNAME)
  FILE(APPEND ${INFO_BIN} "Build was run at ${TMP_DATE} on host '${HOSTNAME}'\n\n")

  # According to the cmake docs, these variables should always be set.
  # However, they are empty in my tests, using cmake 2.6.4 on Linux, various Unix, and Windows.
  # Still, include this code, so we will profit if a build environment does provide that info.
  IF(CMAKE_HOST_SYSTEM)
    FILE(APPEND ${INFO_BIN} "Build was done on  ${CMAKE_HOST_SYSTEM} using ${CMAKE_HOST_SYSTEM_PROCESSOR}\n")
  ENDIF()
  IF(CMAKE_CROSSCOMPILING)
    FILE(APPEND ${INFO_BIN} "Build was done for ${CMAKE_SYSTEM} using ${CMAKE_SYSTEM_PROCESSOR}\n")
  ENDIF()

  # ${CMAKE_VERSION} doesn't work in 2.6.0, use the separate components.
  FILE(APPEND ${INFO_BIN} "Build was done using cmake ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION} \n\n")

  IF (WIN32)
    FILE(APPEND ${INFO_BIN} "===== Compiler / generator used: =====\n")
    FILE(APPEND ${INFO_BIN} ${CMAKE_GENERATOR} "\n\n")
  ELSEIF(UNIX)
    FILE(APPEND ${INFO_BIN} "===== Compiler flags used (from the 'sql/' subdirectory): =====\n")
    IF(EXISTS sql/CMakeFiles/sql.dir/flags.make)
      EXECUTE_PROCESS(COMMAND egrep "^# compile|^C_|^CXX_" sql/CMakeFiles/sql.dir/flags.make OUTPUT_VARIABLE COMPILE_FLAGS)
      FILE(APPEND ${INFO_BIN} ${COMPILE_FLAGS} "\n")
    ELSE()
      FILE(APPEND ${INFO_BIN} "File 'sql/CMakeFiles/sql.dir/flags.make' is not yet found.\n\n")
    ENDIF()
  ENDIF()
  FILE(APPEND ${INFO_BIN} "Pointer size: ${CMAKE_SIZEOF_VOID_P}\n\n")

  FILE(APPEND ${INFO_BIN} "===== Feature flags used: =====\n")
  IF(EXISTS ${CMAKE_BINARY_DIR}/CMakeCache.txt)
    # Attention: "-N" prevents cmake from entering a recursion, and it must be a separate flag from "-L".
    EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -N -L ${CMAKE_BINARY_DIR} OUTPUT_VARIABLE FEATURE_FLAGS)
    FILE(APPEND ${INFO_BIN} ${FEATURE_FLAGS} "\n")
  ELSE()
    FILE(APPEND ${INFO_BIN} "File 'CMakeCache.txt' is not yet found.\n\n")
  ENDIF()

  FILE(APPEND ${INFO_BIN} "===== EOF =====\n")
ENDMACRO(CREATE_INFO_BIN)

