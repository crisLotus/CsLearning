# 基本概念
* docker客户端和服务端
* docker镜像
* registry
* docker容器
	* 镜像是Docker生命周期中的构建或打包阶段，而容器是启动或执行阶段

## 其他
* 本地镜像都保存在宿主机的/var/lib/docker目录下
* 使用docker toolbox，本机不是宿主机，docker中的default为宿主机。通过docker-machine config获得宿主机的ip
* [容器间数据共享](http://dockone.io/article/128)

# 安装方法
* 下载[docker-toolbox]()
* mklink .docker D:\Software\Dev\Docker\.docker # 加软li为了不把c盘撑炸
enjoy
* [共享目录想挂在非user目录，则需要配置一下](https://www.jianshu.com/p/2ecef54c1e33),为了方便，配置如下
	* 在virtualbox中创建共享目录，目录为d盘，共享名为D
	* docker-machine ssh default 'sudo mkdir -p /D && sudo mount -t vboxsf D /D && sudo ln -s /D /d'

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
	* -P 全端口映射
	* -p 127.0.0.1:80:80 指定映射ip和端口
	* -i stdin开启
	* -t 为要创建的容器创建伪tty
	* --name 指定容器的名字
	* -v 将宿主机的目录作为卷，挂载到容器中
		* docker run -d -p 80 --name website -v $PWD/website:/var/www/html/website user/img nginx
	* --mount type=bind,source=/src/webapp,target=/opt/webapp -v的替代品
	* --volumes-from 从其他容器中加载所有卷
		* docker run -d -P --name website --volumes-from sample_comtainner user/img
		* [共享目录想挂在非c/user目录，则需要配置一下](https://www.jianshu.com/p/2ecef54c1e33)，本问安装方法中说明如何配置
	* -e 设置环境变量
	* -h 指定主机名，并可以被本地DNS解析
	* -u 设置运行的用户，可以覆盖USER指定的值
	* --privileged 特权模式运行，容器具有宿主机相同的权限
		* docker run -p 8080:8080 --name jenkeins --privileged -d local/jenkeins
	* **--rm** 容器进程完毕后，自动删除容器
* docker stop <docker names>
* docker start <docker names>
* docker rm <docker names>
	* docker rm `docker ps -a -q` 删除所有的容器
	* -v 连同数据卷一起删除

## 与容器交互

* docker stats
* docker port <container name>
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

### 数据卷volumes
* [docerinfo文档](http://www.dockerinfo.net/%E6%95%B0%E6%8D%AE%E5%8D%B7volumes)
* docker volume create my-vol
* docker volume ls
* docker volume inspect my-vol
* 挂载数据卷
	* docker run -d -P --name web --mount source=my-vol,target=/webapp user/imagenm python app.py 
	* docker run -d -P --name web my-vol:/webapp user/imagenm python app.py
* docker volume rm my-vol
* docker volume prune 清理数据卷

## 修改镜像
* docker commit
* docker build
	* docker build . # .表示在当前目录下找dockerfile
	* docker build -t "user/imagename:v1" git仓库 ## 在指定网络位置寻找dockerfile
	* docker history <imagename> # 如何创建的镜像

### Dockerfile指令
* MAINTAINER Exfly "exfly@outlook.com"
* RUN 构建镜像时运行
* CMD 启动容器时运行；多个CMD指令，最后一个生效，想启动多个进程，可以考虑Supervisor，本质上CMD转化为ENTRYPOINT进行执行。
* EXPOSE 向外暴露端口
* ENTRYPOINT 执行命令
* ADD 将构建目录下的文件复制到镜像指定位置, 目录时候一定加/
	* ADD software.lic /opt/application/software.lic
* COPY
* VOLUME 向容器添加卷实现容器间共享数据
* WORKDIR 如名 ENTRYPOINT/CMD会在此目录执行
* USER 指定以什么用户执行
	* docker run -u 可以覆盖指定的值
* ONBUILD
* ENV 设置环境变量

### docker-compose

# docker toolbox 配置加速
* docker-machine ssh <machine-name>登录虚拟机
* 修改/var/lib/boot2docker/profile文件，将--registry-mirror=<your accelerate address>添加到EXTRA_ARGS中
* sudo /etc/init.d/docker restart 重启Docker

# 使用dockers做jenkins持续集成
* [jenkins-docker镜像](https://hub.docker.com/r/h1kkan/jenkins-docker/)

# 使用docker构建服务
* [首先解决数据共享问题](http://dockone.io/article/128)
	* 共享卷时不一定要运行相应的容器
	* 更新镜像时不会包含对卷的修改
	* 卷一直存在， 知道没有容器使用他们
* 俩个镜像通过volumes进行数据共享
	* docker run --name jekyll_blog -d -v $PWD/james_blog-master:/data/ local/jekyll
	* docker run -d -P --name apache --volumes-from jekyll_blog local/apache

* 备份卷
	* docker run --rm --volumes-from jekyll_blog -v $PWD:/backup ubuntu tar cvf /backup/jekyll_blog_backup.tar /var/www/htm
l
	* /var/lib/docker/volumes/82ab67296dfb6c.../_ data

# docker-machine 使用
* docker-machine create --driver virtualbox my-default 使用dock-machine创建宿主机
* eval "$(docker-machine env --shell=bash my-default)" 获得刚创建宿主机的shell

## redis后端集群
* master docker run -d -h redis_primary --name redis_primary user/imgname
* cluster docker run -f -h redis_replical --name redis_replical --link redis_primary:redis_primary user/imgname
* 查看日志 docker run -ti --rm --volumes-from redis_primary ubuntu cat /var/log/redis/redis-server.log

# 文档
* [官方文档](https://docs.docker.com/)
* [官方中文文档](https://docs.docker-cn.com/)
* [Docker中文文档](http://www.dockerinfo.net/document)
* [docker hub](https://hub.docker.com/)
* [docker--从入门到实践](https://yeasy.gitbooks.io/docker_practice)
* [阮一峰-docker使用简单介绍](http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)
* [阮一峰-docker微服务，讲解如何配置img镜像](http://www.ruanyifeng.com/blog/2018/02/docker-wordpress-tutorial.html)
* [修改默认仓库](https://www.kar-chan.com/?p=5906)
* [http://book.itmuch.com/](使用Spring Cloud与Docker实战微服务)
* [Various Dockerfiles I use on the desktop and on servers](https://github.com/jessfraz/dockerfiles)
