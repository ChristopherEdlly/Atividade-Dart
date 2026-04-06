// Questão 13
// Faça um algoritmo para ler um conjunto N de números inteiros e imprimir cada
// elemento do conjunto e quantas vezes este se repete.
// Ex:
// Vetor lido
// | 3 | 8 | 5 | 3 | 8 | 7 | 3 | 7 | 3 | 7 |

// Resultado
// 3 – 4
// 8 – 2
// 5 – 1
// 7 – 3
// OBS.: O valor de N será lido

import 'dart:io';

void main() {
  stdout.write('Quantos números deseja inserir no conjunto (N)? ');
  String? entradaN = stdin.readLineSync();
  
  if (entradaN == null || int.tryParse(entradaN) == null) {
    print('Valor de N inválido.');
    return;
  }

  int n = int.parse(entradaN);
  List<int> vetor = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Digite o ${i + 1}º número: ');
    String? numEntrada = stdin.readLineSync();
    if (numEntrada != null && int.tryParse(numEntrada) != null) {
      vetor.add(int.parse(numEntrada));
    } else {
      print('Entrada inválida, ignorando este valor.');
      i--; 
    }
  }

  Map<int, int> contagem = {};

  for (int numero in vetor) {
    if (contagem.containsKey(numero)) {
      contagem[numero] = contagem[numero]! + 1;
    } else {
      contagem[numero] = 1;
    }
  }

  print('\n--- Vetor Lido ---');
  print(vetor.join(' '));

  print('\n--- Resultado (Número - Repetições) ---');
  contagem.forEach((numero, repeticoes) {
    print('$numero – $repeticoes');
  });
}