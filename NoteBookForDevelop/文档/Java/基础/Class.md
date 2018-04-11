# Class
描述对象的类型，每个类的实例共用一个Class对象。obj.getClass()可获得Class对象

```
public void testLangClass(){
    Assert.assertTrue(
        new GrammarTest().getClass() instanceof java.lang.Class
    );
}

newInstance();

```
