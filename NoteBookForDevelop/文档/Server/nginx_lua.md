# nginx
[openresty最佳实践](https://moonbingbing.gitbooks.io/openresty-best-practices/content/)
## 命令行
* nginx -c config.file 指定配置文件
* nginx -g "pid var/test.pid" 临时指定一些全局配置项
* nginx -s 向正在运行的服务发送信号量 stop 停止服务 quit 优雅停服 reload 重新加载配置项 reopen生成新的日志
* nginx -t 不启动nginx的情况测试配置文件是否有错误
* nginx -p 指定工作目录

## nginx配置
* 配置两个绑定端口的静态服务
```
html {
	server {
        #侦听80端口
        listen    80;
        #定义使用 www.nginx.cn访问
        server_name  www.nginx.cn;
        #定义服务器的默认网站根目录位置
        root html_s/t;
        #设定本虚拟主机的访问日志
        access_log  logs/nginx.access.log  main;
        #默认请求
        location / {
            #定义首页索引文件的名称
            index index.php index.html index.htm;
        }
    }
    server {
        listen    8080;
        server_name  www.nginx.cn;
        root html_s/b;
        access_log  logs/nginx.access.log  main;
        location / {
            index index.php index.html index.htm;
        }
    }
}
```
* 虚拟主机
* 反向代理服务器
```nginx
<!-- 反向代理服务器 配置 -->
	upstream backend {
        server 127.0.0.1:8080 weight=5;
        server 127.0.0.1:8081 weight=19;
    }
    server {
        #侦听80端口
        listen    80;
        location / {
            proxy_pass http://backend;
        }
    }
<!-- 两个真实的服务器 -->
    server {
        listen    8081;
        root html_s/t;
 
        access_log  logs/nginx.access.log  main;
 
        location / {
            index index.php index.html index.htm;   
 
        }
    }
    server {
        listen    8080;
        root html_s/b;
        access_log  logs/nginx.access.log  main;
        location / {
            index index.php index.html index.htm;   
        }
    }

```

## openresty
content_by_lua_file

# 参考
深入理解Nginx模块开发与架构解析第2版LinuxUnix技术丛书