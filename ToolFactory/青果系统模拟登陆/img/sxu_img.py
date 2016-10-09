# -*- coding:utf-8 -*-

import requests
import base64


xuehao = ''

def get_img(xuehao='', path='./'):
    imgUrl = 'http://myportal.sxu.edu.cn/attachmentDownload.portal?notUseCache=true&type=userPhoto&ownerId={0}'.format(xuehao)
    cookie = dict(
        JSESSIONID='0000SBn08gPboUqg43Tj76U3Ls3:16nljukd0',
        iPlanetDirectoryPro='AQIC5wM2LY4Sfczkh%2Fd8gHDSINB5cUqMhh5LpdmnsMtnk6s%3D%40AAJTSQACMDI%3D%23'
    )
    print("Download Image File=" + xuehao)
    r = requests.get(imgUrl, stream=True,cookies=cookie) # here we need to set stream = True parameter
    filename = './{0}/{1}.jpg'.format(path,xuehao)
    with open(filename, 'wb') as f:
        for chunk in r.iter_content(chunk_size=1024):
            if chunk: # filter out keep-alive new chunks
                f.write(chunk)
                f.flush()
        f.close()
    print(filename)
    return xuehao

if __name__ == '__main__':
    get_img('2014083004', 'img')
