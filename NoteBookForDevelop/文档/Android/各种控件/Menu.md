# Menu
* 创建xml文件，用来显示菜单的内容
```

```
* 重写Activity方法onCreateOptionsMenu(),显示菜单
```
public boolean onCreateOptionsMenu(Menu menu) {
	getMenuInflater(R.menu.main, menu);
	return true;
}
```

* 重写Activity方法 onOptionsItemSelected(MenuItem item)，添加各菜单点击响应动作
```
public boolean onOptionsItemSelected(MenuItem item) {
	switch(item.getItemId()) {
		case r.id.add_item:
			//something;
			break;
		case r.id.add_item:
			//something;
			break;
		default:
	}
	return true;
}
```
