# import 
	包导入 当一个模块运行时，此模块自动加入sys.path
# from . import *
	将. 中的库导入，不需要model.fun，直接fun即可调用
# 循环技巧

# python的数据结构 
	* 元组 ()
	* tuple []
	* set	{}
	* 字典	{'a':'b',}

# 输入和输出
print() print(line, end='')
open() read() readline() readlines() write()
str.format() 
	* 'We are the {} who say "{}!"'.format('knights', 'Ni')
	* 'This {food} is {adjective}.'.format(food='spam', adjective='absolutely horrible')
	* '{0:10} ==> {1:10d}'.format(name, phone)
repr() str()  生成解释器可读   生成人易读
# 异常处理
	
# class
	类变量 在类中定义 						-所有实例共享
	实例变量 在 __init__(self)中定义 	-一个实例访问
	@classmethod 属于类的静态方法，通过classname.methodname()调用
	
# [PEP8 Python 编码规范整理](https://www.douban.com/note/134971609/)
	[编码结构](http://python.jobbole.com/84618/)

当前时间+日期


******** [Python快速教程](http://www.cnblogs.com/vamei/archive/2012/09/13/2682778.html)
