#include <stdio.h>

int main() { 
  int x, y, z;

  printf("Ingrese el valor de x: ");
  scanf("%d", &x); 

  printf("Ingrese el valor de y: ");
  scanf("%d", &y); 
  
  printf("Ingrese el valor de z: ");
  scanf("%d", &z); 

  printf("Resultado para el conjunto de valores dado (x=%d, y=%d, z=%d)\n", x, y, z);
  printf("x + y + 1 = %d\n", x + y + 1);
  printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
  printf("y - 2 == (x * 3 + 1) %% 5 = %d\n", y - 2 == (x * 3 + 1) % 5); 
  printf("y / 2 * x = %d\n", y / 2 * x);
  printf("y < x * z = %d\n", y < x * z); // En esta exprecion el resultado es 0 (false) 1 (true)

  return 0;
}

