# -*- coding:utf-8 -*-
import functools
if __name__ == '__main__':

    print('filter', list(filter(lambda x:x>3, [1,2,3,4,5,6,7])))
    print('map', list(map(lambda x,y:x*y, [1,2,3,4,5,6,7,8],[3,4,5,6,7,8,9,10])))
    print('reduce', functools.reduce(lambda x, y : x + y, [1,2,3,4,5,6,7,8]))
    plus = lambda x, y: x + y
    print('reduce', functools.reduce(lambda x, y: x + y, [1,2,3,4,5]))
    print('reduce', functools.reduce(lambda x, y : x + y, [1,2,3,4,5,6,7,8]))
    