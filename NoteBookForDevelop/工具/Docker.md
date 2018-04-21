# 基本概念
* docker客户端和服务端
* docker镜像
* registry
* docker容器
	* 镜像是Docker生命周期中的构建或打包阶段，而容器是启动或执行阶段

## 其他
* 本地镜像都保存在宿主机的/var/lib/docker目录下
* 使用docker toolbox，本机不是宿主机，docker中的default为宿主机。通过docker-machine config获得宿主机的ip

# 安装方法
* 下载[docker-toolbox]()
* mklink .docker D:\Software\Dev\Docker\.docker # 加软li为了不把c盘撑炸
enjoy

# 使用方法
## 获得image
* docker-machine start 启动docker服务器
* docker-machine stop  关闭docker服务器
* docker version /docker info docker版本信息
* docker image ls 列出本机所有image
* docker image rm [imageName] 删除image
* docker pull <img-name>
	* imageName:latest

## 启动停止删除容器
* docker run -d -P <img-name> python app.py 启动容器
	* -d 后台运行容器
	* -P 端口映射
	* -p 127.0.0.1:80:80 指定映射ip和端口
	* -i stdin开启
	* -t 为要创建的容器创建伪tty
	* --name 指定容器的名字
	* -v 将宿主机的目录作为卷，挂载到容器中
		* docker run -d -p 80 --name website -v $PWD/website:/var/www/html/website user/img nginx
		* [共享目录想挂在非user目录，则需要配置一下](https://www.jianshu.com/p/2ecef54c1e33),为了方便，配置如下
			* 在virtualbox中创建共享目录，目录为d盘，共享名为D
			* docker-machine ssh default 'sudo mkdir -p /D && sudo mount -t vboxsf D /D'
	* -e 设置环境变量
	* -u 设置运行的用户，可以覆盖USER指定的值
* docker stop <docker names>
* docker start <docker names>
* docker rm <docker names>
	* docker rm `docker ps -a -q` 删除所有的容器

## 与容器交互

* docker stats
* docker ps
	* docker ps -l 最后启动的容器
	* -a 列出所有容器
	* -q 只返回容器的ID
* docker logs -f <docker names>
		* -f 末尾
		* -t 加上时间截
* docker top <docker names>
* docker inspect <docker names> 指定容器的状态信息json

* docker attach 重新附着到容器会话上
* docker exec -t -i <docker name> COMMAND

## 修改镜像
* docker commit
* docker build
	* docker build . # .表示在当前目录下找dockerfile
	* docker build -t="user/imagename:v1" git仓库 ## 在指定网络位置寻找dockerfile
	* docker history <imagename> # 如何创建的镜像

### Dockerfile指令
* RUN 构建竟像时运行
* CMD 启动容器是运行 多个CMD指令，最后一个生效，想启动多个进程，可以考虑Supervisor
* EXPOSE 向外暴漏端口
* ENTRYPOINT
* ADD 将构建目录下的文件复制到镜像指定位置, 目录时候一定加/
	* ADD software.lic /opt/application/software.lic
* COPY
* VOLUME 向容器添加卷实现荣期间共享数据
* WORKDIR 如名 ENTRYPOINT/CMD会在此目录执行
* USER 指定以什么用户执行
	* docker run -u 可以覆盖指定的值
* ONBUILD
* ENV 设置环境变量

# docker toolbox 配置加速
* docker-machine ssh <machine-name>登录虚拟机
* 修改/var/lib/boot2docker/profile文件，将–registry-mirror=<your accelerate address>添加到EXTRA_ARGS中
* sudo /etc/init.d/docker restart 重启Docker

# 文档
* [官方文档](https://docs.docker.com/)
* [官方中文文档](https://docs.docker-cn.com/)
* [docker hub](https://hub.docker.com/)
* [docker--从入门到实践](https://yeasy.gitbooks.io/docker_practice/content/introduction/what.html)
* [阮一峰-docker使用简单介绍](http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
* [阮一峰-docker微服务，讲解如何配置img镜像](http://www.ruanyifeng.com/blog/2018/02/docker-wordpress-tutorial.html)
* [修改默认仓库](https://www.kar-chan.com/?p=5906)
