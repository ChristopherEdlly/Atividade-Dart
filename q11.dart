// Questão 11
// Faça um algoritmo para ler o código, nome, sexo e número de horas de aula dadas no
// mês dos professores de uma Universidade e sabendo que por cada hora de aula um
// professor ganha R$ 12,30. Emita uma listagem contendo o código, nome, salário bruto e
// salário líquido de todos os professores lidos e no final imprima a média dos salários
// líquidos de cada sexo, dos professores dessa Universidade.

// Observações:
// O desconto para os homens é 10% e para as mulheres é 5%
// O FLAG é um código ‘9999’

import 'dart:io';

class Professor {
  String codigo;
  String nome;
  String sexo;
  double horasAula;

  Professor(this.codigo, this.nome, this.sexo, this.horasAula);

  double get salarioBruto => horasAula * 12.30;

  double get salarioLiquido {
    if (sexo == 'M') {
      return salarioBruto * 0.90;
    } else {
      return salarioBruto * 0.95; 
    }
  }
}

void main() {
  List<Professor> listaProfessores = [];
  
  while (true) {
    stdout.write('Digite o código do professor (ou 9999 para encerrar): ');
    String codigo = stdin.readLineSync()!;
    if (codigo == '9999') break;

    stdout.write('Nome: ');
    String nome = stdin.readLineSync()!;

    stdout.write('Sexo (M/F): ');
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write('Número de horas de aula no mês: ');
    double horas = double.parse(stdin.readLineSync()!);

    listaProfessores.add(Professor(codigo, nome, sexo, horas));
    print('--- Professor(a) registrado(a) ---\n');
  }

  if (listaProfessores.isEmpty) {
    print('Nenhum dado foi inserido.');
    return;
  }

  double somaLiquidoM = 0;
  int contM = 0;
  double somaLiquidoF = 0;
  int contF = 0;

  print('\n' + '=' * 60);
  print('LISTAGEM DE SALÁRIOS');
  print('=' * 60);
  print('${"CÓD".padRight(6)} | ${"NOME".padRight(15)} | ${"BRUTO".padRight(10)} | ${"LÍQUIDO"}');

  for (var p in listaProfessores) {
    print('${p.codigo.padRight(6)} | ${p.nome.padRight(15)} | R\$ ${p.salarioBruto.toStringAsFixed(2).padRight(7)} | R\$ ${p.salarioLiquido.toStringAsFixed(2)}');

    if (p.sexo == 'M') {
      somaLiquidoM += p.salarioLiquido;
      contM++;
    } else {
      somaLiquidoF += p.salarioLiquido;
      contF++;
    }
  }

  print('=' * 60);
  print('\nMÉDIAS DE SALÁRIO LÍQUIDO POR SEXO:');
  
  if (contM > 0) {
    double mediaM = somaLiquidoM / contM;
    print('Masculino: R\$ ${mediaM.toStringAsFixed(2)}');
  } else {
    print('Masculino: Nenhum professor registrado.');
  }

  if (contF > 0) {
    double mediaF = somaLiquidoF / contF;
    print('Feminino:  R\$ ${mediaF.toStringAsFixed(2)}');
  } else {
    print('Feminino:  Nenhuma professora registrada.');
  }
}