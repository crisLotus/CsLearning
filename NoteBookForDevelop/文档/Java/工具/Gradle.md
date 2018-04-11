# Gradle

## Terminology(术语与关系理解)

在Grade中，我们常见的几个关键术语有Project、Plugin以及Task。和Maven一样，Gradle只是提供了构建项目的一个框架，真正起作用的是Plugin。Gradle在默认情况下为我们提供了许多常用的Plugin，其中包括有构建Java项目的Plugin，还有War，Ear等。与Maven不同的是，Gradle不提供内建的项目生命周期管理，只是Java Plugin向Project中添加了许多Task，这些Task依次执行，为我们营造了一种如同Maven般项目构建周期。换言之，Project为Task提供了执行上下文，所有的Plugin要么向Project中添加用于配置的Property，要么向Project中添加不同的Task。一个Task表示一个逻辑上较为独立的执行过程，比如编译Java源代码，拷贝文件，打包Jar文件，甚至可以是执行一个系统命令或者调用Ant。另外，一个Task可以读取和设置Project的Property以完成特定的操作。

## Advantage(优势)

- [Ant vs Maven vs Gradle](http://blog.csdn.net/napolunyishi/article/details/39345995)

### Ant with Ivy

Ant是第一个“现代”构建工具，在很多方面它有些像Make。2000年发布，在很短时间内成为Java项目上最流行的构建工具。它的学习曲线很缓，因此不需要什么特殊的准备就能上手。它基于过程式编程的idea。在最初的版本之后，逐渐具备了支持插件的功能。主要的不足是用XML作为脚本编写格式。 XML，本质上是层次化的，并不能很好地贴合Ant过程化编程的初衷。Ant的另外一个问题是，除非是很小的项目，否则它的XML文件很快就大得无法管理。后来，随着通过网络进行依赖管理成为必备功能，Ant采用了Apache Ivy。

Ant的主要优点在于对构建过程的控制上。Ivy的依赖需要在ivy.xml中指定。我们的例子很简单，只需要依赖JUnit和Hamcrest。

``` xml
<ivy-module version="2.0">
    <info organisation="org.apache" module="java-build-tools"/>
    <dependencies>
        <dependency org="junit" name="junit" rev="4.11"/>
        <dependency org="org.hamcrest" name="hamcrest-all" rev="1.3"/>
    </dependencies>
</ivy-module>
```

现在我们来创建Ant脚本，任务只是编译一个Jar文件。最终文件是下面的build.xml。

``` xml
<project xmlns:ivy="antlib:org.apache.ivy.ant" name="java-build-tools" default="jar">

    <property name="src.dir" value="src"/>
    <property name="build.dir" value="build"/>
    <property name="classes.dir" value="${build.dir}/classes"/>
    <property name="jar.dir" value="${build.dir}/jar"/>
    <property name="lib.dir" value="lib" />
    <path id="lib.path.id">
        <fileset dir="${lib.dir}" />
    </path>

    <target name="resolve">
        <ivy:retrieve />
    </target>

    <target name="clean">
        <delete dir="${build.dir}"/>
    </target>

    <target name="compile" depends="resolve">
        <mkdir dir="${classes.dir}"/>
        <javac srcdir="${src.dir}" destdir="${classes.dir}" classpathref="lib.path.id"/>
    </target>

    <target name="jar" depends="compile">
        <mkdir dir="${jar.dir}"/>
        <jar destfile="${jar.dir}/${ant.project.name}.jar" basedir="${classes.dir}"/>
    </target>

</project>
```

首先，我们设置了几个属性，然后是一个接一个的task。我们用Ivy来处理依赖，清理，编译和打包，这是几乎所有的Java项目都会进行的task，配置有很多。

运行Ant task来生成Jar文件，执行下面的命令。

``` 
ant jar  
```





### Maven

Maven发布于2004年。目的是解决码农使用Ant所带来的一些问题。Maven仍旧使用XML作为编写构建配置的文件格式，但是，文件结构却有巨大的变化。Ant需要码农将执行task所需的全部命令都一一列出，然而Maven依靠约定（convention）并提供现成的可调用的目标（goal）。不仅如此，有可能最重要的一个补充是，Maven具备从网络上自动下载依赖的能力（Ant后来通过Ivy也具备了这个功能），这一点革命性地改变了我们开发软件的方式。

但是，Maven也有它的问题。依赖管理不能很好地处理相同库文件不同版本之间的冲突（Ivy在这方面更好一些）。XML作为配置文件的格式有严格的结构层次和标准，定制化目标（goal）很困难。因为Maven主要聚焦于依赖管理，实际上用Maven很难写出复杂、定制化的构建脚本，甚至不如Ant。用XML写的配置文件会变得越来越大，越来越笨重。在大型项目中，它经常什么“特别的”事还没干就有几百行代码。

Maven的主要优点是生命周期。只要项目基于一定之规，它的整个生命周期都能够轻松搞定，代价是牺牲了灵活性。在对DSL（Domain Specific Languages)的热情持续高涨之时，通常的想法是设计一套能够解决特定领域问题的语言。在构建这方面，DSL的一个成功案例就是Gradle。

``` xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0

http://maven.apache.org/maven-v4_0_0.xsd">

    <modelVersion>4.0.0</modelVersion>
    <groupId>com.technologyconversations</groupId>
    <artifactId>java-build-tools</artifactId>
    <packaging>jar</packaging>
    <version>1.0</version>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.11</version>
        </dependency>
        <dependency>
            <groupId>org.hamcrest</groupId>
            <artifactId>hamcrest-all</artifactId>
            <version>1.3</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>2.3.2</version>
            </plugin>
        </plugins>
    </build>

</project>
```

通过执行下面的命令来运行Maven goal生成Jar文件。

``` xml
mvn package  
```

主要的区别在于Maven不需要指定执行的操作。我们没有创建task，而是设置了一些参数（有哪些依赖，用哪些插件...). Maven推行使用约定并提供了开箱即用的goals。Ant和Maven的XML文件都会随时间而变大，为了说明这一点，我们加入CheckStyle，FindBugs和PMD插件来进行静态检查，三者是Java项目中使用很普遍的的工具。我们希望将所有静态检查的执行以及单元测试一起作为一个单独的targetVerify。当然我们还应该指定自定义的checkstyle配置文件的路径并且确保错误时能够提示。更新后的Maven代码如下：

``` xml
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-checkstyle-plugin</artifactId>
    <version>2.12.1</version>
    <executions>
        <execution>
            <configuration>
                <configLocation>config/checkstyle/checkstyle.xml</configLocation>
                <consoleOutput>true</consoleOutput>
                <failsOnError>true</failsOnError>
            </configuration>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
<plugin>
    <groupId>org.codehaus.mojo</groupId>
    <artifactId>findbugs-maven-plugin</artifactId>
    <version>2.5.4</version>
    <executions>
        <execution>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-pmd-plugin</artifactId>
    <version>3.1</version>
    <executions>
        <execution>
            <goals>
                <goal>check</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

通过执行下面的命令来运行Maven goal，包括单元测试，静态检查，如CheckStyle，FindBugs和PMD。

``` xml
mvn verify  
```



### Gradle

Gradle结合了前两者的优点，在此基础之上做了很多改进。它具有Ant的强大和灵活，又有Maven的生命周期管理且易于使用。最终结果就是一个工具在2012年华丽诞生并且很快地获得了广泛关注。例如，Google采用Gradle作为Android OS的默认构建工具。Gradle不用XML，它使用基于Groovy的专门的DSL，从而使Gradle构建脚本变得比用Ant和Maven写的要简洁清晰。Gradle样板文件的代码很少，这是因为它的DSL被设计用于解决特定的问题：贯穿软件的生命周期，从编译，到静态检查，到测试，直到打包和部署。

它使用Apache Ivy来处理Jar包的依赖。Gradle的成就可以概括为：约定好，灵活性也高。

``` groovy
apply plugin: 'java'
apply plugin: 'checkstyle'
apply plugin: 'findbugs'
apply plugin: 'pmd'

version = '1.0'

repositories {
    mavenCentral()
}

