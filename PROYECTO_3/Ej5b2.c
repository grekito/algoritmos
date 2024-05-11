#include <stdbool.h>
#include <stdio.h>

int main() {
  int x, i;
  bool res;

  printf("Ingrese el valor de x:");
  scanf("%d", &x);

  printf("Ingrese el valor de i:");
  scanf("%d", &i);

  printf("Ingrese el valor de res (1 para true, 0 para false): ");
  scanf("%d", &res);

  i = 2;
  res = true;

  if (i < x && res) {
    res = res && (i % x != 0);
    i = i + 1;
  }

  printf("x = %d, i = %d, res = %s\n", x, i, res ? "true" : "false");
  return 0;
}
