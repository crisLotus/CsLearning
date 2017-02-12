# -*- coding:utf-8 -*-

import re
import sys
import requests
import sys

class Dict:

    def __init__(self, word):
        self.word = word
        self.result = None
        self.url = None

    def getPage(self):
        result = self.icibaGetPage()
        return result

    def icibaGetPage(self):
        data = None
        try:
            url = 'http://www.iciba.com/'+self.word
            data = requests.get(url)
            data = data.text.encode(data.encoding).decode('utf-8')
        except Exception as e:
            print(sys.exc_info())
        return data

    def youdaoGetPage(self):
        pass

    def getResult(self):
        pattern = re.compile('<span class='+'"'+'prop'+'"'+'>.*?</span>.*?<p>(.*?)</p>',re.S)
        result = re.search(pattern, self.getPage())
        if result:
        #print result.group(1)  #测试输出
            self.result = result.group(1).strip().replace('<span>', '').replace('</span>', '').replace(' ', '').replace('；', '')
            return self.result
        else:
            return None

    def run(self):
        return self.getResult()


helps = (
"""\
Useage:
    python dict.py <word>\
""")


def main():
    if len(sys.argv) > 1:
        word = sys.argv[1]
        t = Dict(word).run()
        print(t)
    else:
        print(helps)


if __name__ == '__main__':
    main()