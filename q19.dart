// Questão 19
// Desenvolva, utilizando exclusivamente a linguagem Dart, um sistema para dois
// jogadores que alternam entre "X" e "O" em um tabuleiro 3x3. O programa deve
// identificar automaticamente a vitória quando um jogador completar uma linha, coluna
// ou diagonal, ou declarar empate caso o tabuleiro seja preenchido sem um vencedor.

import 'dart:io';

void main() {
  List<String> tabuleiro = List.generate(9, (i) => (i + 1).toString());
  String jogadorAtual = 'X';
  bool jogoEmAndamento = true;
  int jogadas = 0;

  print('--- JOGO DA VELHA ---');

  while (jogoEmAndamento) {
    exibirTabuleiro(tabuleiro);
    
    print('Jogador $jogadorAtual, escolha uma posição (1-9):');
    String? entrada = stdin.readLineSync();
    int? escolha = int.tryParse(entrada ?? '');

    if (escolha == null || escolha < 1 || escolha > 9 || tabuleiro[escolha - 1] == 'X' || tabuleiro[escolha - 1] == 'O') {
      print('\n[ERRO] Jogada inválida! Tente uma posição livre entre 1 e 9.');
      continue;
    }

    tabuleiro[escolha - 1] = jogadorAtual;
    jogadas++;

    if (verificarVitoria(tabuleiro)) {
      exibirTabuleiro(tabuleiro);
      print('PARABÉNS! O jogador "$jogadorAtual" venceu!');
      jogoEmAndamento = false;
    } else if (jogadas == 9) {
      exibirTabuleiro(tabuleiro);
      print('EMPATE! O tabuleiro está cheio.');
      jogoEmAndamento = false;
    } else {
      jogadorAtual = (jogadorAtual == 'X') ? 'O' : 'X';
    }
  }
}

void exibirTabuleiro(List<String> t) {
  print('\n');
  print(' ${t[0]} | ${t[1]} | ${t[2]} ');
  print('-----------');
  print(' ${t[3]} | ${t[4]} | ${t[5]} ');
  print('-----------');
  print(' ${t[6]} | ${t[7]} | ${t[8]} ');
  print('\n');
}

bool verificarVitoria(List<String> t) {
  List<List<int>> combinacoes = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Linhas
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Colunas
    [0, 4, 8], [2, 4, 6]             // Diagonais
  ];

  for (var combo in combinacoes) {
    if (t[combo[0]] == t[combo[1]] && t[combo[1]] == t[combo[2]]) {
      return true;
    }
  }
  return false;
}