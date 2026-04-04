// Questão 7
// Leia o número de termos e calcule o valor da seguinte série:
// S = X^2/1! + X^3/2! + X^4/3! + X^5/4! + X^6/3! + X^7/2! + X^8/1! + X^9/2! + X^10/3! + X^11/4! ...

import 'dart:io';

void main() {
  stdout.write('Digite o valor de X: ');
  double x = double.parse(stdin.readLineSync()!);

  stdout.write('Digite o número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  double S = 0;

  for (int i = 1; i <= n; i++) {
    double expoente = (i + 1).toDouble();

    // Posição no ciclo 1,2,3,4,3,2 (período 6)
    int pos = i % 6;
    int fatNum;
    if (pos == 1) fatNum = 1;
    else if (pos == 2) fatNum = 2;
    else if (pos == 3) fatNum = 3;
    else if (pos == 4) fatNum = 4;
    else if (pos == 5) fatNum = 3;
    else fatNum = 2; // pos == 0

    // Calcula o fatorial do denominador
    double fat = 1;
    for (int j = 2; j <= fatNum; j++) {
      fat *= j;
    }

    // Calcula x elevado ao expoente
    double potencia = 1;
    for (int j = 0; j < expoente; j++) {
      potencia *= x;
    }

    S += potencia / fat;
  }

  print('S = $S');
}
