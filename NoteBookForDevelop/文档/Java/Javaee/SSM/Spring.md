# Spring简介
* 功能核心容器，数据访问/集成，Web，AOP（面向切面​​的编程），植入(Instrumentation)，消息传输和测试
* ![Spring框架结构](https://lfvepclr.gitbooks.io/spring-framework-5-doc-cn/content/assets/spring-overview.png.pagespeed.ce.XVe1noRCMt.png)

* 依赖注入
* 控制反转 IOC
* AOP(Aspect Oriented Programming) 意为：面向切面编程

# 
@Component：一个泛化的概念，表示一个组件（Bean），可作用在任何层次
@Controller：用于对Controller实现类进行标注，目前该功能与Component相同
@Repository：用于对DAO实现类进行标注
@Service：用于对Service实现类进行标注，目前该功能与Component相同

# AOP

# 静态资源访问
```
<mvc:resources mapping="/static/**" location="static/"/>
<c:url value="/static/bootstrap/css/bootstrap.css" />

<c:set var="path" value="${pageContext.request.contextPath}"/>
${path}/static/jquery-3.1.1.min.js
```

# 测试
