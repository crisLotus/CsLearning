mysql 存储中文问题
	utf-8 utf8

[mysql远程访问](http://blog.chinaunix.net/uid-23215128-id-2951624.html)
	grant all PRIVILEGES on tornadodemo.* to tornado@'%' identifi ed by 'tornado';
	flush privileges;
	
	/etc/mysql/my.cnf 注释bind-address = 127.0.0.1
	/etc/mysql$ /etc/init.d/mysql restat
	
[mysql命令](http://www.cnblogs.com/zhangzhu/archive/2013/07/04/3172486.html)
	--本地连接  
	mysql –uroot -p  
	--远程连接  
	mysql –uwgb –hXXX.XXX.XXX.XXX –p


# mysql常用命令

```
show databases;
create database <数据库名>;
drop database <数据库名>;
use <数据库名>;
describe  <表名>;
```

# 数据类型
[MySQL数据类型选择指南](http://www.awaimai.com/1146.html)
