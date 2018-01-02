[vagrant官方docs](https://www.vagrantup.com/docs/)
[vagrant 配置](http://rmingwang.com/vagrant-commands-and-config.html)
[Vagrant 配置](https://blog.smdcn.net/article/1308.html)
[配置vagrant镜像](https://favoorr.github.io/2017/01/06/import-vagrant-box-manually/)

[官方boxs](https://app.vagrantup.com/boxes/search)
[开始使用 Vagrant](https://imququ.com/post/vagrantup.html)
[163软件源配置方法](http://wtt.tt/zai-ubuntu-16-04-shang-geng-huan-wei-wang-yi-jing-xiang-yuan/)
[国内镜像源](https://segmentfault.com/a/1190000000375848)

```
 $ vagrant box add {title} {url}
 $ vagrant init {title}
 $ vagrant up

vagrant up	启动本地环境
vagrant halt	关闭本地环境
vagrant suspend	暂停本地环境
vagrant resume	恢复本地环境
vagrant reload	修改了 Vagrantfile 后，使之生效（相当于先 halt，再 up）
vagrant ssh	通过 ssh 登录本地环境所在虚拟机
vagrant destroy	彻底移除本地环境
```
