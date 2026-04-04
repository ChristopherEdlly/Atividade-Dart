// Questão 18
// Desenvolva um programa utilizando exclusivamente a linguagem Dart que simula o
// "Jogo da Forca". O sistema deve permitir que o usuário tente adivinhar uma palavra
// oculta, informando uma letra por vez, até que a palavra seja totalmente revelada ou que
// o desenho do boneco seja concluído, sinalizando o fim de jogo.

import 'dart:io';
import 'dart:math';

void desenharForca(int erros) {
  List<String> forca = [
    '  +---+',
    '  |   |',
    '  |   ${erros >= 1 ? 'O' : ' '}',
    '  |  ${erros >= 3 ? '/' : ' '}${erros >= 2 ? '|' : ' '}${erros >= 4 ? '\\' : ' '}',
    '  |  ${erros >= 5 ? '/' : ' '} ${erros >= 6 ? '\\' : ' '}',
    '  |',
    '========',
  ];
  for (String linha in forca) {
    print(linha);
  }
}

void main() {
  Map<String, List<String>> palavrasComDicas = {
    'elefante': [
      'E um ser vivo',
      'Encontrado na natureza',
      'Vive em grupo',
      'E grande',
      'Tem partes do corpo incomuns',
      'Existe ha milhoes de anos',
    ],
    'tartaruga': [
      'E um ser vivo',
      'Encontrada na natureza',
      'Tem uma protecao natural',
      'Se move lentamente',
      'Pode viver em mais de um ambiente',
      'Aparece em uma fabula famosa',
    ],
    'fotografia': [
      'E algo criado pelo ser humano',
      'Envolve tecnologia',
      'Pode ser arte',
      'Precisa de luz',
      'Guarda algo do passado',
      'Mudou muito nos ultimos decadas',
    ],
    'biblioteca': [
      'E um lugar',
      'Existe em cidades de todo o mundo',
      'Tem regras proprias',
      'Guarda algo valioso',
      'Voce pode usar sem pagar',
      'silencio',
    ],
    'horizonte': [
      'Nao e um objeto fisico',
      'Voce consegue ver',
      'Muda conforme voce muda',
      'Aparece em lugares abertos',
      'Tem significado literal e figurado',
      'Liga-se ao sol',
    ],
    'orquestra': [
      'E um conjunto',
      'Envolve pessoas',
      'Tem um lider',
      'Produz algo para os sentidos',
      'Exige muito treinamento',
      'Tem partes com funcoes diferentes',
    ],
    'volcao': [
      'E algo da natureza',
      'Pode ficar inativo por muito tempo',
      'Tem energia interna',
      'Pode ser perigoso',
      'Tambem pode ser util',
      'Esta ligado a historia de civilizacoes',
    ],
    'gravidade': [
      'Nao tem forma',
      'Voce nao ve mas sente',
      'Esta em todo lugar',
      'Foi estudada por um cientista famoso',
      'Age sobre tudo que tem massa',
      'No espaco seu efeito parece diferente',
    ],
    'piramide': [
      'E algo criado pelo ser humano',
      'E muito antigo',
      'Tem uma forma geometrica',
      'Foi construido com muito trabalho',
      'Resistiu ao tempo',
      'Mais de uma civilizacao teve a mesma ideia',
    ],
    'submarino': [
      'E um veiculo',
      'Precisa de tecnologia avancada',
      'Usado por governos',
      'Opera em ambiente hostil',
      'Tem tripulacao',
      'Nao e visto facilmente',
    ],
  };

  Random random = Random();
  List<String> chaves = palavrasComDicas.keys.toList();
  String palavra = chaves[random.nextInt(chaves.length)];
  List<String> dicas = List.from(palavrasComDicas[palavra]!);
  dicas.shuffle(random);

  List<String> letrasCorretas = [];
  List<String> letrasErradas = [];
  int erros = 0;
  int maxErros = 6;

  print('');
  print('==============================');
  print('       JOGO DA FORCA');
  print('==============================');

  while (erros < maxErros) {
    print('\x1B[2J\x1B[0;0H');
    desenharForca(erros);
    print('');

    // Mostra dicas reveladas até o momento
    if (erros > 0) {
      print('--- Dicas reveladas ---');
      for (int d = 0; d < erros; d++) {
        print('  ${d + 1}. ${dicas[d]}');
      }
      print('');
    }

    // Mostra a palavra com _ nas letras não descobertas
    String exibicao = '';
    bool palavraCompleta = true;
    for (int i = 0; i < palavra.length; i++) {
      if (letrasCorretas.contains(palavra[i])) {
        exibicao += '${palavra[i]} ';
      } else {
        exibicao += '_ ';
        palavraCompleta = false;
      }
    }

    print('Palavra: $exibicao');
    print('Letras erradas: ${letrasErradas.join(', ')}');
    print('Erros: $erros / $maxErros');

    if (palavraCompleta) {
      print('');
      print('Parabéns! Você acertou a palavra: $palavra');
      break;
    }

    stdout.write('Digite uma letra: ');
    String? entrada = stdin.readLineSync();
    if (entrada == null || entrada.isEmpty) continue;

    String letra = entrada[0].toLowerCase();

    if (letrasCorretas.contains(letra) || letrasErradas.contains(letra)) {
      print('Você já tentou essa letra!');
      continue;
    }

    if (palavra.contains(letra)) {
      letrasCorretas.add(letra);
      print('Letra correta!');
    } else {
      letrasErradas.add(letra);
      erros++;
      print('Letra errada! Nova dica revelada...');
    }
  }

  if (erros >= maxErros) {
    print('');
    desenharForca(erros);
    print('');
    print('Game over! A palavra era: $palavra');
  }
}
