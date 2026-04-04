// Questão 20
// Desenvolva, utilizando exclusivamente a linguagem Dart, um sistema onde o jogador
// controla um caractere dentro de um labirinto. O objetivo é navegar da entrada até a
// saída, superando obstáculos e becos sem saída. O programa deve processar os
// comandos de movimento e atualizar a posição do personagem no mapa em tempo real.

import 'dart:io';

// W = parede, ' ' = caminho livre
// Cada celula e representada por 2 caracteres no terminal para ficar quadrado
const List<String> labirintoMapa = [
  'WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW',
  'E         W         W    W             W',
  'WWWWWWWW  W  WWWWW  W    W  WWWWWWWWW  W',
  'W W       W  W           W  W          W',
  'W W  WWWWWW  W  WWWWWW   W  W  WWWWWW  W',
  'W W  W       W  W        W     W       W',
  'W W  W  WWWWWW  W  WWWWWWWWWWWW  WWWW  W',
  'W W  W       W  W  W             W     W',
  'W W  WWWWWW  W  W  W  WWWWWWWWWWWW  W  W',
  'W W          W  W  W  W          W  W  W',
  'W WWWWWWWWWWWW  W  W  W  WWWWWWWWW  W  W',
  'W               W  W             W  W  W',
  'WWWWWWWWWWWWWWWWW  WWWWWWW  WWW  W  W  W',
  'W                           W W  W  W  W',
  'W  WWWWWWWWWWWWWWWWWWWWWWW  W W  W  W  W',
  'W  W                     W    W  W  W  W',
  'W  W  WWWWWWWWWWWWWWWW  WWWWWWW  W  W  W',
  'W  W  W              W           W  W  W',
  'W  W  W  WWWWWWWWWW  WWWWWWWWWWWWW  W  W',
  'W        W                          W  S',
  'WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWw',
];

void desenhar(int jogLinha, int jogColuna) {
  print('\x1B[2J\x1B[0;0H');
  print('Labirinto  —  w=cima  s=baixo  a=esquerda  d=direita');
  print('');
  for (int l = 0; l < labirintoMapa.length; l++) {
    String linha = '';
    for (int c = 0; c < labirintoMapa[l].length; c++) {
      if (l == jogLinha && c == jogColuna) {
        linha += '@ ';
      } else if (labirintoMapa[l][c] == 'W') {
        linha += '██';
      } else if (labirintoMapa[l][c] == 'E') {
        linha += 'E ';
      } else if (labirintoMapa[l][c] == 'S') {
        linha += 'S ';
      } else {
        linha += '  ';
      }
    }
    print(linha);
  }
  print('');
}

void main() {
  int jogadorLinha = 1;
  int jogadorColuna = 0;
  int linhas = labirintoMapa.length;
  int colunas = labirintoMapa[0].length;

  desenhar(jogadorLinha, jogadorColuna);

  while (true) {
    stdout.write('Movimento: ');
    String? entrada = stdin.readLineSync();
    if (entrada == null || entrada.isEmpty) continue;

    String cmd = entrada[0].toLowerCase();

    int novaLinha = jogadorLinha;
    int novaColuna = jogadorColuna;

    if (cmd == 'w')      novaLinha--;
    else if (cmd == 's') novaLinha++;
    else if (cmd == 'a') novaColuna--;
    else if (cmd == 'd') novaColuna++;
    else {
      desenhar(jogadorLinha, jogadorColuna);
      print('Comando invalido! Use w/a/s/d.');
      continue;
    }

    if (novaLinha < 0 || novaLinha >= linhas ||
        novaColuna < 0 || novaColuna >= colunas) {
      desenhar(jogadorLinha, jogadorColuna);
      print('Movimento invalido!');
      continue;
    }

    String celula = labirintoMapa[novaLinha][novaColuna];

    if (celula == 'W') {
      desenhar(jogadorLinha, jogadorColuna);
      print('Tem uma parede ai!');
      continue;
    }

    jogadorLinha = novaLinha;
    jogadorColuna = novaColuna;

    if (celula == 'S') {
      desenhar(jogadorLinha, jogadorColuna);
      print('Parabens! Voce encontrou a saida!');
      break;
    }

    desenhar(jogadorLinha, jogadorColuna);
  }
}
