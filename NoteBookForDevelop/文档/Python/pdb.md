```
用pdb调试有多种方式可选：
1. 命令行启动目标程序，加上-m参数，这样调用myscript.py的话断点就是程序的执行第一行之前
python -m pdb myscript.py

2. 在Python交互环境中启用调试
>>> import pdb
>>> import mymodule
>>> pdb.run(‘mymodule.test()’)

3. 比较常用的，就是在程序中间插入一段程序，相对于在一般IDE里面打上断点然后启动debug，不过这种方式是hardcode的

if __name__ == "__main__":
	a = 1
	import pdb
	pdb.set_trace()
	b = 2
	c = a + b
	print (c)
然后正常运行脚本，到了pdb.set_trace()那就会定下来，就可以看到调试的提示符(Pdb)了
```
# help:
```
Documented commands (type help <topic>):
========================================
EOF    c          d        h         list      q        rv       undisplay
a      cl         debug    help      ll        quit     s        unt
alias  clear      disable  ignore    longlist  r        source   until
args   commands   display  interact  n         restart  step     up
b      condition  down     j         next      return   tbreak   w
break  cont       enable   jump      p         retval   u        whatis
bt     continue   exit     l         pp        run      unalias  where
```
* p，最有用的命令之一，打印某个变量
* ！，感叹号后面跟着语句，可以直接改变某个变量
* b(reak)， 设置断点，例如 “b 77″，就是在当前脚本的77行打上断点，还能输入函数名作为参数，断点就打到具体的函数入口，如果只敲b，会显示现有的全部断点
* condition bpnumber [condition]，设置条件断点，下面语句就是对第4个断点加上条件“a==3”
  * (Pdb) condition 4 a==3
* cl(ear)，如果后面带有参数，就是清除指定的断点（我在Python2.4上从来没成功过！！！）；如果不带参数就是清除所有的断点
* disable/enable，禁用/激活断点
* n(ext)，让程序运行下一行，如果当前语句有一个函数调用，用n是不会进入被调用的函数体中的
* s(tep)，跟n相似，但是如果当前有一个函数调用，那么s会进入被调用的函数体中
* c(ont(inue))，让程序正常运行，直到遇到断点
* j(ump)，让程序跳转到指定的行数
* a(rgs)，打印当前函数的参数
* q(uit)，退出调试
* w ，Print a stack trace, with the most recent frame at the bottom.An arrow indicates the "current frame", which determines the context of most commands. 'bt' is an alias for this command.
* d ，Move the current frame one level down in the stack trace (to a newer frame).
* u ，Move the current frame one level up in the stack trace (to an older frame).
