// Questão 4
// Elabore um algoritmo para ler a matrícula, nome, sexo (“M’ e “F”), três notas e o
// número de faltas dos alunos de uma escola, onde o FLAG é a matrícula =’00000’. E
// imprima os seguintes resultados:
// a) A média da turma.
// b) O percentual de alunos aprovados.
// c) A matrícula do aluno do sexo masculino e feminino que possui a maior média e que
// foi aprovado.
// d) A média dos alunos do sexo feminino.

// Obs: Considere para aprovação a média 7,0 e o limite de faltas 18.

import 'dart:io';

class Aluno{
    String  _matricula;
    String _nome;
    String _sexo;
    List <double> _notas;
    int _faltas;
    
    String get matricula => _matricula;
    String get nome => _nome;
    String get sexo => _sexo;
    List<double> get notas => List.unmodifiable(_notas);
    int get faltas => _faltas;

    double get media => (_notas.fold(0.0, (a, b) => a + b) / _notas.length * 100).truncateToDouble() / 100;

    bool get aprovacao => media >= 7.0 && _faltas <= 18;

    Aluno(this._matricula, this._nome, this._sexo, this._notas, this._faltas){
        List<String> erros = [];
        
        if (!RegExp(r'^\d{5}$').hasMatch(matricula.trim()) || _matricula == "00000" ) {
            erros.add("Dado inválido em matrícula. Deve haver apenas 5 números inteiros não negativos (exceto '00000').");
        }
        
        if (_nome.trim().isEmpty || !RegExp(r'^[A-Za-zÀ-ÿ\s]+$').hasMatch(_nome.trim())) {
            erros.add("Dado inválido em nome. Deve haver apenas letras e espaços.");
        }
      
        
        _sexo = _sexo.trim().toUpperCase();
        if (!["M", "F"].contains(_sexo)) {
            erros.add("Dado inválido em sexo. Deve ser apenas 'M' ou 'F'.");
        }
        
        
        if (_notas.length != 3) {
            erros.add("Dado inválido em notas. Deve haver apenas 3 notas.");
        }
        
        for (double nota in _notas) {
            if (nota < 0 || nota > 10 || nota.isNaN || nota.isInfinite) {
                erros.add("Dado inválido em nota. Deve ser composta apenas por um número de 0 a 10.");
            }
        }
        
        _notas = List.unmodifiable(_notas); 
        
        if (_faltas < 0) {
            erros.add("Dado inválido em faltas. Deve ser apenas um número inteiro a partir de 0.");
        }
        
        if (erros.isNotEmpty) {
            throw Exception(erros.join("\n"));
        }
        
    }

}



