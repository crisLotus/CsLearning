# -*- coding: utf-8 -*-

import re

from common import Download


def crawl_sitemap(url):
    # download the sitemap file as sitemap.xml
    sitemap = Download(url)
    links = re.findall('<loc>(.*?)</loc>', sitemap.decode("utf-8"))
    # download each link
    for link in links:
        html = Download(link)
        # scrape html here
        # ...


if __name__ == '__main__':
    # crawl_sitemap('http://www.makemytrip.com/sitemap.xml')
    crawl_sitemap("http://example.webscraping.com/sitemap.xml")
