// Questão 8
// A universidade Tiradentes estará realizando o Concurso Vestibular para os cursos de
// Ciência da Computação, Sistemas de Informação. E você foi convidado a desenvolver
// um algoritmo para leitura e levantamento de informações.
// As informações lidas para cada candidato são:
// a) Código (FLAG’0000’)
// b) Curso (CC-Ciência da Computação e SI- Sistemas de Informação)
// c) Nome
// d) Sexo
//
// e) Pontuação (0-5000)
// As informações desejadas são:
// a) O Código, nome e pontuação dos candidatos independentes do sexo para o
// curso de Ciência da Computação que fizeram mais de 2500 pontos.
// b) O nome do candidato do sexo masculino que teve a menor pontuação geral
// c) O código do candidato do sexo masculino que teve a maior pontuação para o
// curso de Sistemas de Informação
// d) O percentual geral de candidatos do sexo Masculino e Feminino inscritos no
// vestibular.

import 'dart:io';

String lerCodigo() {
  while (true) {
    print('Código (0000 para sair):');
    String input = stdin.readLineSync()!;

    if (!RegExp(r'^\d+$').hasMatch(input)) {
      print('❌ Digite apenas números!');
      continue;
    }
    if (input.length != 4) {
      print('❌ O código deve ter exatamente 4 dígitos!');
      continue;
    }
    
    return input;
  }
}

String lerCurso() {
  while (true) {
    print('Curso (CC/SI):');
    String curso = stdin.readLineSync()!.toUpperCase();

    if (curso == 'CC' || curso == 'SI') {
      return curso;
    } else {
      print('❌ Entrada inválida! Digite apenas CC ou SI.');
    }
  }
}

String lerNome() {
  while (true) {
    print('Nome:');
    String nome = stdin.readLineSync()!;

    if (RegExp(r'^[a-zA-ZÀ-ÿ ]+$').hasMatch(nome)) {
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

int lerNumero() {
  while (true) {
    print('Digite um número:');
    String input = stdin.readLineSync()!;

    int? valor = int.tryParse(input);

    if (valor != null) {
      return valor;
    } else {
      print('❌ Digite um número válido!');
    }
  }
}

int lerPontuacao() {
  while (true) {
    print('Pontuação (0 a 5000):');
    int? pontos = int.tryParse(stdin.readLineSync()!);

    if (pontos != null && pontos >= 0 && pontos <= 5000) {
      return pontos;
    } else {
      print('❌ Pontuação inválida!');
    }
  }
}

void main() {
  String codigo;

  List<String> aprovadosCC = [];

  int total = 0;
  int masc = 0;
  int fem = 0;
  
  int menorPontM = 99999;
  String nomeMenorM = '';

  int maiorPontSI = -1;
  String codMaiorSI = '';

  while (true) {
    codigo = lerCodigo();

    if (codigo == '0000') break;

    String curso = lerCurso();

    String nome = lerNome();

    String sexo = lerSexo();

    int pontos = lerPontuacao();

    total++;

    if (sexo == 'M') masc++;
    if (sexo == 'F') fem++;

    // A
    if (curso == 'CC' && pontos > 2500) {
      aprovadosCC.add('$codigo - $nome - $pontos');
    }

    // B
    if (sexo == 'M' && pontos < menorPontM) {
      menorPontM = pontos;
      nomeMenorM = nome;
    }

    // C
    if (sexo == 'M' && curso == 'SI' && pontos > maiorPontSI) {
      maiorPontSI = pontos;
      codMaiorSI = codigo;
    }
  }

  print('\nRESULTADOS:');
  // A
  print('\nCandidatos de CC com mais de 2500 pontos:\n');

  if (aprovadosCC.isEmpty) {
    print('Nenhum candidato');
  } else {
    print('Código - Nome - Pontuação');
    for (var c in aprovadosCC) {
      print(c);
    }
  }
  // B
  print('\n' + (
    nomeMenorM.isEmpty
        ? 'Nome do candidato com menor pontuação masculina geral: Nenhum candidato homem'
        : 'Nome do candidato com menor pontuação masculina geral: $nomeMenorM'
  ));
  // C
  print('\n' + (
    codMaiorSI.isEmpty
        ? 'Código do candidato com maior pontuação masculina em SI: Nenhum candidato'
        : 'Código do candidato com maior pontuação masculina em SI: $codMaiorSI'
  ));
  // D
  double percM = total == 0 ? 0 : (masc / total) * 100;
  double percF = total == 0 ? 0 : (fem / total) * 100;
  
  print('Porcentual geral de candidatos inscritos:');
  print('\nMasculino: ${percM.toStringAsFixed(2)}%');
  print('Feminino: ${percF.toStringAsFixed(2)}%');
}
