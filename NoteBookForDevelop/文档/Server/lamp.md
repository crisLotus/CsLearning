# apache 根目录
* 创建自己需要更改的新目录，并更改宿主权限为apache用户 chown -R apache:apache /mnt/www
* 编辑  /etc/apache2/sites-enabled/000-default.conf ，为希望的目录
* 编辑 /etc/apache2/apache2.conf 改写/目录的权限为 Allow from all

# 安装
* LAMP
    1. wget http://labfile.oss.aliyuncs.com/httpd-2.2.29.tar.gz
    * sudo apt-get update
    * sudo apt-get install gcc g++ make libtaool -y
    * 程序使用方法
        * lampp for linux
            1. /opt/lampp/lampp start
            * 程序后台运行方法 www.jb51.net/article/61904.htm
	// [配置：php mysql apache](www.renfei.org/blog/set-up-apache-mysql-php-phpmyadmin-on-ubuntu-server.html)
	sudo apt-get -y install apache2 mysql-server php5 php5-mysql php5-gd

