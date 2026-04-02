// Questão 5
// Faça um algoritmo para ler o Nome, Sexo (M ou F) e o peso dos recém-nascidos de
// uma maternidade e de acordo com a tabela abaixo imprima:
// a) Para cada recém-nascido: o nome, o sexo e a classificação quanto ao peso.
// b) O nome do recém-nascido do sexo feminino com o maior peso.
// c) O percentual de recém-nascidos em cada classificação de peso.

// Peso Classificação
// 0 <= Peso <= 2 kg Baixo Peso
// 2 < a <= 4 kg Normal
// Acima de 4 kg Alto Peso

import "dart:io";

class RecemNascido {
    String _nome;
    String _sexo;
    double _peso;
    
    String get nome => _nome;
    String get sexo => _sexo;
    double get peso => _peso;
    
    String get classificacaoPeso {
        if (0 <= _peso && _peso <= 2) {
            return "Baixo Peso";
        } else if (2 < _peso && _peso <= 4) {
            return "Normal";
        } else {
            return "Alto Peso";
        }
    }
    
    RecemNascido(this._nome, this._sexo, this._peso) {
      
        List<String> erros = [];
        
        if (_nome.trim().isEmpty || !RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(_nome.trim())) {
            erros.add("Dado inválido em nome. Deve haver apenas letras e espaços.");
        }
        
        _sexo = _sexo.trim().toUpperCase();
        if (!["M", "F"].contains(_sexo)) {
            erros.add("Dado inválido em sexo. Deve ser apenas 'M' ou 'F'.");
        }
        
        if (_peso < 0 || _peso.isNaN || _peso.isInfinite) {
            erros.add("Dado inválido em peso. Deve ser apenas um número a partir de 0.");
        }
        
        if (erros.isNotEmpty) {
            throw Exception(erros.join("\n"));
        }
    }
}

String validarNome() {
    stdout.write("Digite o nome (apenas letras e espaços): ");
    String? nome = stdin.readLineSync();
    
    while (nome == null || nome.trim().isEmpty || !RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(nome.trim())) {
        stdout.write("Dado inválido, deve haver apenas letras e espaços. Digite o nome: ");
        nome = stdin.readLineSync();
    }
    
    String nomeFormatado = nome
        .trim()
        .split(' ')
        .where((palavra) => palavra.isNotEmpty)
        .map((palavra) => palavra[0].toUpperCase() + palavra.substring(1).toLowerCase())
        .join(' ');
    
    return nomeFormatado;
}

String validarSexo(){
    stdout.write("Digite o sexo (M/F):");
    String? sexo = stdin.readLineSync();
    
    while (sexo == null || sexo.trim().isEmpty || (sexo.toUpperCase() != "M" && sexo.toUpperCase() != "F")) {
        stdout.write("Dado inválido. Digite o sexo (M/F): ");
        sexo = stdin.readLineSync();
    }
    
    return sexo.trim().toUpperCase();
}

double validarPeso(){
    
    stdout.write("Digite o peso: ");
    String? pesoString = stdin.readLineSync();
    double? peso = double.tryParse(pesoString ?? "");

    while (peso == null || peso < 0 || peso.isInfinite || peso.isNaN) {
        stdout.write("Dado inválido, deve ser apenas um número a partir de 0. Digite o peso: ");
        pesoString = stdin.readLineSync();
        peso = double.tryParse(pesoString ?? "");
    }

    return peso!;
}  

List<String>? encontrarMaiorPesoFeminino(List<RecemNascido> recemNascidos) {
    
    var lista = recemNascidos.where((bebe) => bebe.sexo == "F").toList();
    
    if (lista.isEmpty){
        return null;
    } 
    
    double maiorPeso = lista.map((bebe) => bebe.peso).reduce((a, b) => a > b ? a : b);
    
    var maisPesadas = lista.where((bebe) => bebe.peso == maiorPeso).toList();
    
    if (maisPesadas.length > 1) {
        return maisPesadas.map((bebe) => bebe.nome).toList();
    }
    
    return [maisPesadas[0].nome];
}

