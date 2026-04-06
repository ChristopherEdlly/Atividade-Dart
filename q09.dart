// Questão 9
// Existem números que tem a seguinte característica: 3025= 30+25 = 55*55= 3025. Faça
// um algoritmo para imprimir todos os números entre 1000 e 9999 que tenham tal
// característica.

void main() {
  for (int num = 1000; num <= 9999; num++) {
    int parte1 = num ~/ 100;
    int parte2 = num % 100;

    int soma = parte1 + parte2;

    if (soma * soma == num) {
      print(num);
    }
  }
}
