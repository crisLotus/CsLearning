#include <signal.h>
#include <stdio.h>
#include <unistd.h>

void ouch(int sig)
{      /*此处，signal(SIGINT,  SIG_DFL)，SIG_DFL表示 ouch函数捕获到SIGINT信号，作出输出信息处理之后，恢复了SIGINT的默认行为*/
  printf("OUCH! - I got signal %d\n", sig);
  //(void) signal(SIGINT, SIG_DFL);
}

int main()
{
  (void) signal(SIGINT, ouch);
  while(1)
  {
    printf("Hello World!\n");
    sleep(1);
  }
}
