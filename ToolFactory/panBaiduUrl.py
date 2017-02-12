# coding:utf-8
import sys
import re
import gzip
import requests
import urllib.request


def main(baidu_url):
    pattern = re.compile(r'<strong jscontent="failedUrl" jstcache="16">(.?)</strong>')
    result = re.search(pattern, get_containt(baidu_url))
    return result


def get_containt(baidu_url):
    headers = {'user-agent': 'Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405'}
    r = requests.get(baidu_url, headers=headers)
    # data = r.text.encode(r.encoding).decode('utf-8', 'replace')
    data = r.text.encode(r.encoding).decode('gb2312', 'ignore')
    # with open('tmp.html', 'w') as f:
    #     f.write(data)
    return data


if __name__ == '__main__':
    # print(main(r'http://pan.baidu.com/share/link?uk=991096219&shareid=1828434964'))
    print(get_containt(r'http://pan.baidu.com/share/link?uk=991096219&shareid=1828434964'))  
