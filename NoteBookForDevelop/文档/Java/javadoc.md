[知乎 - java学习路线](http://www.zhihu.com/question/19851109)

[java MineKnowContainer](https://github.com/pzxwhc/MineKnowContainer)

# 抽象类

# interface

## abstract interface 比较

语法层面：
```
abstract class Demo ｛
	abstract void method1();
	abstract void method2(); 
｝
interface Demo { 
	void method1(); 
	void method2();
} 

在abstract class方式中，
	Demo可以有自己的数据成员
	有非abstarct的成员方法
在interface方式的实现中，
	Demo只能够有静态的不能被修改的数据成员（也就是必须是static final的，不过在interface中一般不定义数据成员）
	所有的成员方法都是abstract的，不能拥有默认行为
```
