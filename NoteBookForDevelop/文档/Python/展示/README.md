Python 语言特性 适用场景 演示 版本 常用工具 （爬虫 机器学习 数据可视化 维护）

# 语言特性
* https://l1nwatch.gitbooks.io/interview_exercise/content/Python%20%E8%AF%AD%E8%A8%80%E7%89%B9%E6%80%A7/readme.html
* https://github.com/taizilongxu/interview_python

```python
# list tuple set dict
def makeitalic(fn):
    def wrapped():
        return "<i>" + fn() + "</i>"
    return wrapped

@makeitalic
def noarg():
    return "noarg"

def maplist(a="a", b="b"):
    print(a, b)


print(maplist(b="c"))
print(noarg())

# 鸭子类型
class A:
    def prin(self):
        print("A")
class B:
    def prin(self):
        print("B")
a = A()
b = B()
def prin(ar):
    ar.prin()
prin(a)
prin(b)

# 列表推到是
d = [val for val in  range(10)]
print(d)
# 字典推导式
d = {key: value for (key, value) in {"tk":"tv", "dk":"dv"}}
print(d)


"""Train a model to classify Foos and Bars.

description:

Usage::

    >>> t()
    t

:param train_data: A list of tuples of the form ``(color, label)``.
:param param1: an instance of :class:"ClassA"
:rtype: A :class:`Classifier <Classifier>`
"""
def t():
    print("t")

```

# 使用场景
* 运维 Ansible Fabric
* web
* 游戏
* linux系统构建 https://github.com/torvalds/linux/tree/master/scripts
* 数据科学
* 胶水
* 安全

# 演示

# 版本
python2.7 python3.7
[官网](https://www.python.org/)

# 爬虫
* requests
* Scrapy

# 机器学习
sklearn
pandas
Matplotlib
TensorFlow

# 数据可视化
https://www.kaggle.com/c/titanic/kernels?sortBy=voteCount&group=everyone&pageSize=20&language=Python&competitionId=3136&kernelType=Notebook

https://www.kaggle.com/arthurtok/introduction-to-ensembling-stacking-in-python

https://www.kaggle.com/arthurtok/introduction-to-ensembling-stacking-in-python

https://www.kaggle.com/omarelgabry/a-journey-through-titanic

https://www.kaggle.com/startupsci/titanic-data-science-solutions

# 常用工具
* pycharm
* cmder
* anaconda
* sublime text

# 资源
* [编程小白](http://www.ituring.com.cn/book/1863)
* [awesome-python](https://github.com/vinta/awesome-python)
* [kaggle](https://www.kaggle.com/)
