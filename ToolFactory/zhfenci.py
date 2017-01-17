#! coding:utf-8

import jieba
import jieba.analyse

__author__ = ('exfly',)


class Jiebafenci:
    """
    jieba分词，完成xuhui的检索技术作业
    """
    def __init__(self, src=''):
        self.src = src
        self.key_cipin = dict()

    def cut(self):
        """
        切词方法
        :return: 切词的结果
        """
        # return jieba.analyse.extract_tags(self.src)
        return jieba.cut(self.src)


    def get_cipin(self):
        result = dict()
        cutResult = self.cut()
        jieba.suggest_freq(('服务', '质量'), True)
        resultList = list(cutResult)  # 转化成一个序列
        resultSet = set(resultList)  # 转化成一个集合
        # 转化成序列是为了转化成集合。
        # 转化成集合的目的是获取不重复的元素用于统计（下面的for循环中会使用）。
        # 创建一个存放统计结果的字典，拆分之后的单词作为key，单词出现的次数作为value。
        resultForstatistic = dict()

        # 词列表内的词词频
        keywords = {
            '服务','关系', '质量', '忠诚度','满意','顾客','员工'
        }
        # keywords = resultSet # 所有切出来的词统计词频
        for item in resultSet:
            resultForstatistic[item] = resultList.count(item)
        # 统计结果字典中没有的单词，其出现次数设为0。
        for keyword in keywords:
            try:
                keyCounts = resultForstatistic[keyword]
            except KeyError:
                keyCounts = 0
            result[keyword] = keyCounts
            # result.append((keyword, keyCounts))
        self.key_cipin = result
        return result


def read_from_file():
    pass


def write_to_file(filename,content):
    pass


class Wenxia:

    def __init__(self, src):
        """
        文档处理类
        :param src: 格式 [[001,'string1...'], [002,'string...']]

        src 存储文档内容list
        result 存储词频
        """
        self.src = src
        self.result = []
        self.daopaidang = dict()

    def get_result(self):
        """
        分别统计在不同文档下的词频
        :return:
        [
            ('001', {'服务': 1, '满意': 0, '质量': 2, '关系': 1, '忠诚': 1, '员工': 0, '顾客': 0}),
            ('002', {'服务': 1, '满意': 0, '质量': 1, '关系': 1, '忠诚': 1, '员工': 0, '顾客': 1}),
            ('003', {'服务': 1, '满意': 1, '质量': 1, '关系': 0, '忠诚': 1, '员工': 0, '顾客': 3}),
            ('004', {'服务': 1, '满意': 0, '质量': 1, '关系': 1, '忠诚': 0, '员工': 2, '顾客': 0}),
            ('005', {'服务': 1, '满意': 0, '质量': 2, '关系': 1, '忠诚': 0, '员工': 0, '顾客': 2}),
            ('006', {'服务': 1, '满意': 0, '质量': 1, '关系': 0, '忠诚': 0, '员工': 0, '顾客': 2}),
            ('007', {'服务': 1, '满意': 0, '质量': 1, '关系': 1, '忠诚': 0, '员工': 0, '顾客': 1})
        ]
        """
        for i in self.src:
            self.result.append((i['num'], Jiebafenci(i['string']).get_cipin()))
        return self.result

    def merge(self):
        """
        生成倒排档
        :return:
        """
        # 遍历所有文档
        for wendang in self.result:
            wendang_name = wendang[0]
            wendang_ci = wendang[1]
            for ci in wendang_ci:
                try:
                    try:
                        self.daopaidang[ci]['出现次数'] += int(wendang_ci[ci])
                    except(KeyError):
                        self.daopaidang[ci] = dict()
                        self.daopaidang[ci]['出现次数'] = 0
                        self.daopaidang[ci]['出现次数'] += int(wendang_ci[ci])
                    if wendang_ci[ci] > 0:
                        try:
                            self.daopaidang[ci]['文档集合'].append(
                                {wendang_name: wendang_ci[ci]})
                        except(KeyError):
                            self.daopaidang[ci]['文档集合'] = []
                            self.daopaidang[ci]['文档集合'].append(
                                {wendang_name: wendang_ci[ci]})
                except(KeyError):
                    pass
        return self.daopaidang

    def main(self):
        self.get_result()
        return self.merge()


if __name__ == '__main__':
    text = [
        {
            'num':'001',
            'string':'企业内部服务质量关系质量对内部忠诚的影响机制基于内部营销是叫的实证研究'},
        {
            'num':'002',
            'string':'网络商店物流服务质量及其与顾客忠诚的关系研究'},
        {
            'num': '003',
            'string': '服务质量对顾客价值顾客满意和顾客忠诚的影响'},
        {
            'num': '004',
            'string': '探讨内部服务质量员工满意度与员工忠诚度之间的关系研究'},
        {
            'num': '005',
            'string': '服务质量顾客满意度关系质量与顾客忠诚度关联性研究'},
        {
            'num': '006',
            'string': '服务质量对顾客满意度与顾客忠诚度的影响研究'},
        {
            'num': '007',
            'string': '商业银行服务质量与顾客满意度及忠诚度关系研究'},
    ]
    wenxia = Wenxia(text)
    m = wenxia.main()
    print(m)
