#! -*- coding:utf-8 -*-
import collections.abc
i = 20


class TestFun:
    """Doc String

    test class bases magic attrabute.

    Usage::

        >>> t = TestFun()
        >>> print(t.__class__)
        <class '__main__.TestFun'>
        >>> print(t.__module__)
        __main__
        >>> print(t.__dict__)
        {'i': 10}

    """
    def __init__(self):
        self.i = 10

    def print(self):
        pass

    def __str__(self):
        return str(self.__dict__)


class SomeAppClass(collections.abc.Callable):
    def __call__(self, *args, **kwargs):
        pass


class IterTest:
    def __init__(self):
        self.list = list([1,2,3,4,5,6,7,8])
    def __iter__(self):
        for i in self.list:
            yield i
    def __str__(self):
        return str(type(self)) + ' ' +self.__class__.__name__+ ' '+str(self.__dict__)


def main():
    print(str(IterTest()))
    t = iter(IterTest())
    print(next(t),next(t),next(t),next(t))


if __name__ == '__main__':
    main()

    # import doctest
    # doctest.testmod()
