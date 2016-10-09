import requests
import re

def get_stu_info(content):
    pattern = re.compile(r"号</td><td width='133'>(.+?)<br></td>.+名</td><td colspan='2'>(.+?)<br></td>.+专业</td><td>(.+?)<br></td>")
    v = pattern.search(content)
    return v.group(1), v.group(2), v.group(3)

def run(cookies):
    cookies = {
        'ASP.NET_SessionId': 'uvhvvt55zryc1km4nncp5uvl',
    }
    response = requests.get('http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo_RPT.aspx',
        cookies = cookies,
        headers = {'Host': 'bkjw.sxu.edu.cn','Referer': 'http://bkjw.sxu.edu.cn/xsxj/Stu_MyInfo.aspx'},
        #proxies = {'http': 'http://127.0.0.1:8080'}
    )
    stuid, stuname, stumajor = get_stu_info(response.text)
    print('%s %s %s ' %(stuid, stuname, stumajor))

if __name__ == '__main__':
    run(input('input session id'))
