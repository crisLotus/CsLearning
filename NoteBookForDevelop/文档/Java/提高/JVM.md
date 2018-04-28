# Java
学习Java底层时候做的实验，并得出的实验结论以及笔记

## JVM内部机制
* JVM
	* 抽象规范
	* 一个具体的实现
	* 一个运行中的虚拟机实例

### jvm平时使用参数
```
-verbose:gc 
-Xloggc:filename # 将日志存到文件
-Xms20M -Xmx20M 
-XX:+PrintGCDetails 
-XX:+TraceClassLoading # 查看类加载
-XX:+HeapDumpOnOutOfMemoryError

linux less -f 
```

### JVM架构
[javase规范](https://docs.oracle.com/javase/specs/index.html)
#### 类加载器子系统（Class Loader Subsystem）
java.lang.ClassLoader为抽象类，所有类加载器必须实现该类
类加载其有如下两种：
* 启动类装载器
* 用户自定义类装载器
	* 系统类装载器

不同类装载器会放在虚拟机内部的不同命名空间中

类加载器执行过程：装载 链接 初始化 启动类装载器 用户自定义类装载器 

* ClassLoader. defineClass将类导入方法区
* ClassLoader.resolveClass链接方法区中的类

#### 运行时数据区（Runtime Data Area）
* 方法区
	* 可以被垃圾收集
* 堆
* Java栈
* PC寄存器 共一个字长，为了放下一个returnAddress
* 本地方法栈

讲解：
* [这个博客](http://www.cnblogs.com/caca/p/jvm_stack_frame.html)对运行时数据区整理的挺好，可以直接看这里
* Boolean属于基本类型，在JVM中用int表示。
* 基本类型：数值类型，boolean， returnAddress
* 引用类型：类类型，接口类型，数组类型

#### 执行引擎（Execution Engine）

### [Class文件格式](https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html)
* 查看字节码 javap –c和javap –verbose

### 类加载机制：双亲委托模型:流程
查看jvm加载类log：-XX:+TraceClassLoading

类加载，具体**步骤**：
1. 装载 
2. 链接: 检查 准备 解析 
3. 初始化

几个**概念**；
* 启动类加载器：对系统类(javaAPI)的安装路径中的类进行加载；有C++实现
* 扩展类加载器和自定义类加载器：在类路径下查找的类
* 命名空间：由不同类加载器加载的类属于不同的命名空间；在相同命名空间中的类允许相互交互；显示提供交互机制，不同命名空间的类才可以进行交互

**类的装载**：
1. 通过类的完全限定名产生一个代表该类型的二进制数据流
2. 解析这个二进制流为方法区内的内部数据结构
3. 创建一个表示该类型的java.lang.Class类的实例

**链接**：
1. 检查
2. 准备：为类变量分配内存，设置默认初始值，没有进行真正的初始值

**解析**：
在类型的常量池中寻找类、接口、字段和方法的符号引用，替换成直接引用

**初始化**：
通过<clinit>进行静态变量等的初始化

### 类加载机制
#### 基础
* ClassLoader与加载类相关的方法
	* getParent 
	* loadClass 加载类，返回Class实例，即一个类型 抛出ClassNotFoundException
	* findClass 查找类，返回Class实例
	* findLoadedClass 返回已经被加载过的类
	* defineClass 把字节数组中内容转化为Java类，返回Class实例 抛出 NoClassDefFoundError
	* resolveClass 链接指定的类
* 类加载器分类：
	* 系统提供
		* bootstrap class loader 加载Java核心类
		* Extensions class loader 加载JVM实现提供的扩展库
		* System class Loader 	加载用户的类。可以通过ClassLoader.getSystemClassLoader()获得
	* 用户自定义
		* 继承java.lang.ClassLoader类实现自己的类加载器，父加载器为系统类加载器
		* 用户定义自己的类加载器时，为了符合双亲委托模式，重载findClass方法即可
* 类加载的代理模式 双亲委托机制
	* jvm如何判断两个类是否相同：类的全名相同+类加载器相同
	* 双亲委托机制:特定类加载器加载类时，先将任务委托给父类加载器，一次追溯，如果父类加载器完成加载任务，就成功返回；父失败后才自己加载
* 线程上下文类加载器
	* getContextClassLoader() set
	* ?怎么用
* Class.forName
	* 常用来加载数据驱动之类的情况使用

## Java内存管理
涉及到的区域：寄存器 栈 堆 静态域 常量池 非RAM存储。
对象的访问：通过引用，方式有：句柄和直接指针。

* 堆溢出 无限list.add(new Object); -verbose:gc -Xms20M -Xmx20M -XX:+PrintGCDetails -XX:+HeapDumpOnOutOfMemoryError
* 虚拟机栈和本地方法栈溢出 无限递归调用 void t(){t()}; -Xoss
* 运行时常量池 String.intern()方法
* 方法区溢出 使用CGLib Enhancer对象的create
* 本地直接内存 -XX:MaxDirectMemorySize Unsafe.allocateMemry;

### 垃圾收集算法
* Java使用分代收集算法，将heap分为两代:新生代和老年代。老年代使用标记整理算法，新生代使用标记复制算法
* 新生代使用的标记-复制算法：将内存分成三部分，一个较大的Eden和两个较小的Survivor。当回收的时候将Eden和Survivor中存货的对象一次性拷贝到另外一块Survivor中，最后清理Eden和刚用过的Survivor。Eden:from survivor:to survivor=8:1:1.当Survivor空间不够用时候，需要老年代进行分配担保
* 每个jvm实现都实现了多个垃圾收集器，没有最好的收集器。不同应用场景使用不同的组合比较好

### Java内存模型
* java由主内存，主内存由多个线程共享，每个线程由自己的工作内存
	* 从主内存复制变量到当前工作内存
	* 执行代码，改变共享变量值
	* 用工作内存数据刷新主存相关的内容

### 插入式注解处理器
## 运行期优化
## 常识性
* public类相同文件中定义的默认访问属性了类，编译后会产生同名.class文件
```java
public class MainRun {
	class MainRunInnerClass{}
	static class MainRunInnerStaticClass{}
}
class MainRunSameFile{}

/* 编译后产生的文件名
MainRun.class
MainRun$MainRunInnerClass.class
MainRun$MainRunInnerStaticClass.class
MainRunSameFile.class
*/

```
* 类的多态性由invokevirtual指令的多态性查找实现