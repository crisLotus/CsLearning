程序设计项目三
    
加、减、除三则运算。

要求：
（1）读取字符串的内容，判断第四个字符是'+'、'-'或'/'，然后按照相应的符号进行运算，并把运算结果转换为字符串存放在等号后面，最后把算式显示到屏幕中间，白底蓝字。
（2）注意数字字符的ASCII与数字的对应关系，数字的数值加30H为这个数字的字符所对应的ASCII。
（3）数据段定义如下：
calculate segment
        db '1. 3/1=         '
        db '2. 5+3=         '
        db '3. 9-3=         '
        db '4. 4+5=         '
calculate ends

if tag=='/':
    a/b div
if tag=='+':
    a+b add
if tag=='-':
    a-b 

cx = 3
main:
    jmp 
loop main