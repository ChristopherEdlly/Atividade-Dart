// Questão 1
// Dado o seguinte mapa de preços de bolos:
// const boloPrecos = {'ovos' : 5,5, 'chocolate' : 7,5, 'cenoura' : 6,5, };
// Escreva um programa em Dart para calcular o total para um determinado pedido.
// Por exemplo, dada a seguinte ordem:
// const ordem =['ovos', 'chocolate'];
// O programa deve imprimir -> Total = 13.0
// OBS.: Se um bolo não estiver no cardápio, o programa deve imprimir algo assim ->
// limão não está no cardápio

double calcularPrecoTotal(Map<String, double> boloPrecos, List <String> pedidos){
    
    double precoTotal = 0;
    
    for(String bolo in pedidos){
        
        if (boloPrecos.containsKey(bolo)){
            precoTotal += boloPrecos[bolo]!;
        
        }
    }
    return precoTotal;
}

void identificarBolosInvalidos(Map<String, double> boloPrecos, List<String> pedidos) {
    
    for (String bolo in pedidos){
      
        if (!boloPrecos.containsKey(bolo)) {
            print("$bolo não está no cardápio."); 
        }    
    }

}

void main(){
    
    const boloPrecos = {'ovos' : 5.5, 'chocolate' : 7.5, 'cenoura' : 6.5 };
        
    List <String> pedidos = ['ovos', 'chocolate'];
    
    double precoTotal = calcularPrecoTotal(boloPrecos, pedidos);
    
    identificarBolosInvalidos(boloPrecos, pedidos);
    
    print("Total = $precoTotal");
}