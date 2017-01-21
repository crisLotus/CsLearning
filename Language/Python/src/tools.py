# 基本debug decorate
import functools
import logging
import sys
import time


format_str = '%(asctime)s %(name)-12s %(levelname)-8s %(message)s'
logging.basicConfig(stream=sys.stderr, level=logging.DEBUG,
                    format=format_str)


def debug(func):
    @functools.wraps(func)
    def logger(*args, **kw):
        logging.debug("before")
        result = func(*args, **kw)
        logging.debug("after")
        return result
    return logger


# 每个函数一个debug decorate
def debug_per_func(func):
    @functools.wraps(func)
    def logger(*args, **kw):
        log = logging.getLogger(func.__name__)
        log.debug("call(%r, %r)", args, kw,)
        result = func(*args, **kw)
        log.debug('result %r', result)
        return result
    return logger


# 规定一个日志，debug decorate
def debug_named(logger_name):
    def wrapped(func):
        @functools.wraps(func)
        def logger(*args, **kw):
            log = logging.getLogger(logger_name)
            result = func(*args, **kw)
            log.debug("%r(%r, %r) return:%r", func.__name__, args, kw,result)

            return result
        return logger
    return wrapped


def time_it(func):
    @functools.wraps(func)
    def function_timer(*args, **kwargs):
        t0 = time.time()
        result = func(*args, **kwargs)
        t1 = time.time()
        logging.debug('['+func.__name__+'] run time:' + str(t1-t0))
        return result
    return function_timer


# 带参数的任意次数装饰器
def test_n_times_timer(times):
    def test_n_timer(func):
        @functools.wraps(func)
        def function_timer(*args, **kwargs):
            t0 = time.time()
            result = None
            for i in range(times):
                result = func(*args, **kwargs)
            t1 = time.time()
            logging.debug('['+func.__name__+'] run '+ str(times) + ' times time ' + str(t1-t0))
            return result
        return function_timer
    return test_n_timer
