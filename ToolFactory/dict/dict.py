# -*- coding:utf-8 -*-

import re
import urllib.request

class Dict:

    def __init__(self, word):
        self.word = word
        self.result = "None"
        self.url = "None"

    def getPage(self):
        pass

    def icibaGetPage(self):
        try:
            url = 'http://www.iciba.com/'+self.word
            data = urllib.request.urlopen(url).read().decode('UTF-8')
        except Exception:
            print("?")
        return data

    def youdaoGetPage(self):
        pass

    def getResult(self):
        pass

    def run(self):
        return self.icibaGetPage()


if __name__ == '__main__':
    t = Dict('test').run()
    print(t)
    # test(r'http://www.iciba.com/test')
