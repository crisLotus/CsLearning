# Spring实战第四版 笔记
> POJO JavaBean

Spring采取了以下4种关键策略：
	* 基于POJO的轻量级和最小侵入性编程；
	* 通过依赖注入和面向接口实现松耦合；
	* 基于切面和惯例进行声明式编程；
	* 通过切面和模板减少样板式代码。

DI依赖注入 
AOP面向切面 AspectJ

spring装配Bean方式：
```java
* XML
<bean id="greetingService" class="package.to.GreetingServiceImpl">
    <property name="greeting" value="Buenos Dias!" />
  </bean>
* java
@Configuration
public lcass KnConfig {
	@Bean 
	public Kn knight() {
		return new BraveKnight(quest());
	}
}
 ```
	}
}
