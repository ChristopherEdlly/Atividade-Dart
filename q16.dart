// Questão 16
// Construa um algoritmo para ler o tamanho e os elementos de 4 vetores e responda os
// seguintes itens:
// a) Gere um quinto vetor com os valores dos outros vetores de forma ordenada.
// b) Gere um vetor só com os elementos que tenham intercessão com os 4 vetores.

import 'dart:io';

void main() {
  // Ler 4 vetores do usuário
  List<List<int>> vetores = [];
  for (int v = 1; v <= 4; v++) {
    stdout.write("Digite o tamanho do vetor $v: ");
    int tamanho = int.parse(stdin.readLineSync()!);

    List<int> vetor = [];
    print("Digite os elementos do vetor $v:");
    for (int i = 0; i < tamanho; i++) {
      stdout.write("Elemento ${i + 1}: ");
      vetor.add(int.parse(stdin.readLineSync()!));
    }
    vetores.add(vetor);
  }

  // a) Gerar quinto vetor com todos os elementos ordenados
  List<int> quintoVetor = [];
  for (var vetor in vetores) {
    quintoVetor.addAll(vetor);
  }
  quintoVetor.sort();
  print("\nVetor 5 (todos os elementos ordenados):");
  print(quintoVetor);

  // b) Gerar vetor com interseção dos 4 vetores
  // Usando conjuntos para facilitar a operação
  Set<int> intersecao = vetores[0].toSet();
  for (int i = 1; i < 4; i++) {
    intersecao = intersecao.intersection(vetores[i].toSet());
  }

  List<int> vetorIntersecao = intersecao.toList()..sort();
  print("\nVetor com elementos presentes nos 4 vetores:");
  print(vetorIntersecao);
}
