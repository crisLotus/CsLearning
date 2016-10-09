[SQLAlchemy orm](http://blog.csdn.net/pi9nc/article/details/39118921)
![SQLAlchemy](http://images.cnblogs.com/cnblogs_com/booolee/WindowsLiveWriter/SQLAlchemy_D760/image_thumb.png)
[SQLAlchemy教程](http://blog.csdn.net/pi9nc/article/details/39118921)

插入数据：
```
def s_insert():
    u = User()
    u.id = '111111'
    u.name = 'yiyiyi'
    session.add(u)
    session.flush()
    session.commit()
```
