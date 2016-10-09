# -*- coding: utf-8 -*-
import requests
import base64
import re
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


def get_encrypt_code(stuid, passwd, captcha):

    # 密码和验证码的加密处理,参考js
    #var s=md5(document.all.txt_asmcdefsddsd.value+md5(obj.value).substring(0,30).toUpperCase()+'10108').substring(0,30).toUpperCase();
    #var s=md5(md5(obj.value.toUpperCase()).substring(0,30).toUpperCase()+'10108').substring(0,30).toUpperCase();
    import hashlib
    # 验证码处理
    m = hashlib.md5()
    m.update(captcha.encode().upper())
    m5 = m.hexdigest()
    m = hashlib.md5()
    m.update((m5[:30].upper() + '10108').encode())
    captcha_md5 = m.hexdigest()[:30].upper()
    #密码处理
    m = hashlib.md5()
    m.update(passwd.encode())
    m5 = m.hexdigest()
    m = hashlib.md5()
    m.update((stuid + m5[:30].upper() + '10108').encode())
    passwd_md5 = m.hexdigest()[:30].upper()
    return passwd_md5, captcha_md5


def get_stu_info(content):
    pattern = re.compile(r"号</td><td width='133'>(.+?)<br></td>.+名</td><td colspan='2'>(.+?)<br></td>.+专业</td><td>(.+?)<br></td>")
    v = pattern.search(content)
    return v.group(1), v.group(2), v.group(3)


class ShanxiU(object):
    def __init__(self, stuid='', password='', cookie=''):
        self.stuid = stuid
        self.password = password
        self.cookie = cookie
        self.response = ''
    def get_yanzhengma(self):
        self.response = requests.get('http://bkjw.sxu.edu.cn/_data/login.aspx',
                                # proxies = {'http': 'http://127.0.0.1:8080'}
                                )

        sessionid = self.response.cookies.get('ASP.NET_SessionId')
        self.cookie = {
            'ASP.NET_SessionId': sessionid,
        }
        self.response = requests.get("http://bkjw.sxu.edu.cn/sys/ValidateCode.aspx",
                            cookies=self.cookie,
                            headers={
                                'Referer': 'http://bkjw.sxu.edu.cn/_data/login.aspx',
                                'Host': 'bkjw.sxu.edu.cn'
                            },
                            # proxies = {'http': 'http://127.0.0.1:8080'}
                            )
        leniystr = str(base64.b64encode(self.response.content).decode("utf-8", "ignore"))
        imgData = base64.b64decode(leniystr)
        img_name = 'code\\' + random_str() + '.jpg'
        # print(img_name)
        leniyimg = open(img_name, 'wb')
        leniyimg.write(imgData)
        leniyimg.close()

        import jo
        try:
            ma = jo.jo(img_name)
        except:
            ma = ''
        return ma

    def login(self):
        stuid = self.stuid
        passwd = self.password
        captcha = self.get_yanzhengma()
        passwd_encrpyt, captcha_encrpt = get_encrypt_code(stuid, passwd, captcha)
        cookies = self.cookie
        stat = self.response.cookies.get('__VIEWSTATE')
        # print(stat)
        data = {
            '__VIEWSTATE': stat,
            'pcInfo': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0Intel Mac OS X 10.115.0 (Macintosh) SN:NULL',
            'txt_asmcdefsddsd': stuid,
            # 密码密文
            'dsdsdsdsdxcxdfgfg': passwd_encrpyt,
            # 验证码
            'fgfggfdgtyuuyyuuckjg': captcha_encrpt,
            'Sel_Type': 'STU',
            'typeName': '学生'
        }

        self.response = requests.post('http://bkjw.sxu.edu.cn/_data/login.aspx',
                                 data=data,
                                 cookies=cookies,
                                 headers={
                                     'Host': 'bkjw.sxu.edu.cn',
                                     'Referer': 'http://bkjw.sxu.edu.cn/_data/login.aspx'
                                 },
                                 # proxies = {'http': 'http://127.0.0.1:8080'}
                                 )
        # print(response.text)
        if '帐号或密码不正确' in self.response.text:
            print('账号或密码不正确')
            exit()
        elif '验证码错误' in self.response.text:
            print('验证码错误')
            exit()
        elif '权限' not in self.response.text:
            print('未知错误')
            exit()

    def get_sxu_stu_info(self):
        self.response = requests.get(
            'http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo_RPT.aspx',
            cookies=self.cookie,
            headers={'Host': 'bkjw.sxu.edu.cn',
                     'Referer': 'http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo.aspx'},
            # proxies = {'http': 'http://127.0.0.1:8080'}
        )
        # print(response.text)

        stuid, stuname, stumajor = get_stu_info(self.response.text)
        print('%s %s %s ' % (stuid, stuname, stumajor))


