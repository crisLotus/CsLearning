一 String == 和 equals的区别
	

二 两种实例化方式的区别
[区别](http://www.blogjava.net/min-water/articles/335326.html)
String name1 = "zhangsan";
String name2 = "zhangsan";
String name3 = new String("lisi");
String name4 = new String("lisi");
name1 == name2;//true
name3.equlas(name4);//true


```
public class LearnString {
	public static void main(String[] args) {
		String name1 = "zhangsan";//实例化方式一:先在对象池中创建“zhangsan”，后将引用赋值给name1
		String name2 = new String("zhangsan");//实例化方式二：直接创建对象，并将内容改为“zhangsan”
		String name3 = name2;
		String name4 = "lisi";
		System.out.println(name1==name3);//比较引用  false
		System.out.println(name2==name3);//  true
		System.out.println(name1.equals(name2));//比较内容 true
		System.out.println(name1.equals(name3));//true
		System.out.println(name1.equals(name4));//false
	}
}


//== equal
```
