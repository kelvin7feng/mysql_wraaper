# Install script for directory: /opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql_com.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql_time.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_list.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_alloc.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/typelib.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_dbug.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/m_string.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_sys.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_xml.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql_embed.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_pthread.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/decimal.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/errmsg.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_global.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_net.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_getopt.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/sslopt-longopts.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_dir.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/sslopt-vars.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/sslopt-case.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/sql_common.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/keycache.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/m_ctype.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_attribute.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_compiler.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql_com_server.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_byteorder.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/byte_order_generic.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/byte_order_generic_x86.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/byte_order_generic_x86_64.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/little_endian.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/big_endian.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql_version.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/my_config.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysqld_ername.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysqld_error.h"
    "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/sql_state.h"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE DIRECTORY FILES "/opt/dev/mysql_wrapper/third_party/mysql-connector-c-6.1.0-src/include/mysql/" REGEX "/[^/]*\\.h$" REGEX "/psi\\_abi[^/]*$" EXCLUDE)
endif()

