# apache 根目录
* 创建自己需要更改的新目录，并更改宿主权限为apache用户 chown -R apache:apache /mnt/www
* 编辑  /etc/apache2/sites-enabled/000-default.conf ，为希望的目录
* 编辑 /etc/apache2/apache2.conf 改写/目录的权限为 Allow from all
