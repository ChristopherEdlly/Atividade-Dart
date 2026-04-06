// Questão 6
// Levando em consideração que a função Random (N) gera um número aleatório entre 1 e
// N, faça um algoritmo que gere um número aleatório entre 1 e 100. E, então, permita que
// o usuário digite números, neste intervalo, até que acerte o número gerado. A cada
// número digitado, o novo intervalo deverá ser impresso, limitando os valores a serem
// chutados.
import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecreto = random.nextInt(100) + 1;

  int min = 1;
  int max = 100;

  while (true) {
    print('Digite um número entre $min e $max:');
    int palpite = int.parse(stdin.readLineSync()!);

    if (palpite == numeroSecreto) {
      print('🎉 Acertou!');
      break;
    } else if (palpite > numeroSecreto) {
      max = palpite;
      print('O número está entre $min e $max');
    } else {
      min = palpite;
      print('O número está entre $min e $max');
    }
  }
}
