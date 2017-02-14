# -*- coding:utf-8 -*-
try:
    from unittest import mock
except ImportError:
    import mock


def print_hello(*args):
    print("Hello world")
    return 43


def main():
    m = mock.Mock()
    m.some_method.return_value = 43
    m.some_method.side_effect = print_hello
    m.some_method()
    m.some_method()
    print(m.some_method.call_count)


def test():
    m = mock.Mock()
    m.some_me.side_effect = print_hello
    m.some_me('foo', 'bar')
    m.some_me.assert_called_once_with('foo', 'b')


if __name__ == '__main__':
    test()
