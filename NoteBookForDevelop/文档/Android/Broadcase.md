# 系统全局广播

跨进程进行通信

## 接受广播

### 接受自定义广播

```
1. 继承BroadcaseReceiver后，重写onReceiver方法
@Override
public void onReceive(Context context, Intent intent) {...}
2. 在AndroidManifest.xml中注册广播
<application>
    <receiver android:name=".ReceiverClassName">
        <intent-filter>
            <action andoid:name="com.example.broadcasetest.MY_BROADCAST"></action>
        </intent-filter>
    </receiver>
</application>
```

### 接受有序广播

```
1. 在AndroidManifest.xml中注册广播是添加BroadcastReceiver的优先级， 静态注册
<receiver android:name=".ReceiverClassName">
    <intent-filter android:priority="100">
        <action andoid:name="com.example.broadcasetest.MY_BROADCAST"></action>
    </intent-filter>
</receiver>
2. 在优先级较高的Receiver中使用abortBroadcast();会阻止低于本Receiver权限的Receiver接受广播
使用sendOrderedBroadcase()发送有序广播
```

## 发送广播
```
Intent intent = new Intent("com.example.broadcasetest.MY_BROADCAST");
sendBroadcase(intent);
```

# 本地广播
