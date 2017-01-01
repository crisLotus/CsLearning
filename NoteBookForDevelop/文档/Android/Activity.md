# 基本组件
* Activity 用户界面显示的内容
* Intent 在activity之间穿梭

# Activity

## Intent
显式Intent 隐式Intent
tmp: intent可以实现Activity的切换，可以保存一定的数据。那么可以使用Bundle对象保存一些数据，然后将Bundle对象存放到Intent里。到了目标活动之后先从Intent中取得Bundle(intent.getBundleExtra("bundle"))，在从Bundle中获得数据
### 启动一个Activity
```java
// 方法一
Intent inten = new Intent(ThisActivity.this, NextActivity.class);
intent.putExtra("data", data);
startActivity(intent);

//方法二:在每一个Activity中创建带有启动参数的类，由其他的方法去调用
class NextActivity ... {
	public static void activityStart(Context context, data) {
		Intent inten = new Intent(context, NextActivity.class);
		intent.putExtra("data", data);
		startActivity(intent);
	}
}
```

## onSaveInstanceState方法保存当前activity的数据
```java
@Override
protected void onSaveInstanceState(Bundle outState) {
	super.onSaveInstanceState(outState);
	String temp = "some data";
	outState.putString("data_key", temp);
}

@Override
protected void onCreate(Bundle savedInstanceState) {
	supder.onCreate(saveInstatceState);
	setContentView(R.layout.activity_main);
	if(savedInstanceState != null) {
		String temp = savedInstanceState.getString("data_key");
	}
}
```

## 生命周期
```
onCreate onStart onResume onPause onStop onDestroy onRestart
```

## 活动的启动模式
```
standard(default) singleTop singleTask singleInstance
```

## 活动的最佳实践
```java
public class BaseActivity extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.d("BaseActivity", getClass().getSimpleName());//知晓当前是在哪个活动
		ActivityCollector.addActivity(this);
	}
	@Override
	protected void onDestroy() {
		super.onDestroy();
		ActivityCollector.removeActivity(this);
	}
}
public class ActivityCollector {
	public static List<Activity> activities = new ArrayList<Activity>();
	public static void addActivity(Activity activity) {
		activities.add(activity);
	}
	public static void removeActivity(Activity activity) {
		activities.remove(activity);
	}
	public static void finishAll() {
		for (Activity activity : activities) {
			if(!activity.isFinishing()) {
				activity.finish();
			}
		}
	}
}
```
