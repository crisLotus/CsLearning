[检测Python程序执行效率及内存和CPU使用的7种方法](http://python.jobbole.com/80754/)

* 装饰器
```
import time
import functools

def fn_timer(function):
    @functools.wraps(function)
    def function_timer(*args, **kwargs):
        t0 = time.time()
        result = function(*args, **kwargs)
        t1 = time.time()
        print ("Total time running %s: %s seconds" %
                (function, str(t1-t0))
                )
        return result
    return function_timer

@fn_timer
def p():
    ni = 0
    for i in range(100000):
        ni += i
if __name__ == '__main__':
    p()
```
* timeit
* linux time time -p python timing_functions.py
* python -m cProfile -s cumulative <模块名.py>
