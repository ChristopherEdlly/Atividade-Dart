// Questão 15
// Faça um algoritmo para ler o número e o peso de N bois de uma fazenda, armazene
// estes dados em um vetor e, em seguida, possibilite que sejam feitas várias pesquisas,
// onde o fazendeiro digitará um intervalo para os pesos e, então, o algoritmo deve
// fornecer uma impressão de todos os bois com peso dentro desse intervalo.

import 'dart:io';

class Boi {
  int numero;
  double peso;

  Boi(this.numero, this.peso);
}

void main() {
  // Ler quantidade de bois
  stdout.write("Digite o número de bois na fazenda: ");
  int n = int.parse(stdin.readLineSync()!);

  List<Boi> bois = [];

  // Ler dados de cada boi
  for (int i = 0; i < n; i++) {
    stdout.write("Número do boi ${i + 1}: ");
    int numero = int.parse(stdin.readLineSync()!);
    stdout.write("Peso do boi ${i + 1} (kg): ");
    double peso = double.parse(stdin.readLineSync()!);

    bois.add(Boi(numero, peso));
  }

  print("\nCadastro de bois concluído!\n");

  // Permitir várias pesquisas
  while (true) {
    stdout.write("Deseja fazer uma pesquisa por intervalo de peso? (s/n): ");
    String resposta = stdin.readLineSync()!.toLowerCase();

    if (resposta != 's') {
      print("Encerrando o programa.");
      break;
    }

    // Ler intervalo de peso
    stdout.write("Digite o peso mínimo (kg): ");
    double pesoMin = double.parse(stdin.readLineSync()!);
    stdout.write("Digite o peso máximo (kg): ");
    double pesoMax = double.parse(stdin.readLineSync()!);

    // Pesquisar bois dentro do intervalo
    List<Boi> resultado = bois
        .where((boi) => boi.peso >= pesoMin && boi.peso <= pesoMax)
        .toList();

    // Exibir resultado
    if (resultado.isEmpty) {
      print("Nenhum boi encontrado nesse intervalo.\n");
    } else {
      print("Bois encontrados no intervalo $pesoMin kg - $pesoMax kg:");
      for (var boi in resultado) {
        print("Boi nº ${boi.numero}, Peso: ${boi.peso} kg");
      }
      print("");
    }
  }
}
