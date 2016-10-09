[makefile简要介绍](http://blog.csdn.net/liang13664759/article/details/1771246)

[Makefile经典教程(掌握这些足够)](http://blog.csdn.net/ruglcc/article/details/7814546/)

# 极简单的一个实例
```
P=test
OBJECTS=
CFLAGS = -g -Wall -O3
LDLIBS=
CC=c99

$(P): $(OBJECTS)

```
.PHONY : clean #表示clean为伪命令
clean从来都是放在文件的最后

# 简单语法
```
target: prerequisites
	command
```

# make 中的变量
objects = main.o kbd.o command.o display.o insert.o search.o files.o utils.o
使用变量： $(objects)

# make 自动推导

# 另类风格makefile

```
objects = main.o kbd.o command.o display.o /
insert.o search.o files.o utils.o

edit : $(objects)
  cc -o edit $(objects)

main.o : defs.h
kbd.o : defs.h command.h
command.o : defs.h command.h
display.o : defs.h buffer.h
insert.o : defs.h buffer.h
search.o : defs.h buffer.h
files.o : defs.h buffer.h command.h
utils.o : defs.h

.PHONY : clean
clean :
-rm edit $(objects)
```
减号表示出错则忽略


# make其他规则

1、显式规则。显式规则说明了，如何生成一个或多的的目标文件。这是由Makefile的书写者明显指出，要生成的文件，文件的依赖文件，生成的命令。
2、隐晦规则。由于我们的make有自动推导的功能，所以隐晦的规则可以让我们比较粗糙地简略地书写Makefile，这是由make所支持的。
3、变量的定义。在Makefile中我们要定义一系列的变量，变量一般都是字符串，这个有点你C语言中的宏，当Makefile被执行时，其中的变量都会被扩展到相应的引用位置上。
4、文件指示。其包括了三个部分，一个是在一个Makefile中引用另一个Makefile，就像C语言中的include一样；另一个是指根据某些情况指定Makefile中的有效部分，就像C语言中的预编译#if一样；还有就是定义一个多行的命令。有关这一部分的内容，我会在后续的部分中讲述。
5、注释。Makefile中只有行注释，和UNIX的Shell脚本一样，其注释是用“#”字符，这个就像C/C++中的“//”一样。如果你要在你的Makefile中使用“#”字符，可以用反斜框进行转义，如：“/#”。
最后，还值得一提的是，在Makefile中的命令，必须要以[Tab]键开始。

# 引用其他makefile
include <filename>

# 自动生成依赖

自动找寻源文件中包含的头文件，并生成一个依赖关系。例如，如果我们执行下面的命令：
cc -M main.c
其输出是：
main.o : main.c defs.h
如果你使用GNU的C/C++编译器，你得用“-MM”参数，不然，“-M”参数会把一些标准库的头文件也包含进来。


