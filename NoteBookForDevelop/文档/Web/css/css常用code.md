# 常用布局方法
[css布局](http://www.gbtags.com/gb/track/CSS%E5%B8%83%E5%B1%80.htm)

## 清楚浮动

```css
/* 在最后一个直接子元素后添加内容; */
t::after {
  content: "";
  display: table;
  clear: both;
}
```

## 页面中水平局中

```css
	block元素：
    .center {
        width: 85%;
        margin: 0 auto;
    }

	inline元素：
    .center2 {
        text-align: center;
    }

```

## [水平+垂直居中](http://www.haorooms.com/post/css_div_juzhong)

```css
.center {
  position: absolute;
  top: 50%;
  left: 50%;
  background-color: #000;
  width:50%;
  height: 50%;
  -webkit-transform: translateX(-50%) translateY(-50%);
}

```

## 两列 三列 基于浮动的布局

```css
两列：
.content .primary {
  width: 650px;
  padding-right: 20px;
  float: right;
  display: inline;

  background-color: #1cc7ff;
}

.content .secondary {
  width: 230px;
  float: left;
  display: inline;

  background: #000;
}

.content {
  overflow:hidden;
}
<div class="content">
    <div class="primary">aaaaaaaaaaaaaaaa</div>
    <div class="secondary">bbbbbbbbbbbbbbbb</div>
</div>
```

## 创建补丁宽度 流式和弹性布局

### 流式布局

## 创建高度相等的列

## CSS框架与CSS系统
