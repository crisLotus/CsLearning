* [汇编语言学习：Debug的使用](http://www.cnblogs.com/hustlijian/archive/2011/06/04/2072656.html)
* [debug in win](https://msdn.microsoft.com/en-us/library/cc722863.aspx)
* [汇编程序实验报告示例,debug,8086](http://jingyan.baidu.com/article/3ea5148918048052e71bba69.html)
* [不知道是什么](http://mysite.du.edu/~jcalvert/math/mathom.htm)
# debug 常用参数

```
R命令：查看、改变CPU寄存器的内容；
D命令：查看内存中的内容；
E命令：改写内存中的内容；
U命令：将内存中的机器指令翻译为汇编指令；
T命令：执行一条机器指令；
A命令: 以汇编指令的格式在内存中写入一条机器指令。
G命令：执行到指定地址处汇编指令
```
```
r |r ax
d |d 1000:0 |d 1000:ff00 ff09
e 1000:0 '1' 'a' 'b' 'c' 'd'| e 1000:0 'abcdefghi' |e 1000:0 |
a 1000:0|
u 1000:0|
t|
g a|
```
