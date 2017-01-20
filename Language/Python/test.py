#! -*- coding:utf-8 -*-
import sys
import argparse

if __name__ == "__main__":
    print(sys.argv[1], len(sys.argv))
    for i in range(len(sys.argv)):
        pass
        # print(sys.argv.pop(0), end=' ')
    parser = argparse.ArgumentParser(description='SimulateParser')
    config = parser.add_argument('-v', '-verbose', action='store_true', default=False)
