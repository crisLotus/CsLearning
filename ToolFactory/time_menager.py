#! -*- coding:utf-8 -*-

import sys
import csv
import datetime


class Note:

    def __init__(self, filename='tmp_note.csv'):
        """
        时间管理工具

        Usage:
            note = Note()
            note.start('学习')
            note.stop()

        :param filename: 数据库文件
        """
        self.filename = filename
        self.task = list()

    def _read(self):
        """
        读取数据库文件后，更新所有任务列表self.task

        :return: 返回数据库文件中所有的任务
        """
        self.task = list()
        try:
            with open(self.filename, 'r', encoding='utf8', newline='') as f:
                csvfile = csv.reader(f)
                for row in csvfile:
                    self.task.append(row)
        except:
            with open(self.filename, 'w+', encoding='utf8', newline=''):
                pass
        return self.task

    def _write(self,start_of_stop, active_type='未分类'):
        """

        :param start_of_stop: start of stop
        :param active_type: 比如 学习
        :return: 当前开始的任务
        """
        tmp_task = [datetime.datetime.now(), active_type, start_of_stop]
        with open(self.filename, 'a+',encoding='utf8',newline='') as f:
            csvfile = csv.writer(f)
            csvfile.writerow(tmp_task)
        return tmp_task

    def start(self, active_type):
        """

        :param active_type: 活动种类
        :return:返回刚刚的任务，方便回显
        """
        task = None
        tasks = self._read()
        if (not tasks) or (not self._is_start()):
            task = self._write('start', active_type)
        return task

    def stop(self):
        self._read()
        task = None
        active = self._get_last_task()
        if self._is_start():
            task = self._write('stop', active[1])
        return task

    def _get_start(self, task):
        return task[2]
    def _is_start(self):
        return self._get_start(self._get_last_task()) == 'start'
    def _get_last_task(self):
        return self.task[-1]


def user_interface():
    print(
        """
Usage:
    time_menager.py start 学习
    time_menager.py stop
        """
    )


def main(filename='test.csv'):
    length = len(sys.argv)
    s = sys.argv
    note = Note(filename)
    if length <= 1:
        user_interface()
        opt = input("start or stop")
        if opt == 'start':
            t = note.start(input("什么任务："))
            print('start',t)
            return t
        elif opt == 'stop':
            t = note.stop()
            print('stop',t)
            return t
        else:
            print("Error!!!")
            user_interface()
        return
    
    if s[1] == 'start':
        t = note.start(sys.argv[2])
        print('start',t)
        return t
    elif s[1] == 'stop':
        t = note.stop()
        print('stop',t)
        return t
    else:
        print("Error!!!")
        user_interface()


if __name__ == '__main__':
    # note = Note()
    # note.start('学习')
    # note.stop()
    # print(note.read())
    main(r'D:\SoftWare\Tools\TimeMenage.csv')
