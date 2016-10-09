
## returnAStruct
```c
#include <stdio.h>

typedef struct { double a,b;} T;
T a(){
    return (T){.a=10.0,.b=20.1};//属于gnu的特性
}
int main(){
    T ta = a();
    printf("%f %f\n", ta.a,ta.b);
}
/*
 > 10.000000 20.100000
 */
```
