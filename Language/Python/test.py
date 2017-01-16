#! -*- coding:utf-8 -*-
import json
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


def main():
    t = TestFun()
    print(id(t))
    print(hash(t))
    print(str(t))
    list()


if __name__ == '__main__':
    main()

    import doctest
    doctest.testmod()
