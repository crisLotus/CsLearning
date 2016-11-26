#include <stdio.h>

typedef enum {LEFT, RIGHT=3, a, b} lr;

int main() {
	lr t=LEFT, r=RIGHT, t1=a;
	printf("%x %x %x\n", t, r, t1);

	return 0;
}
