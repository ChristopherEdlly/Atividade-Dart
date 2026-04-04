// Questão 14
// Faça um algoritmo que leia o tamanho e os elementos de dois vetores ordenados e, em
// seguida, gere um terceiro vetor também ordenado. Obs: O usuário deverá digitar os dois
// vetores obrigatoriamente.

import 'dart:io';

void main() {
  List<int> vetor1 = lerVetorOrdenado(1);
  List<int> vetor2 = lerVetorOrdenado(2);

  List<int> vetorOrdenado = mergeOrderedVectors(vetor1, vetor2);

  print("Vetor resultante ordenado:");
  print(vetorOrdenado);
}

// Função para ler um vetor do usuário garantindo que esteja ordenado
List<int> lerVetorOrdenado(int numeroVetor) {
  stdout.write("Digite o tamanho do vetor $numeroVetor: ");
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  while (true) {
    vetor.clear();
    print("Digite os elementos do vetor $numeroVetor em ordem crescente:");
    for (int i = 0; i < tamanho; i++) {
      stdout.write("Elemento ${i + 1}: ");
      vetor.add(int.parse(stdin.readLineSync()!));
    }

    if (estaOrdenado(vetor)) {
      break;
    } else {
      print("O vetor não está em ordem crescente. Digite novamente.");
    }
  }

  return vetor;
}

// Função que verifica se o vetor está em ordem crescente
bool estaOrdenado(List<int> vetor) {
  for (int i = 0; i < vetor.length - 1; i++) {
    if (vetor[i] > vetor[i + 1]) {
      return false;
    }
  }
  return true;
}

// Função que mescla dois vetores ordenados
List<int> mergeOrderedVectors(List<int> v1, List<int> v2) {
  List<int> resultado = [];
  int i = 0, j = 0;

  while (i < v1.length && j < v2.length) {
    if (v1[i] <= v2[j]) {
      resultado.add(v1[i]);
      i++;
    } else {
      resultado.add(v2[j]);
      j++;
    }
  }

  while (i < v1.length) {
    resultado.add(v1[i]);
    i++;
  }

  while (j < v2.length) {
    resultado.add(v2[j]);
    j++;
  }

  return resultado;
}