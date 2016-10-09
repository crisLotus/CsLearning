#include <stdio.h>
#include "log.h"
int main(){
    loginit();
    loglog("hello!");
    log_close();
}
