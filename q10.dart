// Questão 10
// Uma empresa decidiu fazer um levantamento sobre o perfil de candidatos que se
// apresentarem para o preenchimento de vagas de seu quadro de funcionários. Par cada
// candidato, serão solicitados o nome, o sexo, a idade e se tem ou não a experiência no
// serviço. O Flag é o nome FIM. Escreva um programa para ler os dados dos candidatos e
// a seguir calcular e imprimir as seguintes informações.
// a) O número de candidatos do sexo feminino e masculino.
// b) A idade média dos homens que já tem experiência no serviço.
// c) A porcentagem dos homens com mais de 45 anos com relação ao total de
// homens.
// d) O número de mulheres com idade inferior a 30 anos e com experiência no
// serviço.
// e) O nome da candidata com a menor idade que já tem experiência no serviço.

import 'dart:io';

String lerNome() {
  while (true) {
    print('Nome (FIM para sair):');
    String nome = stdin.readLineSync()!;

    if (nome.toUpperCase() == 'FIM') return 'FIM';

    if (nome.isNotEmpty && RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(nome)) {
      return nome;
    } else {
      print('❌ Nome inválido! Use apenas letras.');
    }
  }
}

String lerSexo() {
  while (true) {
    print('Sexo (M/F):');
    String sexo = stdin.readLineSync()!.toUpperCase();

    if (sexo == 'M' || sexo == 'F') {
      return sexo;
    } else {
      print('❌ Digite apenas M ou F.');
    }
  }
}

int lerIdade() {
  while (true) {
    print('Idade:');
    int? idade = int.tryParse(stdin.readLineSync()!);

    if (idade != null && idade > 0 && idade <= 120) {
      return idade;
    } else {
      print('❌ Idade inválida! Use apenas números.');
    }
  }
}

String lerExperiencia() {
  while (true) {
    print('Experiência (S/N):');
    String exp = stdin.readLineSync()!.toUpperCase();

    if (exp == 'S' || exp == 'N') {
      return exp;
    } else {
      print('❌ Digite apenas S ou N.');
    }
  }
}

void main() {
  int masc = 0, fem = 0;

  int totalHomens = 0;
  int homensExp = 0;
  int somaIdadeHomensExp = 0;

  int homens45 = 0;

  int mulheresExp30 = 0;

  int? menorIdadeF;
  String nomeMenorF = '';

  while (true) {
    String nome = lerNome();
    if (nome == 'FIM') break;

    String sexo = lerSexo();
    int idade = lerIdade();
    String exp = lerExperiencia();

    if (sexo == 'M') {
      masc++;
      totalHomens++;

      if (exp == 'S') {
        homensExp++;
        somaIdadeHomensExp += idade;
      }

      if (idade > 45) {
        homens45++;
      }
    }

    if (sexo == 'F') {
      fem++;

      if (exp == 'S' && idade < 30) {
        mulheresExp30++;
      }

      if (exp == 'S' &&
          (menorIdadeF == null || idade < menorIdadeF)) {
        menorIdadeF = idade;
        nomeMenorF = nome;
      }
    }
  }

  print('\nRESULTADOS:\n');

  // A
  print('Quantidade total de homens: $masc');
  print('Quantidade total de mulheres: $fem');

  // B
  double mediaHomensExp =
      homensExp == 0 ? 0 : somaIdadeHomensExp / homensExp;

  print('\nIdade média dos homens com experiência: ${mediaHomensExp.toStringAsFixed(0)} anos');

  // C
  double percHomens45 =
      totalHomens == 0 ? 0 : (homens45 / totalHomens) * 100;

  print('Homens com mais de 45 anos: ${percHomens45.toStringAsFixed(2)}%');

  // D
  print('\nMulheres com menos de 30 anos e com experiência: $mulheresExp30');

  // E
  print(
    nomeMenorF.isEmpty
        ? 'Mulher mais nova com experiência: Nenhuma candidata'
        : 'Mulher mais nova com experiência: $nomeMenorF ($menorIdadeF anos)',
  );
}