dependencies {
    testCompile group: 'junit', name: 'junit', version: '4.11'
    testCompile group: 'org.hamcrest', name: 'hamcrest-all', version: '1.3'
}
```





## Reference

### Tutorials&Docs

- [Gradle入门系列](http://blog.jobbole.com/71999/)
- [Gradle学习系列](http://www.cnblogs.com/CloudTeng/p/3417762.html)

### Books

- [Gradle实战](https://lippiouyang.gitbooks.io/gradle-in-action-cn/content/index.html)
- [Gradle User Guide 中文版](https://dongchuan.gitbooks.io/gradle-user-guide-/content/)
### Practice

- [Gradle 奇技淫巧](http://blog.chengyunfeng.com/?p=833)
- [受用不尽的Gradle使用方法与技巧](http://www.tuicool.com/articles/i2Ijiin)
- [Gradle在大型Java项目上的应用](http://www.infoq.com/cn/articles/Gradle-application-in-large-Java-projects/)

# Quick Start

## Installation

### Windows系统安装

### 类Unix系统安装

首先，先download最新版本的gradle，网址如下：[download](http://www.gradle.org/get-started)。然后将下载下来的zip包放在你要安装的路径上，我安装在
```
/usr/local/bin；
```
然后打开电脑上的.bash_profile文件，输入以下命令：
```
GRADLE_HOME=/usr/local/bin/gradle-1.8;
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin
```
然后再在console上输入以下命令：
```
source ~/.bash_profile
```
这样就安装成功啦，可以通过以下命令来查看是否安装成功。
```
gradle -version
```
如果提示没有gradle命令，则有可能是：

- GRADLE_HOME路径可能不对；

- 没有执行source ~/.bash_profile

## Setup

### Convert Maven Projects(Maven项目的转化)
直接在你包含
The first step is to run `gradle init` in the directory containing the (master) POM. This will convert the Maven build to a Gradle build, generating a `settings.gradle` file and one or more `build.gradle` files. For simpler Maven builds, this is all you need to do. For more complex Maven builds, it may be necessary to manually add functionality on the Gradle side that couldn't be converted automatically.

### Java Project

### Web Application

- [gradle-spring-mvc-web-project-example](http://www.mkyong.com/spring-mvc/gradle-spring-mvc-web-project-example/)

## Build

### tasks

Gradle在默认情况下为我们提供了几个常用的Task，比如查看Project的Properties、显示当前Project中定义的所有Task等。可以通过一下命令查看Project中所有的Task：

``` 
gradle tasks
```

输出如下：

``` groovy
:tasks

------------------------------------------------------------
All tasks runnable from root project
------------------------------------------------------------

Build Setup tasks
-----------------
setupBuild - Initializes a new Gradle build. [incubating]
wrapper - Generates Gradle wrapper files. [incubating]

Help tasks
----------
dependencies - Displays all dependencies declared in root project 'gradle-blog'.
dependencyInsight - Displays the insight into a specific dependency in root project 'gradle-blog'.
help - Displays a help message
projects - Displays the sub-projects of root project 'gradle-blog'.
properties - Displays the properties of root project 'gradle-blog'.
tasks - Displays the tasks runnable from root project 'gradle-blog'.

Other tasks
-----------
copyFile
helloWorld

To see all tasks and more detail, run with --all.

BUILD SUCCESSFUL

Total time: 2.845 secs
```

上面的other tasks中列举出来的task即是我们自定义的tasks。

#### Default tasks(默认任务)

Gradle允许在脚本中配置默认的一到多个任务来响应没有带参数的`gradle`命令：

``` groovy
defaultTasks 'clean', 'run'

task clean << {
    println 'Default Cleaning!'
}

task run << {
    println 'Default Running!'
}

task other << {
    println "I'm not a default task!"
}
```

 **gradle -q**命令的输出：

``` groovy
> gradle -q
Default Cleaning!
Default Running!
```



### properties

在默认情况下，Gradle已经为Project添加了很多Property，我们可以调用以下命令进行查看：

``` 
gradle properties
```

输出如下：

``` groovy
:properties

------------------------------------------------------------
Root project
------------------------------------------------------------

allprojects: [root project 'gradle-blog']
ant: org.gradle.api.internal.project.DefaultAntBuilder@1342097

buildDir: /home/davenkin/Desktop/gradle-blog/build
buildFile: /home/davenkin/Desktop/gradle-blog/build.gradle
...
configurations: []
convention: org.gradle.api.internal.plugins.DefaultConvention@11492ed
copyFile: task ':copyFile'
...
ext: org.gradle.api.internal.plugins.DefaultExtraPropertiesExtension@1b5d53a
extensions: org.gradle.api.internal.plugins.DefaultConvention@11492ed
...
helloWorld: task ':helloWorld'
...
plugins: [org.gradle.api.plugins.HelpTasksPlugin@7359f7]
project: root project 'gradle-blog'
...
properties: {...}
repositories: []

tasks: [task ':copyFile', task ':helloWorld']
version: unspecified

BUILD SUCCESSFUL

Total time: 2.667 secs
```