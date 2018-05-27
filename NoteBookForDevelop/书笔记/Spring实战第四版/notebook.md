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
    * @Import   javaConfig
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

### 实验设计
* 手动装配
    * 使用@Bean
* 自动装配 使用@ComponentScan自动扫描指定路径的类，验证自动扫描beanid
* 给组件扫描的bean命名
* 自动装配的歧义性
* 条件生效 Bean
* bean作用域
* profile

## 面向切面 AOP
**Spring只支持方法级别的连接点？**

spring AOP常见概念
通知（advice）
切点（pointcut） 类和方法
连接点（join point）这个点可以是调用方法时、抛出异常时、甚至修改一个字段时
切面（Aspect） 通知和切点的结合——是什么，在何时和何处完成其功能
引入（Introduction）向现有的类添加新方法或属性
织入（Weaving）切面应用到目标对象并创建新的代理对象的过程

Spring切面可以应用5种类型的通知：
前置通知（Before）：在目标方法被调用之前调用通知功能；
后置通知（After）：在目标方法完成之后调用通知，此时不会关心方法的输出是什么；
返回通知（After-returning）：在目标方法成功执行之后调用通知；
异常通知（After-throwing）：在目标方法抛出异常后调用通知；
环绕通知（Around）：通知包裹了被通知的方法，在被通知的方法调用之前和调用之后执行自定义的行为。

Spring提供了4种类型的AOP支持：
基于代理的经典Spring AOP；
纯POJO切面；
@AspectJ注解驱动的切面；
注入式AspectJ切面（适用于Spring各版本）

简单的例子：
```java
// 首先创建被切类：
public interface Performance {
    public void perform();
}
@Service //1 一定要加@Service
public class PrintPerform implements Performance {
    @Override
    public void perform() {
        System.out.println("PrintPerform");
    }

}
// 切面： 请注意我的Pointcut表达式中包路径名
@Aspect
@Component
public class Audience {
    @Pointcut("execution(* org.exfly.demo.aop.Performance.perform(..))")
    public void performance() {
    }
    
    @Before("performance()")
    public void silenceCellPhone() {
        System.out.println("Silencing cell phones");
    }
     
    @Before("performance()")
    public void takeSeats() {
        System.out.println("Taking seats");
    }

    @AfterReturning("performance()")
    public void applause() {
        System.out.println("CLAP CLAP CLAP");
    }

    @AfterThrowing("performance()")
    public void demandRefund() {
        System.out.println("Demanding a refund");
    }
}
//配置：请注意我的包路径名
@Configuration
@EnableAspectJAutoProxy
@ComponentScan(basePackageClasses={org.exfly.demo.aop.Audience.class})
public class AopConfig {

}
//测试一下
@RunWith(SpringRunner.class)
@ContextConfiguration(classes= {org.exfly.demo.aop.config.AopConfig.class})
public class PrintPerformTest {
    @Autowired
    private Performance p;
    @Test
    public void testAop() {
        p.perform();
    }
}
```
一点总结：
犯了一个很傻的问题：我们知道，spring自己对Bean进行管理，（EnableAspectJAutoProxy），所以所有执行的依赖必须通过@Autowired进行自动注入，否则spring无法注入，导致出错，即如果，单纯自己new一个Performance，之后调用方法，不会输出想要的结果。一定要深入理解spring中AOP实现的几种形式，才能很好的使用AOP

## spring web
```java
//传进的model最后对peoplelist.jsp文件可见
@RequestMapping
public String getpeople(Model model){
    model.put("t", Oject);
    return "peoplelist";
}

//会根据请求url进行渲染相应的jsp文件
@RequestMapping
public People getPeople() {
    return object;
}
```
### 请求参数处理
```java
@RequestMapping(method=RequestMethod.GET)
public List<Sp> sps(@RequestParam("max") long max, @RequestParam("count") int count){
    return service.find(max, count);
}
@RequestMapping(value="/{splid}", method=RequestMethod.GET)
public String spit(@PathVariable("splid")long splid, Model model) {
    model.addAttribute();
    return "split";
}

// 处理表单

```
