* [shell编程菜鸟教程](http://www.runoob.com/linux/linux-shell.html)
* [shell编程：c语言中文网](http://c.biancheng.net/cpp/view/6994.html)

## 常用标量
* stdin 0
* stdout 1
* stderr 2

## 环境变量
* export PATH="$PATH:NewPath"
* 默认具有的环境变量 HOME PWD USER UID SHELL
* $SHELL==$0
* PS1="\e[1;31msh\e[1;0m>"
* 用函数添加环境变量 setpath(){ [ -d "$2" ] && eval $1=\"$2'\$$1\" $$ export $1;} # 使用 setpath PATH /path

## 变量

```
your_name="qinjx"
echo $your_name
echo ${your_name}

只读变量，不可改变
myUrl="http://www.w3cschool.cc"
readonly myUrl

删除变量：
unset variable_name

单引号
  str='this is a string'
  单引号字符串的限制：
    单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
    单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
双引号
  your_name='qinjx'
  str="Hello, I know your are \"$your_name\"! \n"
  双引号的优点：
    双引号里可以有变量
    双引号里可以出现转义字符

拼接字符串
    your_name="qinjx"
    greeting="hello, "$your_name" !"
    greeting_1="hello, ${your_name} !"
    echo $greeting $greeting_1

获取字符串长度
    string="abcd"
    echo ${#string} #输出 4

查找子字符串
    查找字符 "i 或 s" 的位置：
    string="runoob is a great company"
    echo `expr index "$string" is`  # 输出 8

定义数组
  array_name=(value0 value1 value2 value3)
  valuen=${array_name[n]}
  使用@符号可以获取数组中的所有元素，例如：
    echo ${array_name[@]}
    echo ${array_name[*]}

获取数组的长度
    获取数组长度的方法与获取字符串长度的方法相同，例如：
    # 取得数组元素的个数
    length=${#array_name[@]}
    # 或者
    length=${#array_name[*]}
    # 取得数组单个元素的长度
    lengthn=${#array_name[n]}
关联数组
    declare -A ass_array
    ass_array=([index1]=val1 [index2]=val2)
    ass_array[index1]=value1
    列出索引
        echo ${!ass_array[*]}
        echo ${!ass_array[@]}

Shell 注释
    以"#"开头的行就是注释，会被解释器忽略。
    sh里没有多行注释，只能每一行加一个#号

```

## 输入/输出重定向 && 文件描述符

```
命令  说明
command > file  将输出重定向到 file。
command < file  将输入重定向到 file。
command >> file 将输出以追加的方式重定向到 file。
n > file    将文件描述符为 n 的文件重定向到 file。
n >> file   将文件描述符为 n 的文件以追加的方式重定向到 file。
n >& m  将输出文件 m 和 n 合并。
n <& m  将输入文件 m 和 n 合并。
<< tag  将开始标记 tag 和结束标记 tag 之间的内容作为输入。

pgrep -x httpd >/dev/null 2>&1 # 将标准输出重定向到null，标准错误输出重定向到输出
```

## Shell 传递参数

```
echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";

./test a b #输出 test a b

$#	传递到脚本的参数个数
$*	以一个单字符串显示所有向脚本传递的参数。
如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
$$	脚本运行的当前进程ID号
$!	后台运行的最后一个进程的ID号
$@	与$*相同，但是使用时加引号，并在引号中返回每个参数。
如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
$*与$@比较： $*扩展为"$1c$2c$3" ;$@ 扩展为"$1" "$2" "$3"
$-	显示Shell使用的当前选项，与set命令功能相同。
$?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。
```

## 基本运算符

```
算数运算符
关系运算符
布尔运算符
字符串运算符
文件测试运算符

```

### 关系运算符

```
-eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 false。
-ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
-gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
-lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
-ge	检测左边的数是否大等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
-le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。
```

### 布尔运算符
```
!	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
-o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
-a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。
```

### 逻辑运算符

```
&&	逻辑的 AND	[[ $a -lt 100 && $b -gt 100 ]] 返回 false
||	逻辑的 OR	[[ $a -lt 100 || $b -gt 100 ]] 返回 true
```

### 字符串运算符

```
=	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
!=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
-z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
-n	检测字符串长度是否为0，不为0返回 true。	[ -n $a ] 返回 true。
str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。

```

### 文件测试运算符

```
-b file	检测文件是否是块设备文件，如果是，则返回 true。	[ -b $file ] 返回 false。
-c file	检测文件是否是字符设备文件，如果是，则返回 true。	[ -c $file ] 返回 false。
-d file	检测文件是否是目录，如果是，则返回 true。	[ -d $file ] 返回 false。
-f file	检测文件是否是普通文件（既不是目录，也不是设备文件），如果是，则返回 true。	[ -f $file ] 返回 true。
-g file	检测文件是否设置了 SGID 位，如果是，则返回 true。	[ -g $file ] 返回 false。
-k file	检测文件是否设置了粘着位(Sticky Bit)，如果是，则返回 true。	[ -k $file ] 返回 false。
-p file	检测文件是否是具名管道，如果是，则返回 true。	[ -p $file ] 返回 false。
-u file	检测文件是否设置了 SUID 位，如果是，则返回 true。	[ -u $file ] 返回 false。
-r file	检测文件是否可读，如果是，则返回 true。	[ -r $file ] 返回 true。
-w file	检测文件是否可写，如果是，则返回 true。	[ -w $file ] 返回 true。
-x file	检测文件是否可执行，如果是，则返回 true。	[ -x $file ] 返回 true。
-s file	检测文件是否为空（文件大小是否大于0），不为空返回 true。	[ -s $file ] 返回 true。
-e file	检测文件（包括目录）是否存在，如果是，则返回 true。	[ -e $file ] 返回 true。
```

## echo
echo -e "t\tt" == echo -e 't\tt'
echo -e "\e[1;31mIt's me \e[1;0m"  # \e[1;31m之后的全变颜色，用\e[1;0m恢复原来的颜色
```
显示命令执行结果
  echo `date`
```

## printf

```
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg  
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234

姓名     性别   体重kg
郭靖     男      66.12

printf的转义序列
序列	说明
\a	警告字符，通常为ASCII的BEL字符
\b	后退
\c	抑制（不显示）输出结果中任何结尾的换行字符（只在%b格式指示符控制下的参数字符串中有效），而且，任何留在参数里的字符、任何接下来的参数以及任何留在格式字符串中的字符，都被忽略
\f	换页（formfeed）
\n	换行
\r	回车（Carriage return）
\t	水平制表符
\v	垂直制表符
\\	一个字面上的反斜杠字符
\ddd	表示1到3位数八进制值的字符。仅在格式字符串中有效
\0ddd	表示1到3位的八进制值字符
```

##  test
test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。

```
数值测试
参数	说明
-eq	等于则为真
-ne	不等于则为真
-gt	大于则为真
-ge	大于等于则为真
-lt	小于则为真
-le	小于等于则为真

字符串测试
参数	说明
=	等于则为真
!=	不相等则为真
-z 字符串	字符串的长度为零则为真
-n 字符串	字符串的长度不为零则为真

文件测试
参数	说明
-e 文件名	如果文件存在则为真
-r 文件名	如果文件存在且可读则为真
-w 文件名	如果文件存在且可写则为真
-x 文件名	如果文件存在且可执行则为真
-s 文件名	如果文件存在且至少有一个字符则为真
-d 文件名	如果文件存在且为目录则为真
-f 文件名	如果文件存在且为普通文件则为真
-c 文件名	如果文件存在且为字符型特殊文件则为真
-b 文件名	如果文件存在且为块特殊文件则为真


num1="runoob"
num2="runoob"
if test num1=num2
then
    echo '两个字符串相等!'
else
    echo '两个字符串不相等!'
fi
```

## 流程控制

```
if condition
then
    command1
else
    command
fi

for item in $date;
do
    echo "item\n"
done
while condition
do
    echo "item\n"
done
```

## 函数
```
function fname(){}
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
    echo "作为一个字符串输出所有参数 $@ !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
funWithParam(){
    echo "第一个参数为 $1 !"
    echo "第二个参数为 $2 !"
    echo "第十个参数为 $10 !"
    echo "第十个参数为 ${10} !"
    echo "第十一个参数为 ${11} !"
    echo "参数总数有 $# 个!"
    echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
```


## shell文件
1. chmod a+x script.sh
```
#!/bin/bash
# author:菜鸟教程
# url:www.runoob.com

#使用 . 号来引用test1.sh 文件
. ./test1.sh

echo "菜鸟教程官网地址：$url"
```
2. 每个命令或命令序列 分号或换行符分割
3. # 为注释
4. bash -x src.sh # 调试功能 set -x 和 set +x进行部分调试

## 时间 日期
```
date 显示当前时间

start=$(date +%s);sleep 1;end=$(date +%s);d=$((end-start));echo $d
time <scriptpath>
```

## Linux命令常用的应用
* pgrep bash 获得bash的PID
* cat /proc/1/environ 获得对应PID的环境变量 
* tr 替换命令
* cat /proc/1/environ | tr '\0' '\n'每行一个键值对
