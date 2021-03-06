# [python标准库文档-特殊方法](https://docs.python.org/3.3/reference/datamodel.html) [python特殊方法](http://www.ttlsa.com/docs/dive-into-python3/special-method-names.html)
* __new__()
* __init__()
* __repr__(), __str__(), __format__() == repr(), str(), format()
* __hash__()
* __bool__()
* __getattr__ 获取一个计算属性    x.my_property   x.__getattr__('my_property')
* __setattr__ 设置某属性   x.my_property = value   x.__setattr__('my_property', value)
* __delattr__ 删除某属性   del x.my_property   x.__delattr__('my_property')
* __getitem__ 通过键来获取值 x[key]  x.__getitem__(key)
* __setitem__ 通过键来设置值 x[key] = value  x.__setitem__(key, value)
* __delitem__ 删除一个键值对 del x[key]  x.__delitem__(key)
* __missing__ 为缺失键提供默认值   x[nonexistent_key]  x.__missing__(nonexistent_key)
* __call__ 像调用函数一样“调用”一个实例 my_instance()   my_instance.__call__()
* __contains__ 了解某序列是否包含特定的值 x in seq    seq.__contains__(x)
* __len__ 序列的长度   len(seq)    seq.__len__()
* __enter__ 在进入 with 语块时进行一些特别操作    with x: x.__enter__()
* __exit__ 在退出 with 语块时进行一些特别操作    with x: x.__exit__()
* __iter__ 生成iter对象
* __next__ 
* __slots__ 限制属性的数量

# __new__()
```
1. 创建内置不可变子类
class Float_units(float):
    def __new__(cls, value, unit):
        obj = super().__new__(cls, value)
        obj.unit = unit
        return obj
2. 元类型
Useless = type("Useless", (), {})
class Ordered_Attr(type):
    @classmethod
    def __prepare__(metacls, name ,bases, **kwds):
        return collections.orderedDict()
    def __new__(cls, name, bases, namespace, **kwds):
        result = super().__new__(cls, name, bases, namespace)
        result._order = tuple(n for n in namespace if not n.startswith('__'))
        return result

class Ordered_Preserved(metaclass=Ordered_Attr):
    pass
```
