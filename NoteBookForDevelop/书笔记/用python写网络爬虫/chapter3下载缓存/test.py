# -*- coding: utf-8 -*-
from datetime import timedelta

from pymongo import MongoClient

from mongo_cache import MongoCache

cache = MongoCache()
cache.clear()
url = 'http://example.webscraping.comasdf'
result = {'html': '...'}
cache[url] = result
print(cache[url]['html'] == result['html'])
cache = MongoCache(expires=timedelta())
cache[url] = result
import time
time.sleep(60)
print(cache[url])
