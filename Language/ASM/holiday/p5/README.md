程序设计项目五

定义一个数据段如下：
data segment
	db 'h12E332l@L#O*&^!88nI@cE$% %$T1O m33E44E55t y77O88u!()'
	db '?'
data ends
注意：第一行字符串为待处理的数据，'?'为字符串结束符号。

设计程序完成如下操作：
（1）去掉除字母、空格、'!'之外的字符；
（2） 通过内存间的数据交换，将数据段中的字符串修改为'Hello!Nice to meet you!'；
（3）在屏幕正中打印处理好后的数据。

完成程序后思考：
（1）如何设计程序，程序代码量最少；
（2）如何设计程序，程序执行速度最快；
（3）如何设计程序，使得程序具有通用性。
注意：
（1）'?'、'!'和空格分别假定为字符串的结束符、一句话的最后的标点和单词间的间隔符，都不属于干扰符号。
（2）这里的通用性是指：任意带有其他符号干扰的一组字符串都能够通过程序被处理为具有如下特点的英文段落：段落中只包含字母、空格、'!'三种符号。段落中的每句话都是以开头字母为大写，'!'为结束标点的句子。

 
1. 
```
if(ax>=41h and ax<=5ah or ax==' ' or ax=='!'){
	[di] <= [si]
}
is_alpha:
	or al,00100000b
	ax < 61h j e1
	ax <= 7ah j e2
	e1:
	ax == ' ' j e2
	ax != '!' j e3
	e2:
	[di] <= [si]
	e3:
	ret

取出 字符到ax
flag = true
if ax == '!'
	flag = true
	jmp end_if
if flag==true:
	ax 变大
	flag = false
	jmp end_if
else:
	ax 变小
存储ax
end_if

```

