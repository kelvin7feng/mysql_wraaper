#include <mysql.h>
#include <iostream>
#include <string.h>
#include <stdlib.h>
using namespace std;
 
int main()
{
	MYSQL mysql;
	MYSQL_RES *res;
	MYSQL_ROW row;
	// 初始化MYSQL变量
	mysql_init(&mysql);
	// 连接Mysql服务器，本例使用本机作为服务器。访问的数据库名称为“msyql”，参数中的user为你的登录用户名，***为登录密码，需要根据你的实际用户进行设置
	if (!mysql_real_connect(&mysql, "127.0.0.1", "root", "123456", "kg", 3306, 0, 0))
	{
		cout << "mysql_real_connect failure！" << endl;
		return 0;
	}
	// 查询mysql数据库中的user表
	if (mysql_real_query(&mysql, "select * from user", (unsigned long)strlen("select * from user")))
	{
		cout << "mysql_real_query failure！" << endl;
		return 0;
	}
	// 存储结果集
	res = mysql_store_result(&mysql);
	if (NULL == res)
	{
		cout << "mysql_store_result failure！" << endl;
		return 0;
	}
	// 重复读取行，并输出第一个字段的值，直到row为NULL
	while (row = mysql_fetch_row(res))
	{
		cout << row[0] << row[1] << endl;
	}
	// 释放结果集
	mysql_free_result(res);
	// 关闭Mysql连接
	mysql_close(&mysql);
 
	//system("pause");
	return 0;
}
