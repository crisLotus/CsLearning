# Spring实战第四版 笔记
> POJO JavaBean

Spring采取了以下4种关键策略：
	* 基于POJO的轻量级和最小侵入性编程；
	* 通过依赖注入和面向接口实现松耦合；
	* 基于切面和惯例进行声明式编程；
	* 通过切面和模板减少样板式代码。

DI依赖注入 
AOP面向切面 AspectJ

## spring注解
* @Configuration 当前类是一个配置类
	* @Import 	javaConfig
	* @ImportResource xml
* @Component Named 告知Spring要为这个类创建bean
	* @Component("compomentName") 为bean指定id
* @ComponentScan 组件扫描 扫描这个包以及这个包下的所有子包
	* 自动指定bean的id为：类名的第一个字母变为小写
	* @ComponentScan("packageName") @ComponentScan(basePackages={"packageName", "o"}) @ComponentScan(basePackageClasses={One.class, Two.class})
* @ContextConfiguration 加载配置，在Spring中进行Junit时使用

* @Autowired @Inject 属性 构造器 set方法
* @Conditional 条件化Bean

## Bean
### bean作用域
* Singleton 默认 只创建一个实例
* Prototype    每次创建新的实例
* Session  每个会话创建一个实例
* Request  每个请求创建一个实例
```java
@Component
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class Notepad{}
```
```xml
<bean id="notepad" class="" scope="prototype" />
```

### 运行时值注入
* 属性占位符 ${} 
* SpEL #{}
```java
@Configuration
@PropertySource("classpath:/path/to/app.properties")
public class ExpressiveConfig {
	@Autowired
	Environment env;
	@Bean
	public BlankDisc disc() {
		return new BlankDisc(env.getProperty("disc.title"))
	}
}
```

### spring装配Bean方式：
* XML显示配置
	* <constructor-arg ref="beanId" /> 将一个ID为beanId的bean引用传递到类的构造器中
```xml
<bean id="greetingService" class="package.to.GreetingServiceImpl">
  <property name="greeting" value="Buenos Dias!" />
</bean>
```
* java显示配置
	* bean的id与带有@Bean注解的方法名一样
	* @Bean(name="newName") 如此为bean命名
```java
@Configuration
public class KnConfig {
	@Bean
	public Kn knight() {
		return new BraveKnight(quest());
	}
}
```
* 隐式bean发现机制
	* 组建扫描 java:@ComponentScan xml:<context:component-scan base-package="youpack">
	* 自动装配

* 高级装配
* Profile
```java
@Configuration
public class KnConfig {
	@Bean
	@Profile("dev")
	public Kn knight() {
		return new BraveKnight(quest());
	}
	@Bean
	@Profile("prod")
	public Kn knight() {
		return new BraveKnight(quest());
	}
}
```
* 激活profile
	* spring.profiles.default
	* spring.profiles.active
	* @ActiveProfiles
	* @Conditional
* Conditional bean条件生效
```java
@Bean
@Conditional(MagitExistsCondition.class)
public MagicBean magicBean(){
	return new MagitBean();
}
public class MagitExistsCondition  implements Condition {
	boolean matches(ConditionContext ctxt, AnnotatedTypeMetadat metadate){
		Environment env = ctxt.getEnvironment();
		return env.containsProperty("magic");
	}
}
```
* Bean消歧
	* primary
	* 限定符@Qualifier("BeanId") 
	* 自定义限定符注解

# 实验设计
* 手动装配
	* 使用@Bean
* 自动装配 使用@ComponentScan自动扫描指定路径的类，验证自动扫描beanid
* 给组件扫描的bean命名
* 自动装配的歧义性
* 条件生效 Bean
* bean作用域
* profile
