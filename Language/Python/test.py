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
    pass


def main():
    assert(False)


if __name__ == '__main__':
    main()

    # import doctest
    # doctest.testmod()
