```
ThreadLocal<String> tl = new ThreadLocal<>()
public class ThreadTest implements Runnable {
    @Override
    public void run() {
    }
}
ThreadTest tt = new ThreadTest();
Thread thread = new Thread(tt);
thread.start();
// 不同种同步方式
public synchronized void synMethod() {}
public int synMethod() {
    synchronized(this) {
    }
}
private byte [] lock = new byte[1];
public void synMethod() {
    synchronized(lock){}
}
final ReentrantLock lock = new ReentrantLock();
lock.lock();// 加锁
lock.unlock(); // 解锁
private final ReentrantReadWriteLock rwl = new ReentrantReadWriteLock();
rwl.readLock().lock();
rwl.readLock().unlock();
rwl.writeLock().lock();
rwl.writeLock().unlock(); // 释放写锁，最好放在finnaly里面
private final StampedLock sl = new StampedLock();
long stamp = sl.writeLock();
long stamp = sl.readLock();
sl.unlockWrite(stamp);
sl.tryOptimisticRead();
```

# 基本的带线程池的生产者消费者模式
[LinkedBlockingQueue生产者消费者+ConcurrentLinkedQueue的CAS](http://www.cnblogs.com/linjiqin/archive/2013/05/30/3108188.html)
```java
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
/**
 * 基于Executor的服务器
 */
public class TaskExecutionServer {
    private static final int THREAD_COUNT = 100;
    private static final Executor exec = Executors.newFixedThreadPool(THREAD_COUNT);
    public static void main(String[] args) throws IOException {
        ServerSocket server = new ServerSocket(9911);
        while (true) {
            final Socket client = server.accept();
            Runnable task = new Runnable() {
                @Override
                public void run() {
                    handleReq(client);
                }
            };
            exec.execute(task);
        }
    }
    protected static void handleReq(Socket client) {}
}
```