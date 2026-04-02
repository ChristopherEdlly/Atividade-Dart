// Questão 3
// Faça um algoritmo que imprima a série abaixo, o número de termos será lido.
// S = 1 5 100 2 10 90 4 15 80 8 20 70 16 25 60 32 30 50 64 35 40 128 40 30 256 ...

import "dart:io";

void imprimirSerie(int termos){
    
    int termoA = 1;
    int termoB = 5;
    int termoC = 100;
    
    for (int i = 1; i<= termos; i++){
        if (i % 3 == 1){
            stdout.write(termoA);
            stdout.write(" ");
            termoA = termoA * 2;
            
        }
        else if (i % 3  == 2){
            stdout.write(termoB);
            stdout.write(" ");
            termoB = termoB + 5;

        }
        else{
            stdout.write(termoC);
            stdout.write(" ");
            termoC = termoC - 10;
            
        }
    }
    
}

int obterNumeroDeTermosValidado(){
    
    stdout.write("Informe o número de termos que a série deve ter: ");
    String? numeroDeTermos = stdin.readLineSync();
    
    while (numeroDeTermos == null || numeroDeTermos.trim().isEmpty || int.tryParse(numeroDeTermos.trim()) == null || int.parse(numeroDeTermos.trim()) < 0){
        
        stdout.write("Dado inválido, deve ser apenas um número inteiro a partir de 0. Informe o número de termos que a série deve ter: ");
        numeroDeTermos = stdin.readLineSync();
    }
    
    int numeroDeTermosConvertidoInt = int.parse(numeroDeTermos.trim());
    return numeroDeTermosConvertidoInt;
}

int validarNumeroDeTermos (String? numeroDeTermos){
    
    if (numeroDeTermos == null ||
    numeroDeTermos.trim().isEmpty ||
    int.tryParse(numeroDeTermos.trim()) == null ||
    int.parse(numeroDeTermos.trim()) < 0){
        
        throw Exception("Dado inválido, deve ser apenas um número inteiro a partir de 0.");

    }
    return int.parse(numeroDeTermos.trim());
}

void main() {
    
    try{
    
        int numeroDeTermosUsuario = obterNumeroDeTermosValidado();
        print("Série de $numeroDeTermosUsuario termos:");
        imprimirSerie(numeroDeTermosUsuario);
        print("");
    } catch (erro){
        print("Erro causado por entrada de dados inválida via código:");
        print("$erro");
    
    }

}