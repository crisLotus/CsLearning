# -*- coding:utf-8 -*-
import time
import multiprocessing

from threading import Thread


class CountdownTask:
    def __init__(self):
        self._running = True

    def terminate(self):
        self._running = False

    def run(self, n):
        while self._running and n > 0:
            print('T-minus', n)
            n -= 1
            time.sleep(1)


def test():
    t = Thread(target=CountdownTask().run, args=(5,))
    t.start()
    while t.is_alive():
        print('Still running')
        time.sleep(1)
    print('Completed')


def test2():
    c = CountdownTask()
    p = multiprocessing.Process(target=c.run, args=(5,))
    p.start()


if __name__ == '__main__':
    test2()
