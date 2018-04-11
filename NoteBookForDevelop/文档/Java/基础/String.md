# String
Java中输入字符串是默认需要转义字符的 

1. 八进制转义序列：\ + 1到3位5数字；范围'\000''\377'       \0：空字符 
2. Unicode转义字符：\u + 四个十六进制数字；065535      \u0000：空字符 
3. 特殊字符：就3个       "：双引号      '：单引号      \：反斜线 
4. 控制字符：5个
' 单引号字符
\ 反斜杠字符
\r 回车
\n 换行
\f 走纸换页
\t 横向跳格
\b 退格

## UUID
[UUID](https://github.com/cowtowncoder/java-uuid-generator)
## Method
public String substring(beginIndex,endIndex);
public char charAt(int);
public String replace(oldChar, newChar);
public boolean isEmpty();
public String[] split(String);
public String toLowerCase();
public char[] toCharArray();
public String trim();
public static String format(String format, Object... args);

## StringBuffer StringBuilder
* String 不可变类
* StringBuffer 可变， 线程安全
* StringBuilder 可变， 线程不安全
	* append(String);
	* insert(int offset, String string);
