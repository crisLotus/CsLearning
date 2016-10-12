# scss语法

## 资源
* [scss](http://www.css88.com/doc/sass)
* [Scss](http://www.w3cplus.com/sassguide/)
* [Sass Guidelines 中文](http://wiki.jikexueyuan.com/project/sass-guidelines/)
* [文档](http://www.css88.com/archives/5505)

## 语法
### 文件后缀名 scss
### 导入 @import "colors";
### 变量：普通变量， 默认变量， 特殊变量， 多值变量， 全局变量
### 嵌套：属性嵌套， 普通跳出嵌套，  &:visit 父选择器引用
### 混合(mixin) 
```scss
@mixin center-block($var1, $var2){...}    
@include center-block($var1, $var2);
```

### 函数 @function fun(&var){}
```
$grid-width: 40px;
    $gutter-width: 10px;

@function grid-width($n) {
      @return $n * $grid-width + ($n - 1) * $gutter-width;
}

#sidebar { width: grid-width(5); }


就变成了:
#sidebar {
  width: 240px; }
```
### @content

### 继承 @extend
```
.error {
  border: 1px #f00;
  background-color: #fdd;
}
.seriousError {
  @extend .error;
  border-width: 3px;
}

编译为：
.error, .seriousError {
  border: 1px #f00;
  background-color: #fdd;
}

.seriousError {
  border-width: 3px;
}
```

### 占位选择器 %
当他们单独使用的时候，即没有使用@extend的，使用占位符选择器的规则集将不会被渲染为CSS

### 运算

﻿### 条件判断和循环
