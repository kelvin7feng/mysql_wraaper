# mysql_wraaper
CentOS 7 安装mysql server
1.由于CentOS 7 默认安装的是MariaDB，并不是安装Mysql，需要修改安装源
	rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
2.安装mysql-server
	1.yum install mysql-server
	2.配置mysql
		1.重置密码：mysql_secure_installation #根据提示安装，提示 Enter for none的时候按回车即可, 
		2.允许root远程访问：
			1.GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456';
			2.FLUSH PRIVILEGES;
	3.命令：
		restart: start: systemctl restart mysql;
		start: systemctl start mysql;
		stop: systemctl stop mysql;
		
mysql connector c 编译：
1.下载tar包：wget https://cdn.mysql.com/archives/mysql-connector-c/mysql-connector-c-6.1.0-src.tar.gz
2.解压包：tar -zvxf mysql-connector-c-6.1.0-src.tar.gz
3.编译：
	1.cd mysql-connector-c-6.1.0-src
	2.cmake .
	3.make
4.CentOS的库路径: /mysql-connector-c-6.1.0-src/libmysql/

数据库初始化：
CREATE DATABASE `kg` /*!40100 DEFAULT CHARACTER SET utf8 */;
use `kg`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='test';
 
INSERT INTO `kg`.`user` (`id`, `name`) VALUES ('1', 'james');
