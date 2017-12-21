# 背景调研
* [robots.txt](http: //www.robotstxt. org)爬取该网站有哪些限制
* Sitemap [网站地图 协议](http://www.wuzesheng.com/?p=1075)
* Google site 把检索限制在某个域名下
* WHOIS
* 网站所用的技术 builtwith python-whois
```
import builtwith;builtwith.parse("https://www.baidu.com/")
import whois;who = whois.whois("www.baidu.com")
```
# 爬虫

## 爬虫需要具有的功能
遍历所有页的页面，沿着链接向下爬，失败链接重试，配置代理，user_agent，下载限速，避免爬虫陷阱（记录深度：字典），本地缓存（过期更新，数据库缓存），动态内容，表单交互，并发和分布式

## 网页信息抓取方式
* 正则表达式
* beautiful soup
* **lxml**

# Mongodb
直接下载[Mongodb](http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-v3.4-latest.zip?_ga=2.6967665.2137316399.1513737607-1900905636.1513737607)，在当前项目中启动就好（绿色软件的好处）mongod -dbpath mongocache
pip install pymongo
mongod -dbpath .

# 资源
* scrapy的GUI应用Portia
* Scrapely使用训练数据建立从网页中抓取哪些内容的模型，并在以后抓取相同结构的其他网页时应用该模型
* MechanicalSoup简化表单提交
* [用python写网络爬虫代码](https://github.com/1040003585/WebScrapingWithPython)
* [总是返回http error 500](http://httpstat.us/500)
* [The top 500 sites on the web](https://www.alexa.com/topsites)
* [The top 500 sites on the web dump](http://s3.amazonaws.com/alexa-static/top-1m.csv.zip)

http://example.webscraping.com/places/default/user/login?_next=/places/default/index
test@qq.com test
