# linux机制

写时复制
请求分页
# 资源

* [参考书1-linux操作系统原理与应用-陈莉君·康华]()
* [参考书2-linux内核0.11完全注释]()
* [linux-0.11启动过程描述](http://labrick.cc/2015/08/13/linux-0-11-boot/)
* [Linux0.11启动过程](http://linux.chinaunix.net/techdoc/install/2007/04/10/954810.shtml)
* [80386保护模式的本质](http://www.jianshu.com/p/1cea7dc5d6b7)
* [linux虚拟地址到线性地址的转化](http://luodw.cc/2016/02/17/address/)
* [Linux内存寻址之分段机制-linux回避了分段机制](http://blog.xiaohansong.com/2015/10/03/Linux%E5%86%85%E5%AD%98%E5%AF%BB%E5%9D%80%E4%B9%8B%E5%88%86%E6%AE%B5%E6%9C%BA%E5%88%B6/)
* [Linux内存寻址之分页机制/](http://blog.xiaohansong.com/2015/10/05/Linux%E5%86%85%E5%AD%98%E5%AF%BB%E5%9D%80%E4%B9%8B%E5%88%86%E9%A1%B5%E6%9C%BA%E5%88%B6/)
* [逻辑地址、线性地址、物理地址和虚拟地址](http://www.voidcn.com/blog/will130/article/p-5705051.html)
* [Intel 80386 程序员参考手册](http://www.kancloud.cn/wizardforcel/intel-80386-ref-manual/123838)
* [linux内存管理](http://oldlinux.org/Linux.old/study/Ref-docs/Linux011-Mem-YuanYi.pdf)
* [linux0.11内核之文件系统](http://harpsword.leanote.com/post/Untitled-563d6103ab6441584f000164)
# 常用命令

1. df ps -e free  磁盘 正运行程序 内存使用情况
* ssh user@host
* ps lf 输出进程状态和进程间关系
* lsblk -t  或者 /sys/block/<磁盘名>/queue/scheduler 显示磁盘
* fork exec 
* nohup 让后台程序在后台一直运行，不需要一直开着电脑
* screen 创建多个虚拟终端，如果关闭，不会kill后台程序
* pmap 用户进程逻辑地址空间内存映射信息
* jobs 查看运行作业
* 改变作业状态 后台执行-fg->前台执行 暂停-fg->前台执行 前台-ctrl+z->暂停 暂停-bg->后台执行 
* 管道常用命令 cut grep head paste sort tr uniq wc
	* cut	通过分隔符拆分后，显示指定的域
	* grep	显示与模式匹配的行
	* head 	显示文件的开始部分
	* paste	通过制定的分隔符将两个文件的各行进行合并，或者通过制定的分隔符合并一个文件中的多行
	* sort	对多行进行排序
	* tr 	替换 删除字符，压缩文字序列
	* uniq	压缩连续的相同的行
	* wc	显示字节数字数行数

# linux 各文件用途

1. /proc/
	1. /proc/meminfo
	*  /proc/vmallocinfo vmallocUsed 详情
	*  /proc/<进程id>/status 某个近曾使用内存的详情
	*  /proc/sys/kernel/pid_max 查看最大进程数
* /lib 	c编译程序需要的函数库 二进制文件
* /usr	用户程序和重要目录
* /bin 	普通用户使用的二进制文件，如cd等
* /dev 	设备文件
* /home	用户主目录
* /etc/
	1. /etc/init.d/ 开机启动脚本
* /mnt	用户临时挂载其他文件系统
* /root	管理员主目录
* /var 	存放经常修改的文件，如日志文件
* /tmp 	临时存储
* /sbin系统管理员常用二进制文件 

# linux内核源码结构

* include/	包含文件
* init/		内核初始代码
* arch/		包含linux支持的所有硬件结构内核代码
* drivers	设备驱动程序
* fs 		文件系统
* net 		网络
* mm 		内存管理
* ipc		进程间通信
* kernal	主内核代码
