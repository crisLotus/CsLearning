# coding:utf-8
# class A:
#     def a(self):
#         pass
#     def aa(self):
#         pass
# class C:pass
# class B(A, C):
#     """B in A"""
#     def a(self):
#         self.b = 0
# b = B()
# b.b = 1
# b.c = 2
# print(B.__base__)   # <class '__main__.A'>
# print(B.__bases__)  # (<class '__main__.A'>, <class '__main__.C'>)
# print(B.__class__)  # <class 'type'>
# print(B.__mro__)    # (<class '__main__.B'>, <class '__main__.A'>, <class 'object'>)
# print(B.__dict__)   # {'__module__': '__main__', 'a': <function B.a at 0x0000021440882840>, '__doc__': 'B in A'}
# print(b.__dict__)   # {'b': 1, 'c': 2}
# '__class__',
# '__delattr__',
# '__dict__',
# '__dir__',
# '__doc__',
# '__eq__',
# '__format__',
#  '__ge__',
#  '__getattribute__',
#  '__gt__',
#  '__hash__',
#  '__init__',
#  '__le__',
#  '__lt__',
#  '__module__',
#  '__ne__',
#  '__new__',
#  '__reduce__',
#  '__reduce_ex__',
#  '__repr__',
#  '__setattr__',
#  '__sizeof__',
#  '__str__',
#  '__subclasshook__',
#  '__weakref__'
#
# class a:pass
# a.__class__