def get_yanzhengma(num=1):
    s = ShanxiU()
    for i in range(num):
        s.get_yanzhengma()
        print(i)


def get_info_sxu(stuid, paswd):
    sxu = ShanxiU(stuid, paswd)
    sxu.login()
    sxu.get_sxu_stu_info()


if __name__ == '__main__':
    stuid = input("学号：")
    paswd = input("密码：")
    get_info_sxu(stuid, paswd) # 增量遍历 '{:02d}'.format(i)： 00 01 02 ...


# response = requests.get('http://bkjw.sxu.edu.cn/_data/login.aspx',
#                         #proxies = {'http': 'http://127.0.0.1:8080'}
#                         )
# sessionid = response.cookies.get('ASP.NET_SessionId')
# response = requests.get("http://bkjw.sxu.edu.cn/sys/ValidateCode.aspx",
#                             cookies = {
#                                 'ASP.NET_SessionId': sessionid
#                             },
#                             headers = {
#                                 'Referer': 'http://bkjw.sxu.edu.cn/_data/login.aspx',
#                                 'Host': 'bkjw.sxu.edu.cn'
#                             },
#                             #proxies = {'http': 'http://127.0.0.1:8080'}
#                         )
# leniystr = str(base64.b64encode(response.content).decode("utf-8","ignore"))
# imgData = base64.b64decode(leniystr)
# leniyimg = open('imgout.jpg','wb')
# leniyimg.write(imgData)
# leniyimg.close()
#
# stuid = '2014083004'
# passwd = '992122833'
# captcha = input("验证码：")
# passwd_encrpyt, captcha_encrpt = get_encrypt_code(stuid, passwd, captcha)
# cookies = {
#     'ASP.NET_SessionId': sessionid,
# }
# stat = response.cookies.get('__VIEWSTATE')
# # print(stat)
# data = {
#     '__VIEWSTATE': stat,
#     'pcInfo': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0Intel Mac OS X 10.115.0 (Macintosh) SN:NULL',
#     'txt_asmcdefsddsd': stuid,
#     # 密码密文
#     'dsdsdsdsdxcxdfgfg': passwd_encrpyt,
#     # 验证码
#     'fgfggfdgtyuuyyuuckjg': captcha_encrpt,
#     'Sel_Type': 'STU',
#     'typeName': '学生'
# }
#
# response = requests.post('http://bkjw.sxu.edu.cn/_data/login.aspx',
#                          data = data,
#                          cookies = cookies,
#                          headers = {
#                             'Host': 'bkjw.sxu.edu.cn',
#                             'Referer': 'http://bkjw.sxu.edu.cn/_data/login.aspx'
#                          },
#                          #proxies = {'http': 'http://127.0.0.1:8080'}
# )
# # print(response.text)
# if '帐号或密码不正确' in response.text:
#     print('账号或密码不正确')
# elif '验证码错误' in response.text:
#     print('验证码错误')
# elif '权限' not in response.text:
#     print('未知错误')
#
# response = requests.get('http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo_RPT.aspx',
#                         cookies = cookies,
#                         headers = {'Host': 'bkjw.sxu.edu.cn','Referer': 'http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo.aspx'},
#                         #proxies = {'http': 'http://127.0.0.1:8080'}
#                     )
# # print(response.text)
# stuid, stuname, stumajor = get_stu_info(response.text)
# print('%s %s %s ' %(stuid, stuname, stumajor))



