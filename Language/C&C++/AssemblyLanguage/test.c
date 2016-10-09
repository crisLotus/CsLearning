#include <stdio.h>

int a(int i) {
  if(i == 1) {
    return 1;
  }
  return 1 + a(i-1);
}

int main(){

}
