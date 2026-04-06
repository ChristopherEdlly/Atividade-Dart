// Questão 12
// Escreva um algoritmo que leia um número e o imprima de trás para frente. Exemplo:
// 6042 (impressão:2406)

import 'dart:io';

void main() {
  stdout.write('Digite um número inteiro: ');
  String? entrada = stdin.readLineSync();

  if (entrada != null && entrada.isNotEmpty) {
    String numeroInvertido = entrada.split('').reversed.join('');
    print('Número original: $entrada');
    print('Impressão: $numeroInvertido');
  } else {
    print('Entrada inválida.');
  }
}
