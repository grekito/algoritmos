#include <stdbool.h>
#include <stdio.h>

void encontrar_booleanos(bool *b_, bool *w_) {
  bool b, w;

  // Bucle infinito
  for (;;) {
    for (b = false; b <= true; b++) {
      for (w = false; w <= true; w++) {
        if (!b && w == false) {
          *b_ = b;
          *w_ = w;
          return;
        }
      }
    }
  }
}

int main() {
  int x, y, z;
  bool b_, w_;

  encontrar_booleanos(&b_, &w_);

  for (x = 1; x <= 100; x++) {
    for (y = -100; y <= 100; y++) {
      for (z = -100; z <= 100; z++) {
        if (x % 4 == 0 && x + y == 0 && y - x == (-1) * z) {
          printf("x = %d, y = %d, z = %d, d = %s, w = %s\n", x, y, z,
                 b_ ? "true" : "false", w_ ? "true" : "false");
          return 0;
        }
      }
    }
  }
  printf("No se encontrar valores que satisfagan todas las expresiones.\n");
  return 0;
}
