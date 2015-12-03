#include<stdio.h>
int main(void){
	printf("NULL=%d\n",NULL);//NULL=0
	printf("_IOFBF=%d _IOLBF=%d _IONBF=%d\n",_IOFBF,_IOLBF,_IONBF);//_IOFBF=0 _IOLBF=64 _IONBF=4
	fscanf(stderr,"asdfasd\n");
	
	return 0;
}
