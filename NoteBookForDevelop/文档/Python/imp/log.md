# logging
## 使用yaml做配置文件
```
# file config.yaml
version: 1
handlers:
  console:
    class: logging.StreamHandler
    stream: ext://sys.stderr
    formatter: basic
  file:
    class: logging.FileHandler
    filename: log/t.log
    encoding: utf-8
    formatter: basic
formatters:
  basic:
    # "%(levelname)-8s [%(asctime)s] [pid:%(process)s] [filename:%(filename)s] [fun:%(funcName)s] [lineno:%(lineno)d] [%(name)s] %(message)s"
    format: "%(levelname)-8s [%(asctime)s] [pid:%(process)s] %(filename)s %(name)s %(message)s"
    datefmt: "%Y-%m-%d %H:%M:%S"
loggers:
  verbose:
    handlers: [console]
    level: INFO
    propagete: False # 日志传播
  audit:
    handlers: [file,console]
    level: DEBUG
    propagete: False
  root:
    handlers: [console]
    level: INFO

# http://python.usyiyi.cn/translate/python_352/library/logging.config.html


# python 使用log代码
def main():
    import logging.config
    import yaml
    with open('config.yaml') as f:
        config = yaml.load(f)
    logging.config.dictConfig(config)

    verbose = logging.getLogger('verbose.example.SomeClass')
    audit = logging.getLogger('audit.example.SomeClass')
    root = logging.getLogger('root')
    verbose.info('Verbose info')
    audit.info('Audit info')
    root.info('Root info')
# DEBUG    [2017-01-20 16:31:58] [pid:4432] [filename:test.py] [fun:main] [lineno:47] [audit.example.SomeClass] Audit info      81371
```

# warning