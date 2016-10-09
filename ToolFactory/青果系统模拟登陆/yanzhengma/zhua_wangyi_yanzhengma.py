'# -*- coding:utf-8 -*-'
'''
抓网易的验证码
'''
import requests
import base64
import encryption
from random import Random
def random_str(randomlength=8):
    """
    随机字符串生成函数

    :auth: Exborn
    :param randomlength:
    :return: 随机的字符串
    """
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str+=chars[random.randint(0, length)]
    return str

def get_va_code_img(code, n=1):
    for i in range(n):
        response = requests.get(code)
        leniystr = str(base64.b64encode(response.content).decode("utf-8", "ignore"))
        imgData = base64.b64decode(leniystr)
        filename = './code/{0}.jpg'.format(random_str())
        leniyimg = open(filename, 'wb')
        print('img:' + filename)
        leniyimg.write(imgData)
        leniyimg.close()

# print('{0}.{1}.{2}.{3}'.format('1','2','3','4'))
if __name__ == '__main__':
    code = 'http://reg.email.163.com/unireg/call.do?cmd=register.verifyCode&v=common/verifycode/vc_en&vt=mobile_acode&t=1475629873386'
    get_va_code_img(code, 100)
