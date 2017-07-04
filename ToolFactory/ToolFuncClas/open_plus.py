# coding:utf-8
"""
自动获得文件编码方式，并创建文件句柄
"""
import codecs
import chardet


def file_encoding(filename):
    with open(filename, 'rb') as f:
        return chardet.detect(f.read())['encoding']


def open_plus(filename, method):
    encoding = file_encoding(filename)
    return open(filename, method, encoding=encoding)


def main():
    string = ''
    for i in range(1,15):
        string += open_plus(r'test/{}.txt'.format(i), 'r').read()
    print(string)
    # with open('tmp.txt','w', encoding="utf8") as f:
    #     f.write(string)


if __name__ == '__main__':
    main()
