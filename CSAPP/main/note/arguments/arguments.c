#include "../../include/csapp.h"
/*
* argc 为参数个数(包含文件名)；
* argv 为参数字符串具体内容（argv[0]为文件名，其后为其他的参数）；
* 如 运行 ./arguments -a -b -c:
```
4
参数：
./arguments
-a
-b
-c
环境变量：
XDG_SESSION_ID=2
TERM=cygwin
SHELL=/bin/bash
SSH_CLIENT=10.0.2.2 51491 22
SSH_TTY=/dev/pts/0
USER=vagrant
LS_COLORS=rs=0:di=01;34:ln=01;36
34;42:st=37;44:ex=01;32:*.tar=01
1:*.Z=01;31:*.dz=01;31:*.gz=01;3
jar=01;31:*.war=01;31:*.ear=01;3
:*.gif=01;35:*.bmp=01;35:*.pbm=0
1;35:*.svgz=01;35:*.mng=01;35:*.
.m4v=01;35:*.mp4v=01;35:*.vob=01
5:*.flv=01;35:*.gl=01;35:*.dl=01
35:*.aac=00;36:*.au=00;36:*.flac
00;36:*.oga=00;36:*.spx=00;36:*.
MAIL=/var/mail/vagrant
PATH=/usr/local/sbin:/usr/local/
PWD=/vagrant/c/cs/main/note
LANG=en_US.UTF-8
SHLVL=1
HOME=/home/vagrant
LOGNAME=vagrant
SSH_CONNECTION=10.0.2.2 51491 10
LESSOPEN=| /usr/bin/lesspipe %s
XDG_RUNTIME_DIR=/run/user/1000
LESSCLOSE=/usr/bin/lesspipe %s %
OLDPWD=/vagrant/c/cs
_=./arguments
(null)
Segmentation fault (core dumped)
```
*/
int main(int argc, char* argv[], char *env[]){
    printf("%d\n", argc);
    printf("参数：\n");
    for(int i=0; i < argc; ++i){
        printf("%s\n", argv[i]);
    }

    printf("环境变量：\n");
    for(int i=0; i < env; ++i){
        printf("%s\n", env[i]);
    }
}
