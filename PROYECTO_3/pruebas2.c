#include <stdbool.h>
#include <stdio.h>

int main() {
  int x, y, z;

  printf("Ingrese el valor de x: ");
  scanf("%d", &x);

  printf("Ingrese el valor de y: ");
  scanf("%d", &y);

  printf("Ingrese el valor de z: ");
  scanf("%d", &z);

  printf("Resultado para el conjunto de valores dado (x=%d, y=%d, z=%d)\n", x,
         y, z);
  printf("x + y + 1 = %d\n", x + y + 1);
  printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
  printf("y - 2 == (x * 3 + 1) %% 5 = %d\n", y - 2 == (x * 3 + 1) % 5);
  printf("y / 2 * x = %d\n", y / 2 * x);
  printf("y < x * z = %d\n",
         y < x * z); // En esta exprecion el resultado es 0 (false) 1 (true)

  return 0;
}

int main2() {
  int x, y, z;
  bool b, w;

  for (x = 1; x <= 100; x++) {
    for (y = -100; y <= 100; y++) {
      for (z = -100; z <= 100; z++) {
        if (x % 4 == 0 && x + y == 0 && y - x == (-1) * z &&
            (!b && w == false)) {
          printf("x = %d, y = %d, z = %d, d = %s, w = %s\n", x, y, z,
                 b ? "true" : "false", w ? "true" : "false");
          return 0;
        }
      }
    }
  }
  printf("No se encontrar valores que satisfagan todas las expresiones.\n");
  return 0;
}
