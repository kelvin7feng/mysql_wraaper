# Install script for directory: /opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local/mysql")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient.a")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient_r.a")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "SharedLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so.18.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so.18"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient.so.18.0.0"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient.so.18"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so.18.0.0"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so.18"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmysqlclient.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "SharedLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient_r.so")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "SharedLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient_r.so.18")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "SharedLibraries" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/libmysql/libmysqlclient_r.so.18.0.0")
endif()

