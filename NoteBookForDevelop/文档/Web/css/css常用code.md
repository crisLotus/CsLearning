# 常用布局方法
[css布局](http://www.gbtags.com/gb/track/CSS%E5%B8%83%E5%B1%80.htm)

## 页面中水平局中

    ```
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
## 两列 三列 基于浮动的布局

    ```
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