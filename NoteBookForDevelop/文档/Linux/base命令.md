# Bash
* [linux常见命令的列表-zh](http://www.pixelbeat.org/cmdline_zh_CN.html)
* [Linux命令大全](http://man.linuxde.net/grep)

## 使用命令帮助

* 在只记得部分命令关键字的场合，我们可通过man -k来搜索；
* whatis -- 简要说明；whatis -w loca*
* info -- 更详细的介绍
* man -- 命令参数 使用方法
* which -- 查看命令位置
* whereis 查看命令的搜索路径

## 文本处理
* alias lsl='ls -lrt' 按照修改时间排序
* ls | cat -n 每项文件前面增加一个编号
* head -10 test.txt; tail -5 text.txt
* 动态显示文本最新信息:tail -f crawler.log

## 打包压缩解压
* tar -cvf etc.tar /etc <==仅打包，不压缩！
* tar -xvf demo.tar  解包 不会删除源文件
* gzip demo.txt  压缩文件 会删除源文件
* gunzip demo.txt.gz 会删除压缩文件

## [进程管理](http://linuxtools-rst.readthedocs.io/zh_CN/latest/base/05_process_manage.html#id10)
* lsof list opened files
* ps -ef
* top P(cpu%) M(驻留内存) i(不显示僵尸)
* kill PID kill -9 PID kill %job
* pmap PID 进程内存的状况
* ps -u colin115 |  awk '/av_/ {print "kill -9 " $1}' | sh  将用户colin115下的所有进程名以av_开头的进程终止
* ps -fe| grep colin115|grep HOST |awk '{print $2}' | xargs kill -9;  将用户colin115下所有进程名中包含HOST的进程终止

## 性能监控
* sar 有的某人没有安装，比较强大
* free -h 查看内存使用情况
* df -h 磁盘空间利用情况
* du -sh 当前目录下空间使用情况
* vmstat n m cup\io\等的数据

## 网络工具
* netstat 网络相关信息
* lsof list opened files，也可以按照端口查找 lsof -i:8080
* route -n 路由状态
* traceroute IP 前往地址IP的路由路径
* host domain 域名domain对应的IP
* host IP 反向DNS查询

* wget url 下载文件或网页-c：断点续传-o：指定日志文件；输出都写入日志–limit-rate :下载限速
* ssh ID@host
* sftp ID@host
* scp localpath ID@host:path 将本地localpath指向的文件上传到远程主机的path路径

## 用户和组
* useradd -m username 该命令为用户创建相应的帐号和用户目录/home/username；
* passwd username 用户添加之后，设置密码
* userdel -r username -r选项完全删除用户信息
* su username
* groups 当前用户所属组；默认情况下，添加用户操作也会相应的增加一个同名的组，用户属于同名组
* more /etc/passwd more /etc/group
* chmod userMark(+|-)PermissionsMark更改文件的读写权限userMark取值u用户g组o其它用户a所有用户PermissionsMark取值：r读w写x执行
* chown username dirOrFile
* 

## 常用命令列表

```
vi/emac/nano
find -name *.sh      find -iname *.sh
grep
cat
more
paste 合并两个或多个文本文件，按行来进行合并
ls
lsblk 列出设备
lsof  显示您的系统当前已打开的所有文件
mkdir
mv     移动重命名
rm     可以用来删除文件和目录rm -rf 删除目录及下级文件
rename     批量重命名文件
cmp     ----compare two file
dd     作用是用指定大小的块拷贝一个文件，并在拷贝的同时进行指定的转换
cal     日历
pwd  print work place
whereis 的作用是用来定位命令的二进制文件\资源\或者帮助页 whereis ls
alias     允许你为名字比较长的或者经常使用的命令指定别名     unalias
df -h
du -h
history

网络
ping
ifconfig ifconfig用来配置常驻内核的网络接口信息
netstat
nsloolkup www.baidu.com      获得互联网服务器的信息
dig   查询DNS 域名服务器的工具

管理
kill          pkill
service	服务
touch     change file timestamps
chmod     change file mode bits改变权限
chown     change file owner and group
ps
free   
top      显示CPU进程信息
sudo
su
uptime
passwd 修改密码
wall
mesg  write talk
w
uname

工具
apt-get
tar
mad5sum                       
sha1sum
gcc -o Hello Hello.c      g++ -o Add Add.cpp
wget Wget是用于非交互式（例如后台）下载文件的免费工具

mount 是一个很重要的命令，用来挂载不能自动挂载的文件系统

shutdown -r now 立即重启
```