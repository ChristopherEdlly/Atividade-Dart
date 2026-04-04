// Questão 17
// Faça um algoritmo utilizando procedimento ou funções que leia dois vetores, gere e
// imprima um terceiro vetor que seja a soma dos dois vetores lidos e imprima também a
// soma de todos os elementos deste 3o vetor.

import 'dart:io';

// Função para ler um vetor do usuário
List<int> lerVetor(int numeroVetor, int tamanho) {
  List<int> vetor = [];
  print("Digite os elementos do vetor $numeroVetor:");
  for (int i = 0; i < tamanho; i++) {
    stdout.write("Elemento ${i + 1}: ");
    vetor.add(int.parse(stdin.readLineSync()!));
  }
  return vetor;
}

// Função que soma dois vetores elemento a elemento
List<int> somarVetores(List<int> v1, List<int> v2) {
  List<int> resultado = [];
  for (int i = 0; i < v1.length; i++) {
    resultado.add(v1[i] + v2[i]);
  }
  return resultado;
}

// Função que calcula a soma de todos os elementos de um vetor
int somaElementos(List<int> vetor) {
  int soma = 0;
  for (var elemento in vetor) {
    soma += elemento;
  }
  return soma;
}

void main() {
  stdout.write("Digite o tamanho dos vetores: ");
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor1 = lerVetor(1, tamanho);
  List<int> vetor2 = lerVetor(2, tamanho);

  List<int> vetor3 = somarVetores(vetor1, vetor2);

  print("\nVetor resultante (soma dos dois vetores):");
  print(vetor3);

  int somaTotal = somaElementos(vetor3);
  print("Soma de todos os elementos do terceiro vetor: $somaTotal");
}
