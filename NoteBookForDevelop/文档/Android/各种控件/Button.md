```
// 定位Button
Button startDialogActivity = (Button) findViewById(R.id.start_dialog_activity);
// 创建Button点击监听器
startDialogActivity.setOnClickListener(
    new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent intent = new Intent(MainActivity.this, DialogActivity.class);
            startActivity(intent);
        }
    }
);
```
