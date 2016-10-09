[前端知识体系](http://my.oschina.net/hxwny/blog/499513)

[前端学习](https://github.com/qiu-deqing/FE-learning)

[前端资源](https://github.com/JacksonTian/fks)

[bootstrap](http://www.zhihu.com/question/37946473/answer/93067448)

[adminlte bootstrap](https://www.almsaeedstudio.com/themes/AdminLTE/documentation/index.html)

[almsaeed studio](https://www.almsaeedstudio.com/)

[css组件库](http://www.uibox.in/)

[**菜鸟教程css**](http://www.runoob.com/css/css-positioning.html)

[**CSS 实例**](http://www.runoob.com/css/css-examples.html)

[html css 入门](http://edu.51cto.com/index.php?do=lession&id=55960)

[html5/css3响应式布局介绍及设计流程](http://www.51xuediannao.com/html+css/htmlcssjq/694.html)

# CSS文档结构
  - 一般样式
    * 主体样式
    * reset样式
    * 链接
    * 标题
    * 其他元素
  - 辅助样式
    * 表单
    * 通知和错误
    * 一致的条目
  - 页面结构
    * 标题 页脚 导航
    * 布局
    * 其他页面结构元素
  - 页面组件
    * 各个页面
  - 覆盖

```
/* @group general styles  */
/* @group helper styles   */
/* @group page structure  */
/* @group page components */
/* @group overrides       */
```

```
@todo
@workaround:
@bugfix
```

# css基本语法
## 选择器
### 嵌套选择器
```
    p {}
    .marked {}
    .marked p {}
```
* 后代选取器(以空格分隔)          ```div p { }```
* 子元素选择器(以大于号分隔）      ```div>p { }```
* 相邻兄弟选择器（以加号分隔）     ```div+p { }```
* 普通兄弟选择器（以破折号分隔）   ```div~p { }```


* 伪类（pseudo-classes）
    - selector:pseudo-class {property:value;}
    - selector.class:pseudo-class {property:value;}
    - anchor伪类
        + a:link {color:#FF0000;}       /* 未访问的链接 */
        + a:visited {color:#00FF00;}    /* 已访问的链接 */
        + a:hover {color:#FF00FF;}      /* 鼠标划过链接 */
        + a:active {color:#0000FF;}     /* 已选中的链接 */
    - CSS - :first-child伪类
        ```
            <html>
            <head>
            <style>
            p:first-child
            {
            color:blue;
            }
            </style>
            </head>

            <body>
            <p>I am a strong man.</p>
            <p>I am a strong man.</p>
            </body>
            </html>
        ```
    - CSS - :lang 伪类
* 伪元素
    - selector:pseudo-element {property:value;}
    - selector.class:pseudo-element {property:value;}
    - :first-line 伪元素 ```p:first-line {}```
    - :first-letter 伪元素```p:first-letter {}```
    - CSS - :before 伪元素
    - CSS - :after 伪元素
    ```
      所有的为类/元素
        :link	a:link	选择所有未访问链接
        :visited	a:visited	选择所有访问过的链接
        :active	a:active	选择正在活动链接
        :hover	a:hover	把鼠标放在链接上的状态
        :focus	input:focus	选择元素输入后具有焦点
        :first-letter	p:first-letter	选择每个<p> 元素的第一个字母
        :first-line	p:first-line	选择每个<p> 元素的第一行
        :first-child	p:first-child	选择器匹配属于任意元素的第一个子元素的 <]p> 元素
        :before	p:before	在每个<p>元素之前插入内容
        :after	p:after	在每个<p>元素之后插入内容
        :lang(language)	p:lang(it)	为<p>元素的lang属性选择一个开始值
        :nth-child(1)
    ```
* CSS 属性 选择器
    - 属性选择器  ```[title] { }```
    - 属性和值选择器```[title=w3cschool] { }```
    - 属性和值的选择器-多值
        ```[title~=hello] { }
           [lang|=en] { }
        ```


## 常用标签的属性
* CSS Display(显示) 与 Visibility（可见性）
```
    隐藏元素 - display:none或visibility:hidden
    inline block
        li {display:inline;}
        span {display:block;}
```

* positioning
    - static
        + HTML元素的默认值，即没有定位，元素出现在正常的流中
        + 静态定位的元素不会受到top, bottom, left, right影响
    - fixed **固定定位**
        + 元素的位置相对于浏览器窗口是固定位置
        + Fixed定位使元素的位置与文档流无关，因此不占据空间
        + Fixed定位的元素和其他元素重叠
    - relative
        + **相对定位** 元素的定位是相对其正常位置
        + 可以移动的相对定位元素的内容和相互重叠的元素，它原本所占的空间不会改变
        + 相对定位元素经常被用来作为绝对定位元素的容器块
    - absolute
        + **绝对定位** 的元素的位置相对于最近的已定位父元素，如果元素没有已定位的父元素，那么它的位置相对于<html>
        + Absolutely定位使元素的位置与文档流无关，因此不占据空间。
        + Absolutely定位的元素和其他元素重叠
    - 重叠的元素
        + 元素的定位与文档流无关，所以它们可以覆盖页面上的其它元素
        + z-index属性指定了一个元素的堆叠顺序（哪个元素应该放在前面，或后面）
        + 一个元素可以有正数或负数的堆叠顺序
* CSS float(浮动)
    - left
    - right
    - clear
* overflow 默认内容溢出到框外
* 块元素水平对齐布局
    + 中心对齐,使用margin属性
        ```
            .center {
            margin-left:auto;
            margin-right:auto;
            width:70%;
            background-color:#b0e0e6;
            }
        ```
    + 使用position属性设置左，右对齐
        ```
            .right
            {
            position:absolute;
            right:0px;
            width:300px;
            background-color:#b0e0e6;
            }
        ```
    + 使用float属性设置左，右对齐
        ```
            .right
            {
            float:right;
            width:300px;
            background-color:#b0e0e6;
            }
        ```






# css3 基本属性
选择器
盒模型
背景和边框
文字特效
2D/3D转换
动画
多列布局
用户界面
## 通过盒模型布局
[深入理解 CSS3 弹性盒布局模型](http://www.ibm.com/developerworks/cn/web/1409_chengfu_css3flexbox/)
* display: flex;

* flex-direction
    - row（默认值）	主轴为水平方向。排列顺序与页面的文档顺序相同。如果文档顺序是 ltr，则排列顺序是从左到右；如果文档顺序是 rtl，则排列顺序是从右到左。
    - row-reverse	主轴为水平方向。排列顺序与页面的文档顺序相反。
    - column	主轴为垂直方向。排列顺序为从上到下。
    - column-reverse	主轴为垂直方向。排列顺序为从下到上。
默认情况下，弹性盒容器中的条目会尽量占满容器在主轴方向上的一行。当容器的主轴尺寸小于其所有条目总的主轴尺寸时，会出现条目之间互相重叠或超出容器范围的现象。CSS 属性"flex-wrap"用来声明当容器中条目的尺寸超过主轴尺寸时应采取的行为。"flex-wrap"属性的可选值及其

* flex-wrap
    nowrap（默认值）	容器中的条目只占满容器在主轴方向上的一行，可能出现条目互相重叠或超出容器范围的现象。
    wrap	当容器中的条目超出容器在主轴方向上的一行时，会把条目排列到下一行。下一行的位置与交叉轴的方向一致。
    wrap-reverse	与 wrap 的含义类似，不同的是下一行的位置与交叉轴的方向相反
可以使用"flex-flow"属性把"flex-direction"和"flex-wrap"结合起来```flex-flow: row wrap;```
