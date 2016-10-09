[Java 语言快速入门  极客学院](http://wiki.jikexueyuan.com/project/java/)

base grammar:
## 基本语法
编写Java程序时，应注意以下几点：
- 大小写敏感：Java是大小写敏感的，这就意味着标识符Hello与hello是不同的。
- 类名：对于所有的类来说，类名的首字母应该大写。如果类名由若干单词组成，那么每个单词的首字母应该大写，例如 MyFirstJavaClass 。
- 方法名：所有的方法名都应该以小写字母开头。如果方法名含有若干单词，则后面的每个单词首字母大写。
- 源文件名：源文件名必须和类名相同。当保存文件的时候，你应该使用类名作为文件名保存（切记Java是大小写敏感的），文件名的后缀为.java。（如果文件名和类名不相同则会导致编译错误）。
- 主方法入口：所有的Java 程序由public static void main(String []args)方法开始执行。

## java数据类型
Java语言提供了八种基本类型。六种数字类型（四个整数型，两个浮点型），一种字符类型，还有一种布尔型。
**byte short int long float double boolean char**
每一种基本数据类型还存在其相应的包装类

**前缀0表示8进制，而前缀0x代表16进制**
* 引用类型 Site site = new Site("Runoob")
* Java常量 final double PI = 3.1415927;
```
符号	字符含义
\n	换行 (0x0a)
\r	回车 (0x0d)
\f	换页符(0x0c)
\b	退格 (0x08)
\s	空格 (0x20)
\t	制表符
\"	双引号
\'	单引号
\\	反斜杠
\ddd	八进制字符 (ddd)
\uxxxx	16进制Unicode字符 (xxxx)
```

## java 运算符
```
％	取模 - 右操作数除左操作数的余数	B%A等于0
＆	按位与操作符，当且仅当两个操作数的某一位都非0时候结果的该位才为1。	（A＆B），得到12，即0000 1100
|	按位或操作符，只要两个操作数的某一位有一个非0时候结果的该位就为1。	（A | B）得到61，即 0011 1101
^	按位异或操作符，两个操作数的某一位不相同时候结果的该位就为1。	（A ^ B）得到49，即 0011 0001
~	按位补运算符翻转操作数的每一位。	（〜A）得到-61，即1100 0011

条件运算符（?:）
instanceOf 运算符
```

## Java标识符
* 所有的标识符都应该以字母（A-Z或者a-z）,美元符（$）、或者下划线开始

## Java修饰符
* 像其他语言一样，Java可以使用修饰符来修饰类中方法和属性。
主要有两类修饰符：
  - 可访问修饰符 : default, public , protected, private
  - 不可访问修饰符 : final, abstract, strictfp


## Java变量
Java中主要有如下几种类型的变量
局部变量
类变量（静态变量）
成员变量（非静态变量）
## Java枚举
Java 5.0引入了枚举，枚举限制变量只能是预先设定好的值。使用枚举可以减少代码中的bug。
```
class FreshJuice {
   enum FreshJuiceSize{ SMALL, MEDUIM, LARGE }
   FreshJuiceSize size;
}

public class FreshJuiceTest {
   public static void main(String []args){
      FreshJuice juice = new FreshJuice();
      juice.size = FreshJuice. FreshJuiceSize.MEDUIM ;
   }
}
```

## class

```
class SuperClass {

}
class TC extends SuperClass {
  ...
}
abstract class AbstractClass {
  ...//abstract class 不可以实例化
  //有抽象方法，一定是抽象类，一定用abstract修饰类
}
```

## interface
[可见度] interface 接口名称 [extends 其他的interface名] {
        // 声明变量
        // 抽象方法
}
* 一个接口可以有多个方法。
* 接口文件保存在.java结尾的文件中，文件名使用接口名。
* 接口的字节码文件保存在.class结尾的文件中。
* 接口相应的字节码文件必须在与包名称相匹配的目录结构中。
* 接口与类的区别：
  - 接口不能用于实例化对象。
  - 接口没有构造方法。
  - 接口中所有的方法必须是抽象方法。
  - 接口不能包含成员变量，除了static和final变量。
  - 接口不是被类继承了，而是要被类实现。
  - 接口支持多重继承。

```
interface SuperInterface {
  final static int a=0; // 静态常量，永远不可变

  // 有无public abstract修饰效果等效
	int a();
	public abstract int b();

  ...
}
interface SubInterface extends SuperInterface {
  ...
}
class InterTest implements SubInterface, SuperInterface {
  ...
}
```

## package
import payroll;

## Exception
```
throws/throw关键字
如果一个方法没有捕获一个检查性异常，那么该方法必须使用throws 关键字来声明。throws关键字放在方法签名的尾部。
也可以使用throw关键字抛出一个异常，无论它是新实例化的还是刚捕获到的。
import java.io.*;
public class className
{
   public void deposit(double amount) throws RemoteException
   {
      // Method implementation
      throw new RemoteException();
   }
   //Remainder of class definition
}



---
try{
   // 程序代码
}catch(异常类型1 异常的变量名1){
   // 程序代码
}catch(异常类型2 异常的变量名2){
   // 程序代码
}catch(异常类型2 异常的变量名2){
   // 程序代码
   异常的变量名2.printStackTrace();
}finally{
    // 程序代码 不管怎样都会执行
}
```

## this super

```
class A {
	int i;

	public int a() {
		return 0;
	}
	public A(){}
	public A(int a){
		this();
		this.i = a;
	}
}

public class Test1 extends A {
	int i;
	int a;
	int b;

	public Test1() {
		super(10); // 调用父类构造方法，且必须是构造方法的第一个语句
	}

	public Test1(int a) {
		this();
		this.a = a; // this 指代当前对象
	}

	public Test1(int a, int b) {
		this(a); // this(参数),引用重载方法
		this.b = b;
	}

	public int a() {
		super.a(); // 调用父类中同名方法
		this.i = super.i; // 调用父类同名变量
		return 0;
	}
}


// this.域变量 this.成员方法：在容易混淆的场合，用this指代当前对象
// 子类必定调用父类的构造方法
```
