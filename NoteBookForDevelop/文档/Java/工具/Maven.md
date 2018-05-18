# maven rep
* [依赖坐标搜索](http://search.maven.org/)
* [maven实战]

## 最佳实践
* bin下有mvn和mvnDebug(运行mvn时开始debug)
* M2_HOME maven主程序的安装目录
* ~/.m2 本地包下载位置
* http代理
	* setting.xml中的proxies
* MAVEN_OPTS
	* 运行mvn时候相当于运行java命令，MAVEN_OPTS可以配置为任何java的命令参数

* 设置MAVEN_OPTS环境变量
* 配置用户范围settings.xml
	* %M2_HOME%/conf/settings.xml 为全局配置文件
	* ~/.m2/settings.xml 为用户配置文件
* 不要使用IDE内嵌的Maven，应该配置IDE中为自己安装的maven

* 显示声明所有用到的依赖

## pom.xml
* scope
	* test 测试
	* compile 默认 编译、测试、运行
	* provided 编译、测试
	* runtime 测试、运行
	* system 尽量不要使用 与provided范围完全相同，但需要配置systemPath指定文件路径
	* import ?
* 

## maven setting.xml
* ~/.m2/settings.xml 用户配置
* M2_HOME/conf/settings.xml 全局配置

## 命令
* mvn archetype:generate 创建项目
* mvn help:system java一些信息
* mvn clean compile 清理+编译
* mvn clean install   # -U强制jar更新
* mvn install:install 安装到本地仓库
* mvn clean test
	* mvn package -DskipTests跳过测试
* mvn help:effective-pom 生效的pom
* mvn dependency:list 依赖
* mvn dependency:tree 依赖树

## 常用插件
* maven-shade-plugin 打包
* maven-surefire-plugin 测试
* maven-compiler-plugin 编译

## 依赖传递 依赖调解
* 路径最近这优先
* 第一声明者优先

## maven仓库
* 中央仓库
* 私服
* 其他公开库
	* repository.jboss.com/maven2

## 生命周期
* [官网介绍](http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)
* clean test install deploy site-deploy

## 聚合与继承

* 约定优于配置
* 反应堆

## 自己的心得
* 使用符号链接，将~/.m2/repository放到其他盘，防止C盘占用过大 mklink /D ~/.m2/repository path/to/yours

## 冲突管理
* 出classnotfound异常，先查看所在包是否被导入了，没被导入看是否在文件系统里有，有的话删除，没有的话继续下一步
* 到pom文件的dependency hierarchy查看包是否生效，注意查看omitted for conflict
* 查找到冲突库的版本后，从低级别版本开始exclude，逐渐尝试每一个版本，知道不出现冲突