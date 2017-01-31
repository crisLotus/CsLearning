# -*- coding:utf-8 -*-

import random


def lib_rand(n,nn=80):
    st = list()
    for i in range(nn):
        st.append(str(random.randint(0,n)))
    return ','.join(st)

def rand_col():
    return lib_rand(80)


def rand_row():
    return lib_rand(25)

def rand_char():
    return lib_rand(128)

def rand_chr_num(m=10,n=20,nn=80):
    st = list()
    for i in range(nn):
        st.append(str(random.randint(m,n)))
    return ','.join(st)

def main():
    print('rand_len','dw',rand_chr_num())
    print()
    print('rand_row','dw',rand_row())
    print()
    print('rand_chr','dw',rand_char())


if __name__ == '__main__':
    main()
