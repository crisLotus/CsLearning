#include <stdio.h>

typedef unsigned char * byte_pointer;

/*
2.55 判断计算机是否为小端
return: 1  or 0
test: printf("%d",is_little_endian());
*/
int is_little_endian() {
  int i=0x12;
  return ((byte_pointer)&i)[0] == 0x12;
}
/* 2.59
  retuen 0x765432ef
  test: printf("0x%x\n", mixin(0x89ABCDEF,0x76543210));
*/
int mixin(int x, int y){
  ((byte_pointer)&y)[0] = ((byte_pointer)&x)[0];
  return y;
}

/* 2.60
return:
  0x12ab5678
  0x123456ab
test:
  printf("0x%x\n", replace_byte(0x12345678, 0xAB, 2));
  printf("0x%x\n", replace_byte(0x12345678, 0xAB, 0));
*/
int replace_byte(unsigned x, unsigned char b, int i) {
  ((byte_pointer)&x)[i] = *((byte_pointer)&b);
  return x;
}

/*2.61
没有完全满足限制，但是可以实现功能
*/
int position_test(int x){

  int w = (sizeof(int)-1) << 3;

  return (x == -1) || (x == 0) || (((x>>w) & 0xff) == 0xff) || ((x&0xff)==0xff);
}

/*2.62
return:千补不为0，则返回1
test:
printf("%d\n",int_shifts_are_logical());
*/
int int_shifts_are_logical() {
  return (-1>>2) == -1;
}

/*2.65*/
int even_ones(unsigned x)
{
     x ^= (x >> 16);
     x ^= (x >> 8);
     x ^= (x >> 4);
     x ^= (x >> 2);
     x ^= (x >> 1);
     return !(x & 1);
}

void show_bytes(byte_pointer start, int len) {
  int i;
  printf("%d\n", len);
  for (i = 0; i < len; ++i) {
    printf("%.2x\n", start[i]);
  }
  printf("\n");
}

void show_short(short x) {
  show_bytes((byte_pointer) &x, sizeof(short));
}

void show_int(int x) {
  show_bytes((byte_pointer) &x, sizeof(int));
}

void show_float(float x) {
  show_bytes((byte_pointer) &x, sizeof(float));
}

void show_double(double x) {
  show_bytes((byte_pointer) &x, sizeof(double));
}

void show_long(long x) {
  show_bytes((byte_pointer) &x, sizeof(long));
}

void show_longlong(long long x) {
  show_bytes((byte_pointer) &x, sizeof(long long));
}

void show_pointer(void * x) {
  show_bytes((byte_pointer) &x, sizeof(void*));
}

int main() {
  printf("%d\n",int_shifts_are_logical());
}