Map<String, double>? calcularPercentualPorClassificacao(List<RecemNascido> lista) {
    if (lista.isEmpty) {
        return null;
    }
    
    int baixo = lista.where((bebe) => bebe.classificacaoPeso == "Baixo Peso").length;
    int normal = lista.where((bebe) => bebe.classificacaoPeso == "Normal").length;
    int alto = lista.where((bebe) => bebe.classificacaoPeso == "Alto Peso").length;
    
    int total = lista.length;
    
    double percentualBaixo = (baixo * 100 / total);
    double percentualNormal = (normal * 100 / total);
    double percentualAlto = (alto * 100 / total);
    
    percentualBaixo = (percentualBaixo * 100).truncateToDouble() / 100;
    percentualNormal = (percentualNormal * 100).truncateToDouble() / 100;
    percentualAlto = (percentualAlto * 100).truncateToDouble() / 100;
    
    return {
        "Baixo Peso": percentualBaixo,
        "Normal": percentualNormal,
        "Alto Peso": percentualAlto,
    };
}

void mostrarRecemNascidos(List<RecemNascido> recemNascidos) {
    if (recemNascidos.isEmpty) {
        print("Nenhum recém-nascido foi cadastrado.");
        return;
    }

    print("\n--- Lista de Recém-Nascidos ---");
    for (var recemNascido in recemNascidos) {
        print("${recemNascido.nome} - ${recemNascido.sexo} - ${recemNascido.classificacaoPeso}");
    }
}

void cadastrarRecemNascido(List<RecemNascido> lista, String nome, String sexo, double peso) {
    
    lista.add(RecemNascido(nome, sexo, peso));
}

bool desejarContinuar() {
    stdout.write("Deseja cadastrar um recém-nascido? (S/N): ");
    String? resposta = stdin.readLineSync();
    
    while(resposta == null || resposta.trim().isEmpty || (resposta.toUpperCase() != "S" && resposta.toUpperCase() != "N")){
        stdout.write("Dado inválido. Deseja cadastrar um recém-nascido? (S/N):");
        resposta = stdin.readLineSync();
    }
    
    resposta = resposta.trim().toUpperCase();
    
    return resposta == "S";
}


void main() {
    List<RecemNascido> recemNascidos = [];
    
    
    print("CADASTRO DE RECÉM-NASCIDOS");
    bool continuar = true;

    while (continuar) {
        
        continuar = desejarContinuar();
        
        if (!continuar) {
            print("Encerrando cadastro...");
            break;
        }
        
        String nome = validarNome();
        String sexo = validarSexo();
        double peso = validarPeso();
        
        
        try {
            cadastrarRecemNascido(recemNascidos, nome, sexo, peso);
            print("Recém-nascido cadastrado.");
            
        } catch (erro) {
            print("Erro(s) ao cadastrar recém-nascido: \n $erro");
        }
    }
    
    mostrarRecemNascidos(recemNascidos);
    
    print("\n--- Nome(s) do(s) recém-nascido(s) do sexo feminino com o maior peso. ---");
    var nomesMaisPesadas = encontrarMaiorPesoFeminino(recemNascidos);
    
    if (nomesMaisPesadas == null) {
        print("Não há recém-nascidos do sexo feminino.");
    } else if (nomesMaisPesadas.length == 1) {
        print("Recém-nascido do sexo feminino com o maior peso: ${nomesMaisPesadas[0]}");
    } else {
        print("Recém-nascidos do sexo feminino com o maior peso: ${nomesMaisPesadas.join(', ')}");
    }
    
    print("\n--- Percentual por classificação ---");
    var percentuais = calcularPercentualPorClassificacao(recemNascidos);
    
    if (percentuais != null) {
        percentuais.forEach((classificacao, percentual) {
        print("$classificacao: $percentual%");
        });
    } else {
        print("Nenhum recém-nascido cadastrado para calcular percentuais.");
    }
}