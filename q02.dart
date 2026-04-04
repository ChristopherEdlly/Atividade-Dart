// Questão 2
// Faça um algoritmo para ler o número de termos e calcular o valor da série abaixo:
// S = 3^4!/5 + 5^8!/10 + 7^12!/15 - 9^16!/20 + 11^20!/25 - 13^24!/30 + 15^28!/35 + ...

import 'dart:io';

void main() {
  stdout.write('Digite o número de termos: ');
  int n = int.parse(stdin.readLineSync()!);

  List<String> numeradores = [];
  List<String> denominadores = [];
  List<String> sinais = [];

  for (int i = 1; i <= n; i++) {
    int base = 3 + (i - 1) * 2;
    int expoente = 4 * i;
    int denominador = i * 5;

    String num = '$base^${expoente}!';
    String den = '$denominador';
    String sinal = (i > 3 && i % 2 == 0) ? '-' : '+';

    numeradores.add(num);
    denominadores.add(den);
    sinais.add(sinal);
  }

  // Largura de cada termo = maior entre numerador e denominador
  List<int> larguras = [];
  for (int i = 0; i < n; i++) {
    int larg = numeradores[i].length > denominadores[i].length
        ? numeradores[i].length
        : denominadores[i].length;
    larguras.add(larg);
  }

  // Linha de cima (numeradores)
  String linhaNum = 'S = ';
  String linhaDiv = '    ';
  String linhaDen = '    ';

  for (int i = 0; i < n; i++) {
    int larg = larguras[i];
    String num = numeradores[i].padLeft((larg + numeradores[i].length) ~/ 2).padRight(larg);
    String den = denominadores[i].padLeft((larg + denominadores[i].length) ~/ 2).padRight(larg);
    String div = '-' * larg;

    if (i == 0) {
      linhaNum += num;
      linhaDiv += div;
      linhaDen += den;
    } else {
      String sinal = sinais[i];
      linhaNum += '   $num';
      linhaDiv += ' $sinal $div';
      linhaDen += '   $den';
    }
  }

  print('');
  print(linhaNum);
  print(linhaDiv);
  print(linhaDen);
  print('');
}
