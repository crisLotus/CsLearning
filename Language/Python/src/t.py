#! -*- coding:utf-8 -*-
import sys
import argparse
import tools
import timeit

@tools.test_n_times_timer(10000)
def func_code():
    a = 1 + 2
    return a


if __name__ == "__main__":
    # 测试命令行输入
    #print(sys.argv[0], len(sys.argv))
    for i in range(len(sys.argv)):
        pass
        # print(sys.argv.pop(0), end=' ')
    parser = argparse.ArgumentParser(description='SimulateParser')
    config = parser.add_argument('-v', '-verbose', action='store_true', default=False)

    fun = lambda a,b,c: 1 if a else 0
    fun(5,1,1)

    func_code()
