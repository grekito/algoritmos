#include <stdio.h>

int main() {
  int x, y, z, m;

  printf("Ingrese el valor de x:");
  scanf("%d", &x);

  printf("Ingrese el valor de y:");
  scanf("%d", &y);

  printf("Ingrese el valor de z:");
  scanf("%d", &z);

  printf("Ingrese el valor de m:");
  scanf("%d", &m);

  if (x < y) {
    m = x;
  } else if (x >= y) {
    m = y;
  }

  if (m < z) {

  } else if (m >= z) {
    m = z;
  }

  printf("x = %d, y = %d, z = %d, m = %d\n", x, y, z, m);
  return 0;
}
