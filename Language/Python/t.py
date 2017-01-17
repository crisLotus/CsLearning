#! coding:utf-8

class People:
    def __init__(self):
        self.age = 10
        self.__test = 'name'

    def p(self):
        self.__p()

    def __p(self):
        print(self.__test)

if __name__ == '__main__':
    p = People()
    p.age
    p.p()
    for i in range(10):
        print(i)