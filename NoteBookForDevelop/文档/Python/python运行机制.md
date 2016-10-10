# __base__ __class__ __main__ __mro__ __dict__
```
# coding:utf-8
class A:
    def a(self):
        pass
    def aa(self):
        pass
class C:pass
class B(A, C):
    """B in A"""
    def a(self):
        self.b = 0
b = B()
b.b = 1
b.c = 2
print(B.__base__)   # <class '__main__.A'>
print(B.__bases__)  # (<class '__main__.A'>, <class '__main__.C'>)
print(B.__class__)  # <class 'type'>
print(B.__mro__)    # (<class '__main__.B'>, <class '__main__.A'>, <class 'object'>)
print(B.__dict__)   # {'__module__': '__main__', 'a': <function B.a at 0x0000021440882840>, '__doc__': 'B in A'}
print(b.__dict__)   # {'b': 1, 'c': 2}

```
```
__init__(self,...)	 初始化对象，在创建新对象时调用
 __del__(self)	 释放对象，在对象被删除之前调用
 __new__(cls,*args,**kwd)	 实例的生成操作
 __str__(self)	 在使用print语句时被调用
 __getitem__(self,key)	 获取序列的索引key对应的值，等价于seq[key]
 __len__(self)	 在调用内联函数len()时被调用
 __cmp__(stc,dst)	 比较两个对象src和dst
 __getattr__(s,name)	 获取属性的值
 __setattr__(s,name,value)	 设置属性的值
 __delattr__(s,name)	 删除name属性
 __getattribute__()	 __getattribute__()功能与__getattr__()类似
  __call__(self,*args)	 把实例对象作为函数调用
```

没看完的内容
* https://my.oschina.net/motaixian/blog/290064
* http://www.pulpcode.cn/2016/05/28/python-class-bulidin-method/
