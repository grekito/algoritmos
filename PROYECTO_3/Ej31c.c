#include <stdio.h>

int main() {
  int x, y;

  printf("Ingrese el valor de x: ");
  scanf("%d", &x);

  printf("Ingrese el valor de y: ");
  scanf("%d", &y);

  y = y + y;
  x = x + y;

  printf("x = %d, y = %d\n", x, y);
  return 0;
}
