#include <stdio.h>

int main() {
  int x, y;

  printf("Ingrese el valor de x: ");
  scanf("%d", &x);

  printf("Ingrese el valor de y: ");
  scanf("%d", &y);

  if (x >= y) {
    x = 0;
  } else if (x <= y) {
    x = 2;
  }

  printf("x = %d, y = %d\n", x, y);
  return 0;
}
