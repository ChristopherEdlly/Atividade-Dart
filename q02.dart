// Questão 2
// Faça um algoritmo para ler o número de termos e calcular o valor da série abaixo:
// S = 3^4!/5 + 5^8!/10 + 7^12!/15 - 9^16!/20 + 11^20!/25 - 13^24!/30 + 15^28!/35 + ...

import 'dart:io';

void main() {
  stdout.write('Digite o número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  double S = 0;

  // Calcular a série de termos
  for (int i = 1; i <= n; i++) {
    double base = (3 + (i - 1) * 2).toDouble();
    int expoente = 4 * i;
    double denominador = (i * 5).toDouble();

    // Calcular o fatorial
    double fat = 1;
    for (int j = 2; j <= expoente; j++) {
      fat *= j;
    }

    // Calcular a base elevado ao fatorial
    double potencia = 1;
    for (int j = 0; j < fat; j++) {
      potencia *= base;
    }

    double termo = potencia / denominador;

    // Sinal: primeiros 3 positivos, depois alternando entre par=negativo e impar=positivo
    if (i > 3 && i % 2 == 0) {
      termo = -termo;
    }

    S += termo;
  }

  print('S = $S');
}
