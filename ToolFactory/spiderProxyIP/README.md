# SpiderProxyIP

简单的爬取代理ip地址，子代理(边爬代理，自动更换代理，防止被屏蔽)

## log:
* 首次爬的时候没有设置代理，导致被网站屏蔽了，几分钟后才可以用，下次记住了
* [requests.exceptions](http://docs.python-requests.org/en/master/api/#exceptions)
	* requests.exceptions.ConnectTimeout:time out
	* requests.exceptions.ProxyError:程主机强迫关闭了一个现有的连接
	* requests.exceptions.ReadTimeout:Read time out
## dependent
BeautifulSoup requests yaml
