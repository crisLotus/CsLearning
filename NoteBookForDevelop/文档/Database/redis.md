# 基本数据结构
* string list set hash zset(有序集合)
* 通用命令 del type rename

## 通用命令 del type rename
## string
```
set key value
get key
del key
incr
```

## list
```
lpush lpop
rpush rpop
lindex
lrange key 0 -1
ltrim key start end
```

## set
```
SADD SREM
SISMEMBER 一个元素是否存在集合中
SMEMBERS 获取集合包含的所有元素
SREM
```

## hash
```
hset hget hgetall
hdel
hmset hmget hlen
```

## zset
```
zadd zset-key 728 member1
zscore zset-key  member0
zcard
zrem zset-key member1
zrange zset-key 0 -1 withscores
zrangebyscore zset-key 0 800 withscores
```

## 发布/订阅

## 其他命令
* sort

### 事务
* multi
* exec

### 过期时间

# source

* [Redis中文网](http://www.redis.cn/)
* [Redis 命令参考](http://www.redis.cn/commands.html)
* [Redis 命令参考](http://redisdoc.com/)
* [Redis 中文文档](http://www.redis.cn/documentation.html)
* [Redis 中文文档](https://wizardforcel.gitbooks.io/redis-doc/content/)

* [Mongo、Redis、Memcached对比及知识总结](https://segmentfault.com/a/1190000012834166)
