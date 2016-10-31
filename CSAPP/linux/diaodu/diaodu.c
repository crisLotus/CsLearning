#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <sys/time.h>

typedef struct pcbStruct {
    pid_t pid;
    char name[10];
    int status;
    int type;
    int res;
    int totalTime;
    int runTime;
    int count;
    int prio;
    struct pcbStruct *next;
} PCB;

//定义资源结构
typedef struct resStruct {
    pid_t pid;
    int free;
} Resource;

Resource resource;
PCB *finish, *ready,*tail, *run, *wait, *head; //队列
int N;                          //进程数
int timeSlice=2;                //时间片
int hodeUpTime=3;               //占用资源时间

/*
 * 产生form到to之间的随机数
 */
int randomPrio(double from, double to) {
    return 1+ (int)((to)*rand()/(RAND_MAX+from));
}

/*
 * 就绪队列首个进程投入运行
 */
int runIn() {
    run = ready;
    run->status = 1;
    ready = ready->next;
    return 0;
}

int main(void) {
    return 0;
}
