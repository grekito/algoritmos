#include <stdio.h>

int main() {
  int x, y, i;

  printf("Ingrese el valor de x:");
  scanf("%d", &x);

  printf("Ingrese el valor de y:");
  scanf("%d", &y);

  printf("Ingrese el valor de i:");
  scanf("%d", &i);

  i = 0;

  while (x >= y) {
    x = x - y;
    i = i + 1;
  }

  printf("x = %d, y = %d, i = %d\n", x, y, i);
  return 0;
}
