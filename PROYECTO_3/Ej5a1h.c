#include <stdio.h>

int main() {
  int i;

  printf("Ingrese el valor de i:");
  scanf("%d", &i);

  while (i != 0) {
    i = i - 1;
  }

  printf("i = %d\n", i);
  return 0;
}
