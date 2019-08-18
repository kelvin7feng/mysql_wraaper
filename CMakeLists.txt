#项目名称，使用语言
PROJECT(LUA_TEST C CXX)
#CMake最低版本
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
#设置源文件
SET(SRC_LIST ./main.cpp)
#设置变量
SET(PROJECT_ROOT_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
#设置头文件搜索目录
INCLUDE_DIRECTORIES("${PROJECT_ROOT_PATH}/third_party/mysql-connector-c-6.1.0-src/include/")
#增加库文件搜索
LINK_DIRECTORIES("${PROJECT_ROOT_PATH}/third_party/mysql-connector-c-6.1.0-src/libmysql")
#执行编译
ADD_EXECUTABLE(main ${SRC_LIST})
#链接第三方库
TARGET_LINK_LIBRARIES(main mysqlclient)
