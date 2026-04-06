// Questão 2
// Faça um algoritmo para ler o número de termos e calcular o valor da série abaixo:
// S = 3^4!/5 + 5^8!/10 + 7^12!/15 - 9^16!/20 + 11^20!/25 - 13^24!/30 + 15^28!/35 + ...

import 'dart:io';
import 'dart:math';

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
    String sinal = (i >= 4 && (i - 4) % 2 == 0) ? '-' : '+';

    numeradores.add(num);
    denominadores.add(den);
    sinais.add(sinal);

    print('Termo $i: $sinal $num / $den');
  }

  double resultado = 0;
  for (int i = 0; i < n; i++) {
    int base = 3 + i * 2;
    int expoenteFatorial = 4 * (i + 1);
    
    int fatorial = 1;
    for (int j = 1; j <= expoenteFatorial; j++) {
      fatorial *= j;
    }

    double potencia = pow(base.toDouble(), fatorial.toDouble()).toDouble();
    
    double termo = potencia / (5 * (i + 1));

    if (sinais[i] == '-') {
      termo = -termo;
    }
    
    resultado += termo;
  }

  print('Resultado: $resultado');
}