String? validarMatricula(List<Aluno> alunos) {
    stdout.write("Digite a matrícula (deve haver apenas 5 números inteiros não negativos): ");
    String? matricula = stdin.readLineSync();
    
    if (matricula == "00000") {
        return null;
    }
    
    while (matricula == null || !RegExp(r'^\d{5}$').hasMatch(matricula!.trim()) || alunos.any((aluno) => aluno.matricula == matricula!.trim())) {
    
        stdout.write("Dado inválido ou matrícula já existe. Digite a matrícula (deve haver apenas 5 números inteiros não negativos): ");
        matricula = stdin.readLineSync();
        
        if (matricula == "00000") {
            return null;
        }
    }
    
    return matricula.trim(); 
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

List<double> validarNotas() {
    List<double> notas = [];
    
    for (int i = 1; i <= 3; i++) {
        double? notaConvertida;
        
        do {
            stdout.write("Digite a $iª nota (0 a 10): ");
            String? notaStr = stdin.readLineSync();
            
            notaConvertida = (notaStr != null && notaStr.trim().isNotEmpty) 
              ? double.tryParse(notaStr.trim()) 
              : null;
            
            if (notaConvertida == null || notaConvertida < 0 || notaConvertida > 10 || notaConvertida.isNaN || notaConvertida.isInfinite) {
                print("Dado inválido, deve ser composta apenas por um número de 0 a 10. ");
                notaConvertida = null; 
            }
            
        } while (notaConvertida == null);
        
        notas.add((notaConvertida * 100).truncateToDouble() / 100);
    }
    
    return notas;
}

int validarFaltas(){
    
    stdout.write("Digite o número de faltas (a partir de 0): ");
    String? faltas = stdin.readLineSync();
    
    while (faltas == null || faltas.trim().isEmpty || int.tryParse(faltas.trim()) == null || int.parse(faltas.trim()) < 0) {
        stdout.write("Dado inválido, deve ser apenas um número inteiro a partir de 0. Digite o número de faltas: ");
        faltas = stdin.readLineSync();
    }
    
    int faltasConvertidasInt = int.parse(faltas.trim());
    
    return faltasConvertidasInt;
}    


double? calcularMediaTurma(List<Aluno> alunos) {
    if (alunos.isEmpty){
      return null;
    } 
  
    double media = alunos.map((aluno) => aluno.media).reduce((a, b) => a + b) / alunos.length;
    
    
    return (media * 100).truncateToDouble() / 100;
}


double? calcularPercentualAlunosAprovados(List<Aluno> alunos) {
    if (alunos.isEmpty){
        return null;
    } 

    double percentual = alunos.where((aluno) => aluno.aprovacao).length * 100 / alunos.length;
    return (percentual * 100).truncateToDouble() / 100;
    
}
    

List<String>? definirMatriculaMasculino(List<Aluno> alunos) {
    var lista = alunos.where((aluno) => aluno.aprovacao && aluno.sexo == "M").toList();
    
    if (lista.isEmpty) {
        return null;
    }
    
    double maiorMedia = lista.map((a) => a.media).reduce((a, b) => a > b ? a : b);
    
    var alunosComMaiorMedia = lista.where((aluno) => aluno.media == maiorMedia).toList();
    
    if (alunosComMaiorMedia.length > 1) {
        return alunosComMaiorMedia.map((aluno) => aluno.matricula).toList();
    }
    
    return [alunosComMaiorMedia[0].matricula];
}

List<String>? definirMatriculaFeminino(List<Aluno> alunos) {
    var lista = alunos.where((aluno) => aluno.aprovacao && aluno.sexo == "F").toList();
    if (lista.isEmpty) {
        return null;
    }
    
    double maiorMedia = lista.map((a) => a.media).reduce((a, b) => a > b ? a : b);
    
    var alunosComMaiorMedia = lista.where((aluno) => aluno.media == maiorMedia).toList();
    
    if (alunosComMaiorMedia.length > 1) {
        return alunosComMaiorMedia.map((aluno) => aluno.matricula).toList();
    }
    
    return [alunosComMaiorMedia[0].matricula];
}

double? calcularMediaFeminino(List<Aluno> alunos) {
    var alunoSexoFeminino = alunos.where((aluno) => aluno.sexo == "F").toList();
    
    if (alunoSexoFeminino.isEmpty){
        return null;
    } 
    
    double media = alunoSexoFeminino
    .map((aluno) => aluno.media)
    .reduce((a, b) => a + b) / alunoSexoFeminino.length;
    
    return (media * 100).truncateToDouble() / 100;
}

void cadastrarAluno(List<Aluno> alunos, String matricula, String nome, String sexo, List<double> notas, int faltas) {
    if (alunos.any((a) => a.matricula == matricula)) {
        throw Exception("Matrícula já cadastrada.");
    }

    alunos.add(Aluno(matricula, nome, sexo, notas, faltas));
}
    
void main() {
  
    List<Aluno> alunos = [];
    
    print("CADASTRO DE ALUNOS");
    print("Para encerrar o programa, digite '00000' no campo 'matrícula'.");
    
    while (true){
    
        String? matricula = validarMatricula(alunos);
        
        if (matricula == null) {
            print("Encerrando...");
            break; 
        }
        
        
        String nome = validarNome();
        
        String sexo = validarSexo();
        
        List <double> notas = validarNotas();
        
        int faltas = validarFaltas();
        
            
        try {
            cadastrarAluno(alunos, matricula, nome, sexo, notas, faltas);
            print("Aluno cadastrado.");
          
        } catch (erro){
            print("Erro(s) ao criar aluno via código:\n$erro");
        }
        
    
    }
    
    double? mediaTurma = calcularMediaTurma(alunos);
    double? percentualAlunosAprovados  = calcularPercentualAlunosAprovados(alunos);
    List<String>? matriculaMasculino  = definirMatriculaMasculino(alunos);
    List<String>? matriculaFeminino  = definirMatriculaFeminino(alunos);
    double? mediaFeminino  = calcularMediaFeminino(alunos);
    
    if (mediaTurma == null){
        print("Nenhum aluno foi cadastrado.");
    }else{
        print("Média da turma: $mediaTurma");

    }
    
     if (percentualAlunosAprovados == null){
        print("Nenhum aluno foi aprovado.");
    }else{
        print("Percentual de alunos aprovados: $percentualAlunosAprovados%");

    }
    
    
    if (matriculaMasculino == null) {
        print("Não há aluno do sexo masculino com a maior média aprovado.");
    }else if (matriculaMasculino.length > 1) {
        print("Matrículas dos alunos do sexo masculino que possuem a maior média e que foram aprovados: ${matriculaMasculino.join(", ")}");
    } 
    else {
        print("Matrícula do aluno do sexo masculino que possui a maior média e que foi aprovado: ${matriculaMasculino[0]}");
    }
    
    if (matriculaFeminino == null) {
        print("Não há aluno do sexo feminino com a maior média aprovado.");
    }else if (matriculaFeminino.length > 1) {
        print("Matrículas das alunas do sexo feminino que possuem a maior média e que foram aprovadas: ${matriculaFeminino.join(", ")}");
    }  
    else {
        print("Matrícula da aluna do sexo feminino que possui a maior média e que foi aprovada: ${matriculaFeminino[0]}");
    }
    
    if (mediaFeminino == null){
        print("Nenhum aluno do sexo feminino cadastrado.");
    }else{
        print("Média dos alunos do sexo feminino: $mediaFeminino");

    }

}