#include <signal.h>
#include <stdio.h>
#include <unistd.h>

int main(){

  pid_t pid;
  pid = fork();
  if(0 == pid)
  {
    for(;;)
    {
      printf("child!\n");
    }

  }
pause();
  for(;;)
  {
    printf("parent!\n");
  }
  return 0;
}
