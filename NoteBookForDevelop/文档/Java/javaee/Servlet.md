# Servlet filter listener定义映射方法方法
```
通过@WebInitParam为*初始化参数
改配置文件 @WebServlet ServletContext.addServlet
改配置文件 @WebFilter ServletContext.addFilter
改配置文件 @WebListener ServletContext.addListener
```

# Servlet异步支持
@WebServlet(urlPaterns='', asyncSupported=true)

# Servlet创建方法
## 创建extends HttpServlet的类，并实现doGet等方法
```java
public class WelcomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		out.println("tttttt");
	}
}
```

## 改配置：/WEB-INF/web.xml
```xml
<servlet>
  <servlet-name>WelcomeServlet</servlet-name>
  <servlet-class>servlets.WelcomeServlet</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>WelcomeServlet</servlet-name>
  <url-pattern>/servlets/WelcomeServlet</url-pattern>
</servlet-mapping>
...
```

## 绑定Servlets其他方法
```
改配置文件 @WebServlet ServletContext.addServlet
```
# 获得各种内建变量
```
PrintWriter out = response.getWriter()
HttpSession session = request.getSession()
ServletContext application = this.getServletContext()
```

# 获取配置参数
```
String str = application.getInitParameter("Paramete-name");
```

# 过滤器
## 实现javax.servlet.Filter; destroy doFilter init
## 修改web.xml文件
```
<filter>
  <filter-name>TestFilter</filter-name>
  <filter-class>servlets.TestFilter</filter-class>
</filter>
<filter-mapping>
  <filter-name>TestFilter</filter-name>
  <url-pattern>/*</url-pattern>
</filter-mapping>
```

# 安全
# 资源打包
# 错误映射
```
<error-page>
  <error-code>404</error-code>
  <location>/error.jsp</location>
</error-page>

<error-page>
  <exception-type>MyException</exception-type>
  <location>/error.jsp</location>
</error-page>
```
# @MultipartConfig

# 从servlet保存数据跳转到jsp文件 呈现数据
<!-- Servlet -->
String s = "testString";
request.setAttribute("name", s);  //添加数据
ServletContext application = this.getServletContext();
RequestDispatcher rd = application.getRequestDispatcher(path);
rd.forward(request, response);
<!-- *.jsp -->
<%=request.getAttribute("name")%> //显示数据

response.sendRedirect("/javaeeGenerator/test.jsp");
RequestDispatcher rd = application.getRequestDispatcher("/firstservletgetpara.jsp");

## 同一会话保存的数据
session.setAttribute() session.getAttribute()
## 一次请求内存的数据
request.setAttribute("name", s);  request.getAttribute("name")
