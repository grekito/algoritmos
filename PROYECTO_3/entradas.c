#include <stdio.h>

// Prototipos de funciones
int pedir_entero(void);
void imprimir_entero(int x, char name[]);

int main() {
  // Llama a la función pedir_entero para obtener un valor entero
  int numero = pedir_entero();

  // Llama a la función imprimir_entero para mostrar el valor obtenido
  imprimir_entero(numero, "numero");

  return 0;
}

// Función para pedir un entero al usuario
int pedir_entero(void) {
  int valor;
  printf("Ingrese un valor entero: ");
  scanf("%d", &valor);
  return valor;
}

// Función para imprimir un entero
void imprimir_entero(int x, char name[]) {
  printf("El valor de %s es: %d\n", name, x);
}

