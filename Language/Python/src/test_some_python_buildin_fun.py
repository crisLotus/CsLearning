#!/usr/bin/env python3


import tools
import functools


@tools.test_n_times_timer(1000000)
def f(x):
    return x % 2 != 0 and x % 3 != 0


if __name__ == '__main__':
    print(list(filter(lambda x:x, ['a', '', 'b', '', ' '])))
