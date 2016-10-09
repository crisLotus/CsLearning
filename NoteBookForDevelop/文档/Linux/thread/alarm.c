#include <signal.h>
#include <stdio.h>
#include <unistd.h>

static int alarm_fired = 0;

void ding(int sig)
{
    alarm_fired = 1;
}


int main()
{
    int pid;

    printf("闹钟程序已经启动\n");
    /*子进程休眠5秒后向父进程发送SIGALARM信号，然后结束进程*/
    if((pid = fork()) == 0) {
        sleep(5);
        kill(getppid(), SIGALRM);
        exit(0);
    }

  /*父进程执行的内容*/
    printf("5秒后闹铃启动\n");
    (void) signal(SIGALRM, ding);
    /*将运行的程序挂起，直到接收到信号为止*/
    pause();
    if (alarm_fired)
        printf("Ding!\n");

    printf("done\n");
    exit(0);
}
