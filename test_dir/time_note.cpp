#include <stdio.h>
#include <time.h>

int main ()
{
    time_t rawtime;
    struct tm * timeinfo;
    char buffer [128];

    time (&rawtime);
    timeinfo = localtime (&rawtime);

    strftime (buffer,sizeof(buffer),"Now is %Y/%m/%d %H:%M:%S",timeinfo);
    puts (buffer);

    return 0;
}
/*Now is 2015/09/10 22:51:49*/
 
