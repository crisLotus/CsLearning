import uuid
import datetime
from db import *
"""requirements.txt
pymysql
"""

def genaratorUUID1():
    return str(uuid.uuid1()).replace("-", '')

def test_genaratorUUID1():
    tmp = genaratorUUID1()
    print(tmp)
    print(len(tmp))

def generator_data():
    database.connect()

    for i in range(100):
        uuid_one = genaratorUUID1()
        username = uuid_one[:10]+"@qq.com"
        password = uuid_one[10:]
        user = Users.create(id=uuid_one, username=username, password=password, reg_time=datetime.datetime.now())
        user.save()
        print(user.id, user.username)
        for j in range(1000):
            uuid_text = genaratorUUID1()
            text = 'text:'+uuid_text+uuid_text
            text = Text.create(blog=uuid_text, text=text, user=user)
            text.save()
            print(text.blog, text.text)
    # print(uuid_one)
    # print(username)
    # print(password)
    # print(text)


if __name__ == '__main__':
    generator_data()
