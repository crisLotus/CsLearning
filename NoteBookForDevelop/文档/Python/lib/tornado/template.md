[tornado文档](http://docs.pythontab.com/tornado/introduction-to-tornado/)
# 模板语法
```
填充表达式
{{ ', '.join([str(x*x) for x in range(10)]) }}

控制流语句
{% if page is None %}

设置变量
{% set foo = 'bar' %}

在模板中使用函数
escape(s) 替换字符串s中的&、<、>为他们对应的HTML字符
url_escape(s) 使用urllib.quote_plus替换字符串s中的字符为URL编码形式
json_encode(val) 将val编码成JSON格式。（在系统底层，这是一个对json库的dumps函数的调用)
squeeze(s) 过滤字符串s，把连续的多个空白字符替换成一个空格

使用静态文件
<link rel="stylesheet" href="{{ static_url("style.css") }}">

{% extends "main.html" %} # 继承main文件，如下覆盖header快
{% block header %} {% end %}

默认自动过滤的文本可以通过 {% raw mailLink %} 输出不转义的内容

UI模块 http://docs.pythontab.com/tornado/introduction-to-tornado/ch3.html
class SampleModule(tornado.web.UIModule):
    def render(self, sample):
        return self.render_string(
            "modules/sample.html",
            sample=sample
        )

    def html_body(self):
        return "<div class=\"addition\"><p>html_body()</p></div>"

    def embedded_javascript(self):
        return "document.write(\"<p>embedded_javascript()</p>\")"

    def embedded_css(self):
        return ".addition {color: #A1CAF1}"

    def css_files(self):
        return "/static/css/sample.css"

    def javascript_files(self):
        return "/static/js/sample.js"


```

## 异步 @tornado.web.asynchronous
装饰器来告诉Tornado保持连接开启， Tornado永远不会自己关闭连接。你必须在你的RequestHandler对象中调用finish方法来显式地告诉Tornado关闭连接（否则，请求将可能挂起，浏览器可能不会显示我们已经发送给客户端的数据。）

## Cookie
set_secure_cookie()和get_secure_cookie()函数发送和取得浏览器的cookies
self.set_cookie('foo', 'bar', httponly=True, secure=True)
self.clear_cookie("username")

## XSRF
http://docs.pythontab.com/tornado/introduction-to-tornado/ch6.html#ch6-2-1
```
<form action="/purchase" method="POST">
    {% raw xsrf_form_html() %}
    <input type="text" name="title" />
    <input type="text" name="quantity" />
    <input type="submit" value="Check Out" />
</form>
```

AJAX请求也需要一个_xsrf参数

## 用户验证 login_url参数和tornado.web.authenticated装饰器
当Tornado构建重定向URL时，它还会给查询字符串添加一个next参数，其中包含了发起重定向到登录页面的URL资源地址。你可以使用像self.redirect(self.get_argument('next', '/'))这样的行来重定向登录后用户回到的页面

## 常用函数
* self.redirect("/") 重定向
* self.clear_cookie("username") 清理cookie
* set_secure_cookie() get_secure_cookie() 设置cookie
