#include <stdbool.h>
#include <stdio.h>

int main() {
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
