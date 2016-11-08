* 引入服务器端字体
```css
@font-face{
    font-family: 'fontawesome';               /*自定义字体名称*/
    src: url('../fonts/fontawesome-webfont.eot');   /*IE9兼容模式*/
    src: url('../fonts/fontawesome-webfont.eot?#iefix') format('embedded-opentype'),  /*IE6~IE8*/
    url('../fonts/fontawesome-webfont.woff') format('woff'),         /*现代浏览器*/
    url('../fonts/fontawesome-webfont.ttf') format('truetype'),     /*Safari,Android,iOS*/
    url('../fonts/fontawesome-webfont.svg#SingleMaltaRegular') format('svg');   /*Legacy iOS*/
    font-weight: normal;
    font-style: normal;
}

* [检测css支持程度](https://link.zhihu.com/?target=http%3A//caniuse.com/)
