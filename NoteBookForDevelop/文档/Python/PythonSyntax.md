# 2 to 3
* [2 to 3对照](http://www.diveintopython3.net/porting-code-to-python-3-with-2to3.html)


# import 
    包导入 当一个模块运行时，此模块自动加入sys.path
# from . import *
    将. 中的库导入，不需要model.fun，直接fun即可调用
# 变量作用域
## global
# 循环技巧

# python的数据结构 
    * tuple 元组 ()
    * list 列表 []
    * set 集合 {}
    * 字典    a={'a':'b',} a[(1,2)]=3
```
# 此时，a和b不是指向一个对象
a = [1,2,3]
b = list(a)
c = a[:]
```
# 函数参数
```
def func(x, y, z=0, *args, **kwargs):
    print 'x =', x
    print 'y =', y
    print 'z =', z
    print 'args =', args
    print 'kwargs =', kwargs

    默认参数要放在所有必选参数的后面。
    应该使用不可变对象作为函数的默认参数。
    *args 表示可变参数，**kwargs 表示关键字参数。
    参数组合在使用的时候是有顺序的，依次是必选参数、默认参数、可变参数和关键字参数。
    *args 和 **kwargs 是 Python 的惯用写法。
```

# 输入和输出
print() print(line, end='')
open() read() readline() readlines() write()
str.format() 
    * 'We are the {} who say "{}!"'.format('knights', 'Ni')
    * 'This {food} is {adjective}.'.format(food='spam', adjective='absolutely horrible')
    * '{0:10} ==> {1:10d}'.format(name, phone)
repr() str()  生成解释器可读   生成人易读


# 异常处理
try:
    result = x / y
except ZeroDivisionError:
    print("division by zero!")
else:
    print("result is", result)
finally:
    print("executing finally clause")
# class
* 类变量 在类中定义                         -所有实例共享
* 实例变量 在 __init__(self)中定义  -一个实例访问
* @classmethod 属于类的静态方法，通过classname.methodname()调用
* 继承
```
class A:
    def __init__(self):
        pass
class B(A):
    def __init__(self):
        pass
```
# decorate 装饰器

## 有用的方法方法

@functools.wraps(func)  方便debug
## 演示
```python
@decorate
def function(*args, **kw):
    pass
内部执行过程
function = decorate(function)

使用@functools.wraps(func)，方便调试
import functools
def de(func):
    @functools.wraps(func)
    def t(*args, **kw):
        return func(*args, **kw)
    return t
@de
def test():
    """DocStrings"""
    print("func test(t)")
test.__doc__ == 'DocStrings'

# 创建类装饰器 log添加属性，memonto添加方法(不可以重载，故使用mixin)
def log(class_):
    class_.logger = logging.getLogger(class_.__qualname__)
    return class_
logging.basicConfig(stream=sys.stderr, level=logging.DEBUG)
def memonto(class_):
    def m(self):
        print('m')
    class_.m = m
    return class_
@memonto
@log
class DecorateTest:
    def __init__(self):
        self.logger.info('New instance')
    def method(self):
        pass

# mixin机制
创建一个类，由其他的类继承，这个过程就是mixin
class Mixin:
    def m(self):
        print('m')
class De(Mixin):
    pass
```

# [PEP8 Python 编码规范整理](https://www.douban.com/note/134971609/)
    [编码结构](http://python.jobbole.com/84618/)

当前时间+日期


******** [Python快速教程](http://www.cnblogs.com/vamei/archive/2012/09/13/2682778.html)


# *************************************************************************************

# 内建函数

```python

```
## 字符串相关

str.split str.join 逆过程
str.format 格式化输出，可以产生任何输出
str. ljust rjust center 字符串域内对齐

## 工具函数
abs int round 
int float str
eval 执行其中的数值表达式
range()

## filter map reduce

* filter 
```
def a(x):return x * x * x
print(list(map(a, range(1, 11)))) # [1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]
def b(x):return x + x
print(list(map(b,"abcde"))) # ['aa', 'bb', 'cc', 'dd', 'ee']
def f(x):return x % 2 != 0 and x % 3 != 0
print(list(filter(f, range(2, 25)))) # [5, 7, 11, 13, 17, 19, 23]
def f(x):return x != 'a'
print(list(filter(f, "abcdef"))) # ['b', 'c', 'd', 'e', 'f']
print(list(filter(b, 'abcdef'))) # ['a', 'b', 'c', 'd', 'e', 'f']
def add(x, y):return x + y
print(functools.reduce(add, range(1, 11))) # 55
print(list(filter(lambda x:x, ['a', '', 'b', '', ' ']))) # ['a', 'b', ' ']
```

## list tuple dict

# 好玩的库 
turtle