'''
>>> dir(requests)
['ConnectTimeout', 'ConnectionError', 'DependencyWarning', 'FileModeWarning',
'HTTPError', 'NullHandler', 'PreparedRequest', 'ReadTimeout', 'Request',
'RequestException', 'Response', 'Session', 'Timeout', 'TooManyRedirects',
'URLRequired', '__author__', '__build__', '__builtins__', '__cached__',
'__copyright__', '__doc__', '__file__', '__license__', '__loader__', '__name__',
'__package__', '__path__', '__spec__', '__title__', '__version__', 'adapters',
'api', 'auth', 'certs', 'codes', 'compat', 'cookies', 'delete', 'exceptions',
'get', 'head', 'hooks', 'logging', 'models', 'options', 'packages', 'patch', 'post',
 'put', 'request', 'session', 'sessions', 'status_codes', 'structures', 'utils',
  'warnings']
>>> dir(requests.cookies)
['CookieConflictError', 'MockRequest', 'MockResponse', 'Morsel', 'RequestsCookieJar',
'__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__',
'__package__', '__spec__', '_copy_cookie_jar', 'calendar', 'collections',
'cookiejar_from_dict', 'cookielib', 'copy', 'create_cookie', 'extract_cookies_to_jar',
 'get_cookie_header', 'merge_cookies', 'morsel_to_cookie', 'remove_cookie_by_name',
  'threading', 'time', 'urlparse', 'urlunparse']
>>>
'''
'''
<table height="160" cellspacing="0" cellpadding="0" border="0">
					<tbody><tr>
						<td align="center" width="50" height="26">身　份</td>
						<td height="26">
							<select style="WIDTH: 136px;" onchange="SelType(this)" name="Sel_Type">
								<option value="STU" usrid="学　号">学生</option>
<option value="TEA" usrid="工　号">教师教辅人员</option>
<option value="SYS" usrid="帐　号">管理人员</option>
<option value="ADM" usrid="帐　号">门户维护员</option>

							</select>
						</td>
					</tr>
					<tr>
						<td id="UID" align="center" width="50" height="26">学　号</td>
						<td height="26"><input name="txt_asmcdefsddsd" id="txt_asmcdefsddsd" type="text" class="tx1" style="WIDTH: 134px; HEIGHT: 20px;border:1px solid #c1d1e1;background-color:#FEFFFF" maxlength="20" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td nowrap="" id="PWD" align="center" width="50" height="26">密　码</td>
						<td width="120" height="26">
						<input class="tx1" id="txt_pewerwedsdfsdff" style="WIDTH:134px;HEIGHT:20px;border:1px solid #c1d1e1;background-color:#FEFFFF" type="password" maxlength="25" name="txt_pewerwedsdfsdff" autocomplete="off" onblur="chkpwd(this)" onkeyup="chkpwd(this)">
						</td>
					</tr>
					<tr>
						<td align="center" width="50" height="26">验证码</td>
						<td height="26">
						<input class="tx1" onclick="showvc()" onfocus="showvc()" id="txt_sdertfgsadscxcadsads" name="txt_sdertfgsadscxcadsads" style="WIDTH:50px;HEIGHT:20px;margin-bottom:4px;border:1px solid #c1d1e1;background-color:#FEFFFF" maxlength="4" autocomplete="off" onblur="chkyzm(this)" onkeyup="chkyzm(this)">
						<img id="imgCode" src="../sys/ValidateCode.aspx" onclick="changeValidateCode(this)" alt="单击可更换图片！" style="display:none;WIDTH:80px;HEIGHT:20px;CURSOR:pointer;margin:0px;">
						</td>
					</tr>
					<tr>
						<td valign="bottom" align="center" height="26" colspan="2">&nbsp;&nbsp;
						<input class="btnlogin" type="submit" value="">
						<input class="btnforget" style="CURSOR:pointer;" type="button" value="" name="btnGetStuPwd" id="btnGetStuPwd" onclick="openWinLog(&quot;ReSet_PassWord.aspx&quot;,600,300)"><input class="btnreset" name="btnReset" id="btnReset" style="CURSOR:pointer;display:none" type="reset" value="">
						</td>
					</tr>

				</tbody></table>
'''
# http://bkjw.sxu.edu.cn/
'''
身　份
<select style="WIDTH: 136px;" onchange="SelType(this)" name="Sel_Type">
    <option value="STU" usrid="学　号">学生</option>
    <option value="TEA" usrid="工　号">教师教辅人员</option>
    <option value="SYS" usrid="帐　号">管理人员</option>
    <option value="ADM" usrid="帐　号">门户维护员</option>
</select>
'''
'''
学　号
<td id="UID" align="center" width="50" height="26">学　号</td>
<input name="txt_asmcdefsddsd" id="txt_asmcdefsddsd" class="tx1"
'''
'''
密　码
<td nowrap="" id="PWD" align="center" width="50" height="26">密　码</td>
<input class="tx1" id="txt_pewerwedsdfsdff" name="txt_pewerwedsdfsdff" onblur="chkpwd(this)" onkeyup="chkpwd(this)">
'''
'''
验证码
<input class="tx1" onclick="showvc()" onfocus="showvc()" id="txt_sdertfgsadscxcadsads" name="txt_sdertfgsadscxcadsads"
    onblur="chkyzm(this)" onkeyup="chkyzm(this)">
<img id="imgCode" src="../sys/ValidateCode.aspx" onclick="changeValidateCode(this)"
'''
'''
<input class="btnlogin" type="submit" value="">
<input class="btnforget" name="btnGetStuPwd" id="btnGetStuPwd" onclick="openWinLog(&quot;ReSet_PassWord.aspx&quot;,600,300)">
<input class="btnreset" name="btnReset" id="btnReset" type="reset" value="">
'''
