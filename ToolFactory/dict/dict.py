# -*- coding:utf-8 -*-

import re
import sys
import requests
import sys
import urllib.parse

class Dict:

    def __init__(self, word):
        self.word = urllib.parse.quote(word)
        print(self.word)
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
        page = self.getPage()
        result = re.search(pattern, page)
        if result:
        #print result.group(1)  #测试输出
            self.result = result.group(1).strip().replace('<span>', '').replace('</span>', '').replace(' ', '').replace('；', '')
        # else:
        elif None:
            # TODO: 翻译句子
            # TODO: 翻译中文单词
            # TODO: 翻译中文句子
            pattren = re.compile(r'<div style="width: 580px; margin-top: 15px; font-size: 15px; line-height: 24px; color: #333333;">(.+)</div>')
            result = re.search(pattren, page)
            self.result = result.group(1)
        return self.result

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


def test():
    print(Dict('The official home of the Python Programming Language.').icibaGetPage())

if __name__ == '__main__':
    main()
    # test()
