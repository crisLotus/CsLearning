#include <stdio.h>
#include <stdlib.h>
#include "minctest.h"

int add_float_fun(int x, int y)
{
    return x + y;
}

// test=================================
void test_run();
int main(int argc, char *argv[])
{
    test_run();
    printf("\n\n========================\n");
    printf("aaa""bbbb");
    printf("\n\n========================\n");
    return lfails;
}

// test ================================
// 基本数据类型大小
void test_sizeof_simple_type()
{
    lequal(sizeof(char), 1);
    lequal(sizeof(int), 4);
    lequal(sizeof(unsigned char), 1);
    lequal(sizeof(float), 4);
    lequal(sizeof(long), 4);
    lequal(sizeof(double), 8);
    lequal(sizeof(long long), 8);
    lequal(sizeof(long double), 12);
}
void test_string_add()
{
    lsequal("aaa""bbbb", "aaabbbb");
}
void test_operator()
{
    int i = 1;
    lequal(i^=1, 0);
    lequal(i^=1, 1);
    lequal(i^=1, 0);

    // ++
    i = 10;
    lequal(i++, 10);
    lequal(i, 11);
    lequal(++i, 12);

    // int + int
    lequal(10+1, 11);
    lequal(10+1, 11.0);

    // int + float
    lequal(10+1.1, 11.1);
    lequal(10.1+1, 11.1);
    lequal(10.1+(-1), 9.1);

    unsigned int ui=-1;
    lok(ui+1.0  != 0);
    lok(ui+1    == 0);

    // TODO: 不同类型加减乘除
    //lfequal(((unsigned int)-1)-1.0, -2);// 这种暂时没有分析出来
    //http://www.runoob.com/cprogramming/c-type-casting.html
}

void test_if_else()
{
    if (1) ;
    else if (1) ;
    else ;
}
void test_array()
{
    int balance[10]= {1, 2, 3, 4, 5};
    balance[3] = 50;
    lequal(balance[3], 50);
    double balance_[] = {1000.0, 2.0, 3.4, 7.0, 50.0};
}
void test_point()
{
    int i;
    int *pi = &i;
    lok(*pi);
    int a[10];
    lequal(a, &a[0]);
}
void test_string()
{
    char greeting[] = "Hello";
    lequal(greeting[0], 'H');
    lequal(greeting[5], 0);
    lequal(sizeof(greeting), 6);
}

void test_struct()
{
    struct Books
    {
        char  title[50];
        char  author[50];
        char  subject[100];
        int   book_id;
    };
    struct Books book= {"title", "author", "subject", 1};
    lsequal(book.title, "title");
    struct Books * pbook = &book;
    lsequal(pbook->title, "title");
}
void test_union()
{
    union Data
    {
        int i;
        float f;
        char  str[20];
    } data;
    data.i = 10;
    lequal(sizeof(data), 20);
    lequal(data.i, 10);
}
// run test = ==========================
void test_run()
{
    lrun("sizeof_type:", test_sizeof_simple_type);
    lrun("string_funt:", test_string_add);
    lrun("test_operator", test_operator);
    lrun("test_if_else", test_if_else);
    lrun("test_array", test_array);
    lrun("test_point", test_point);
    lrun("test_string", test_string);
    lrun("test_struct", test_struct);
    lrun("test_union", test_union);
    lresults();
    return lfails != 0;
}
