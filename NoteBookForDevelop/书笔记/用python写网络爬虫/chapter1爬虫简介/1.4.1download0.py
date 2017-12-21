# -*- coding: utf-8 -*-
import urllib.parse
from urllib.error import URLError
from urllib.request import ProxyHandler, Request, build_opener, urlopen


def download3(url, num_retries=2):
    """Download function that also retries 5XX errors"""
    print('Downloading:', url)
    try:
        html = urlopen(url).read()
    except URLError as e:
        print('Download error:', e.reason)
        html = None
        if num_retries > 0:
            if hasattr(e, 'code') and 500 <= e.code < 600:
                # retry 5XX HTTP errors
                html = download3(url, num_retries - 1)
    return html


def download4(url, user_agent='wswp', num_retries=2):
    """Download function that includes user agent support"""
    print('Downloading:', url)
    headers = {'User-agent': user_agent}
    request = Request(url, headers=headers)
    try:
        html = urlopen(request).read()
    except URLError as e:
        print('Download error:', e.reason)
        html = None
        if num_retries > 0:
            if hasattr(e, 'code') and 500 <= e.code < 600:
                # retry 5XX HTTP errors
                html = download4(url, user_agent, num_retries - 1)
    return html


def download5(url, user_agent='wswp', proxy=None, num_retries=2):
    """Download function with support for proxies"""
    print('Downloading:', url)
    headers = {'User-agent': user_agent}
    request = Request(url, headers=headers)
    opener = build_opener()
    if proxy:
        proxy_params = {urllib.parse.urlparse(url).scheme: proxy}
        opener.add_handler(ProxyHandler(proxy_params))
    try:
        html = opener.open(request).read()
    except URLError as e:
        print('Download error:', e.reason)
        html = None
        if num_retries > 0:
            if hasattr(e, 'code') and 500 <= e.code < 600:
                # retry 5XX HTTP errors
                html = download5(url, user_agent, proxy, num_retries - 1)
    return html


download = download5


def main():
    # download3('http://httpstat.us/500')
    download('http://httpstat.us/500')


if __name__ == '__main__':
    main()
