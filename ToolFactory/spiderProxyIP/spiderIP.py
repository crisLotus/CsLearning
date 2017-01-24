import logging
from bs4 import BeautifulSoup
import requests
import logging.config
import yaml
import random
with open('config.yaml') as f:
    config = yaml.load(f)
logging.config.dictConfig(config)

def debug_log(class_):
    class_.logger = logging.getLogger('spider.'+class_.__qualname__)
    return class_


@debug_log
class Spider:

    def __init__(self,base_url='http://www.kuaidaili.com/free/inha/',
                 start_page=1, end_page=100, filename='tmp/proxy_ip.txt'):
        """Spider proxy ip from http://www.kuaidaili.com/

        This spider will auto change the proxy to work.
        This spider is stupid!But enough to use.
        The result is save in the file not encoded in utf-8, be careful.

        :param base_url: just like `http://www.kuaidaili.com/free/inha/` or
                                    `http://www.kuaidaili.com/proxylist/`
        :param start_page:
        :param end_page:
        :param filename:
        """
        self.base_url = base_url
        self.now_page = start_page
        self.end_page = end_page
        self.result_store_filename = filename  # backup filename

        self.result = list()  # store proxy-ips in list
        self.web_content_req = None  # save requests obj
        self.__self_proxy = None    # store the self-proxy


    def _get_web_content(self, proxies=None):
        url = self.base_url+str(self.now_page)
        headers = {'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'}
        try:
            # 请求
            if not proxies:
                self.logger.error('NO PROXY!!!!!!!!!!!!!!!!!')
            self.web_content_req = requests.get(url, headers=headers, proxies=proxies, timeout=1)
        except requests.exceptions.ConnectTimeout:
            self.logger.error('Time out!')
        except requests.exceptions.ProxyError:
            self.logger.error('远程主机强迫关闭了一个现有的连接.')
        except requests.exceptions.ReadTimeout:
            self.logger.error('Read time out!')
        return self.web_content_req

    def _get_ip_proxy(self):
        flag = False
        if self.web_content_req:
            soup = BeautifulSoup(self.web_content_req.text, 'lxml')
            for tag in soup.find_all('tr'):
                result = list()
                for i in tag.children:
                    if i.string == '位置':
                        result = list()
                        break
                    if i.string != '\n':
                        result.append(i.string)
                if result:
                    self.result.append(list(result))
                    flag = True
        else:
            self.logger.debug('self.web_content_req is None')
        if flag:
            self.logger.debug('一页的proxy ip提取成功')

    def _store_to_file(self):
        flag = False
        if self.result:
            flag = True
        with open(self.result_store_filename, 'a+') as f:
            for proxy_ip in self.result:
                f.write('|'.join(proxy_ip))
                f.write('\n')
        if flag:
            self.logger.debug('self.result 中的东西保存到文件，并成功清空self.result')
        #由于到此，所有信息在文件里有了，故清空，防止沾满内存
        self.result = list()

    def _recovery_from_file(self):
        result = list()
        with open(self.result_store_filename, 'r') as f:
            for line in f:
                obj = line.split('|')
                result.append(obj)
        print(result)

    def _set_self_proxy(self):
        if self.result:
            rd = random.randint(0, len(self.result)-1)
            self.__self_proxy = self.result[rd]
            self.logger.info('ChangeProxy:'+self.__self_proxy[0]+':'+self.__self_proxy[1])
        else:
            self.logger.debug('Proxy No Changed!!!because self.result is None')
        return self.__self_proxy

    def _get_proxy_for_file(self):
        with open(self.result_store_filename, 'r') as f:
            pass

    def _set_proxy_to_file(self):
        pass

    def clean(self):
        self.web_content_req=None

    def _make_proxy_uri(self, one_proxy_message):
        proxy_uri = (one_proxy_message[3] + '://'
                     + one_proxy_message[0] + ':' + one_proxy_message[1])
        self.logger.debug('Chang-proxy ' + proxy_uri)
        return proxy_uri

    def run(self):
        while self.now_page != self.end_page:
            proxies = None
            if self.__self_proxy:
                proxies = {
                    "http": self._make_proxy_uri(self.__self_proxy),
                }
                self.__self_proxy = None
            self._get_web_content(proxies)
            self._get_ip_proxy()
            self._set_self_proxy()
            self._store_to_file()
            self.clean()
            self.now_page += 1
        # self._recovery_from_file()


def main():
    spider = Spider(end_page=100)
    spider.run()

def test():
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'}
    url = 'http://www.kuaidaili.com/free/'
    proxies = {
        "http": 'http://117.90.1.128:9000',
    }
    requests.get(url,
                 headers=headers,
                 proxies=proxies, timeout=0.1)

if __name__ == '__main__':
    main()
    # test()