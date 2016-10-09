# 两列左侧自适应
```
.container {
	position: relative;//每个容器中的元素不允许一处
    box-sizing:border-box;
    width:85%;
    min-width: 35rem;
    margin:auto;
}
.left {
    width:100%;
    margin-right:20rem;
    float: left;
}
.right {
    position: absolute;
    right:0;
    width: 20rem;
}

<div class="container">
  <div class="right">left</div>
  <div class="left">right</div>
</div>
```
