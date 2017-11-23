# Scrapy文档
https://scrapy-chs.readthedocs.io/zh_CN/1.0/intro/tutorial.html
https://stevenzhao.gitbooks.io/scrapy-chinese/
https://scrapy.org/
# 任务
创建一个Scrapy项目
定义提取的Item
编写爬取网站的 spider 并提取 Item
编写 Item Pipeline 来存储提取到的Item(即数据)

## 创建项目
>>> scrapy startproject <project-name>
## 定义Item
Item 是保存爬取到的数据的容器;
```python
import scrapy

class DmozItem(scrapy.Item):
    title = scrapy.Field()
    link = scrapy.Field()
    desc = scrapy.Field()
```
一开始这看起来可能有点复杂，但是通过定义item， 您可以很方便的使用Scrapy的其他方法。而这些方法需要知道您的item的定义.

## 创建爬虫
为了创建一个Spider，您必须继承 scrapy.Spider 类， 且定义一些属性:
* name: 用于区别Spider
* start_urls: 包含了Spider在启动时进行爬取的url列表。
* parse() 是spider的一个方法。 被调用时，每个初始URL完成下载后生成的 Response 对象将会作为唯一的参数传递给该函数。 该方法负责解析返回的数据(response data)，提取数据(生成item)以及生成需要进一步处理的URL的 Request 对象。
```python
# 此文件放到tutorial/spiders下
import scrapy

class DmozSpider(scrapy.Spider):
    name = "dmoz"
    allowed_domains = ['douban.com']
    start_urls = [
        "https://www.douban.com/",
    ]

    def parse(self, response):
        filename = response.url.split("/")[-2] + '.html'
        with open(filename, 'wb') as f:
            f.write(response.body)
```

## 爬取
>>> scrapy crawl dmoz

## 提取Item
### Selectors选择器
基于 XPath 和 CSS 表达式机制: Scrapy Selectors;
[xpath](http://plasmasturm.org/log/xpath101/):例子
* /html/head/title: 选择HTML文档中 <head> 标签内的 <title> 元素
* /html/head/title/text(): 选择上面提到的 <title> 元素的文字
* //td: 选择所有的 <td> 元素
* //div[@class="mine"]: 选择所有具有 class="mine" 属性的 div 元素

Selector有四个基本的方法(点击相应的方法可以看到详细的API文档):
* xpath(): 传入xpath表达式，返回该表达式所对应的所有节点的selector list列表 。
* css(): 传入CSS表达式，返回该表达式所对应的所有节点的selector list列表.
* extract(): 序列化该节点为unicode字符串并返回list。
* re(): 根据传入的正则表达式对数据进行提取，返回unicode字符串list列表。

>>> scrapy shell "exfly.github.io"
TODO: response 拥有一个 selector 属性, 该属性是以该特定 response 初始化的类 Selector 的对象。 您可以通过使用 response.selector.xpath() 或 response.selector.css() 来对 response 进行查询。 此外，scrapy也对 response.selector.xpath() 及 response.selector.css() 提供了一些快捷方式, 例如 response.xpath() 或 response.css()

### 使用item
## 追踪链接
一种常见的方法是,回调函数负责提取一些item,查找能跟进的页面的链接, 并且使用相同的回调函数yield一个 Request
[另一种需求是在多个页面构建Item](https://scrapy-chs.readthedocs.io/zh_CN/1.0/topics/request-response.html#topics-request-response-ref-request-callback-arguments)
## 保存爬取到的数据

>>> scrapy crawl dmoz -o items.json


# [scrapy命令](https://scrapy-chs.readthedocs.io/zh_CN/1.0/topics/commands.html)
```
scrapy startproject myproject 创建项目

全局命令:
scrapy startproject <project_name>
settings
scrapy runspider <spider_file.py> 在未创建项目的情况下，运行一个编写在Python文件中的spider。
scrapy shell [url] 以给定的URL(如果给出)或者空(没有给出URL)启动Scrapy shell
scrapy fetch <url> 使用Scrapy下载器(downloader)下载给定的URL，并将获取到的内容送到标准输出
scrapy view <url> 在浏览器中打开给定的URL，并以Scrapy spider获取到的形式展现。 
version

项目(Project-only)命令:
scrapy crawl <spider> 使用spider进行爬取。
scrapy check [-l] <spider> 运行contract检查
scrapy list 列出当前项目中所有可用的spider
edit
scrapy parse <url> [options] 获取给定的URL并使用相应的spider分析处理
genspider
scrapy bench 运行benchmark测试,测试本地机器的最大爬取效率

```
