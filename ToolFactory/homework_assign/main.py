# -*- coding: utf-8 -*-  
import csv
import xlrd
import os
import re



class Class:
    def __init__(self, xlsx_filename='', sheet_name=''):
        self.filename = xlsx_filename
        self.all_people, self.tags = self.get_all_info(xlsx_filename, sheet_name)

    def _get_tag(self):
        return self.all_people[0]

    def _get_tag_index_by_name(self, tag_name):

        tag_index = -1
        try:
            tag_index = self.tags.index(tag_name)
        except:
            pass
        return tag_index

    def _get_all_info(self, filename, sheet_name):
        """
        用一张二维表存储学生信息
        """
        csv_reader = workbook = xlrd.open_workbook(filename)  
        booksheet = workbook.sheet_by_name('Sheet1')

        # 获取所有行标注
        tags = list()
        for col in range(booksheet.ncols):
            tags.append(booksheet.cell(0, col).value)
        #print(tags)  # TODO:debug

        # all_people = list()
        # for row in range(1, booksheet.nrows):
        #     one_people = {"":"", }
        #     for col in range(booksheet.ncols):
        #         one_people[tags[col]] = booksheet.cell(row, col).value
        #     all_people.append(one_people)

        # 获得所有学生信息
        all_people = list()
        for row in range(1, booksheet.nrows):
            one_people = list()
            for col in range(booksheet.ncols):
                one_people.append(booksheet.cell(row, col).value)
            #print(one_people)  # TODO:debug
            all_people.append(one_people)
        return all_people, tags

    def get_all_info(self, filename, sheet_name):
        return self._get_all_info(filename, sheet_name)


class Tools(Class):
    def __init__(self):
        self.current_dir = os.getcwd()
        self.all_people = list()
        self.hand_in_assignment = set()

    def _check_who_hand_in(self, dirname):
        filename_list = self._current_space_file_name(dirname)
        for filename in filename_list:
            pattern = re.compile(r'201\d{7,9}')
            stu_nun = pattern.search(filename)
            self.hand_in_assignment.add(stu_nun.group())

    def check_who_not_hand_in(self, dirname, xlsx_filename, sheet_name):
        one_class = Class(xlsx_filename, sheet_name)
        all_people = one_class.all_people

        not_hand_in = list()
        # print(type(all_people), all_people)
        
        self._check_who_hand_in(dirname)

        # print(self.hand_in_assignment)
        for one_all in all_people:
            flag = False
            for one_had_hand_in in self.hand_in_assignment:
                if one_had_hand_in in one_all:
                    flag = True
            if flag==False:
                not_hand_in.append(one_all)
        return not_hand_in


        # return all_people - set(self.hand_in_assignment)
        # return self.hand_in_assignment 

    def change_file_name_by_format(self, dirname='实验四', format=None):
        src_dir = dirname
        dst_dir = dirname+'-修改后'
        try:
            os.mkdir(dst_dir)
        except:
            print(dst_dir, "is exist")
        filename_list = self._current_space_file_name(dirname)
        for filename in filename_list:
            if self._check_filename_vali(filename):
                with open(os.path.join(src_dir, filename), 'rb') as src_file:
                    dst_file_name = self._fix_one_filename(filename)
                    with open(os.path.join(dst_dir, dst_file_name), 'wb') as dst_file:
                        dst_file.write(src_file.read())
                        print("change |"+filename+"| to |"+ dst_file_name)

    def _current_space_file_name(self, dirname):
        # os.chdir('实验四')  #改变工作目录
        # #打印当前的工作目录
        # print(os.getcwd())

        # #列举当前工作目录下的文件名
        # print(os.listdir())
        # os.chdir('..')  #改变工作目录
        file_list = list()
        for file in os.listdir(os.path.join(os.getcwd(), dirname)):  
            file_path = file
            if os.path.isdir(file_path):
                pass
            else:
                file_list.append(file_path)

        return file_list

    def _check_filename_vali(self, filename):
        string = filename
        flag = False
        pattern = re.compile(r'201\d{7,9}')
        stu_nun = pattern.search(string)
        if stu_nun:
            stu_nun = stu_nun.group()
        else:
            stu_nun = ""
        if stu_nun:
            flag = True
        return flag

    def _fix_one_filename(self, string, stu_num_format=r'201\d{7,9}', shiyan_format='实验.'):
        string = string.replace(' ','')
        string, tag = string.split('.')

        # match stu number
        pattern = re.compile(stu_num_format)
        stu_nun = pattern.search(string)
        if stu_nun:
            stu_nun = stu_nun.group()
        else:
            stu_nun = ""
        # print(stu_nun)

        # match 实验?
        pattern = re.compile(shiyan_format)
        practice = pattern.search(string)
        if practice:
            practice = practice.group()
        else:
            practice = ""
        # print(practice)

        #TODO: match name

        # join string
        string = string.replace(str(stu_nun), "")
        string = string.replace(str(practice), "")
        string = stu_nun + string + practice + '.' +tag
        # print(string)
        return string

    def find_who_not_hind_in_assignment(self):
        pass

    def find_who_not_hind_in_assignment(self):
        pass


def test_re(string):
    string = string.replace(' ','')
    string, tag = string.split('.')

    # match stu number
    pattern = re.compile(r'201\d{7,9}')
    stu_nun = pattern.search(string)
    stu_nun = stu_nun.group()
    # print(stu_nun)

    # match 实验?
    pattern = re.compile(r'实验.')
    practice = pattern.search(string)
    practice = practice.group()
    # print(practice)

    #TODO: match name

    # join string
    string = string.replace(str(stu_nun), "")
    string = string.replace(str(practice), "")
    string = stu_nun + string + practice + tag
    # print(string)
    return string


def test():
    # string = "第四次试验 刘巧玲 201501622013 .docx"
    # print('原始:'+"第四次试验 刘巧玲 201501622013 .docx")
    # print('处理后:'+test_re(string))


    one_work = Tools()
    one_work.change_file_name_by_format(dirname='实验四')
    # print("not hand in:", one_work.check_who_not_hand_in('实验四-修改后', xlsx_filename='test.xlsx', sheet_name='Sheet1'))
    print("main over")


def main():
    menu = {
        "1":"查谁没交",
        "2":"改名字",
    }
    help_string = """
help:
请输入数字：
1:查谁没交
2:批量改名字
"""
    choice = input(help_string)
    if choice not in menu:
        print("未知选项")
        exit()
    if choice=="1":
        one_work = Tools()
        dir_name = input("请输入需要改名字的目录")
        # one_work.change_file_name_by_format(dirname='实验四')
        print("not hand in:", one_work.check_who_not_hand_in(dir_name, xlsx_filename='class_info.xlsx', sheet_name='Sheet1'))
    if choice=="2":
        one_work = Tools()
        dir_name = input("请输入需要改名字的目录")
        one_work.change_file_name_by_format(dirname=dir_name)

if __name__ == '__main__':
    main()
