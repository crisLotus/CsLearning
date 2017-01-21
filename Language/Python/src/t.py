#! -*- coding:utf-8 -*-
import sys
import argparse

def test():
    """DocStrings

    测试文档字符串

    Usage:
        >>> test()

    test() -> results

    ...

    :param:
    :return:
    """
    pass


def test2(a, b, c,):
    """

    :param a:
    :param b:
    :param c:
    :return:
    """
    return None


class Test:
    """

    """
    def __init__(self, a, b, c):
        """

        :param a:
        :param b:
        :param c:
        """
        pass

    def run(self, a, b, c):
        """

        :param a:
        :param b:
        :param c:
        :return:
        """
        pass

if __name__ == "__main__":
    print(sys.argv[1], len(sys.argv))
    for i in range(len(sys.argv)):
        pass
        # print(sys.argv.pop(0), end=' ')
    parser = argparse.ArgumentParser(description='SimulateParser')
    config = parser.add_argument('-v', '-verbose', action='store_true', default=False)
