#include <stdbool.h>
#include <stdio.h>

bool pedir_booleano(void);
void imprimir_booleano(bool x);

int main() {

  bool booleano = pedir_booleano();

  imprimir_booleano(booleano);

  return 0;
}

bool pedir_booleano(void) {
  char booleano;

  do {
    printf("Ingrese 't' para true o 'f' para false: ");
    scanf(" %c", &booleano);
  } while (booleano != 't' && booleano != 'f');
  return (booleano == 't') ? "true" : "false";
}

void imprimir_booleano(bool x) {
  printf("El valor del booleano es: %s\n", x ? "true" : "false");
}
