import 'package:imc_calculator/classes/pessoa.dart';
import 'package:imc_calculator/imc_calculator.dart' as imc_calculator;

void main(List<String> arguments) {
  
String nome = imc_calculator.lerConsole("Digite seu nome: ");
double peso = imc_calculator.lerConsoleDouble("Digite seu Peso: ");
double altura = imc_calculator.lerConsoleDouble("Digite sua Altura: ");

Pessoa pessoa = Pessoa(nome, peso, altura);

double imc = imc_calculator.calculateIMC(peso, altura);
String description = imc_calculator.descriptionIMC(imc);

print("Boa tarde ${pessoa.getNome()}! Considerando o peso de ${pessoa.getPeso()} e a altura de ${pessoa.getAltura()}.");
print("Você tem um IMC calculado de $imc, ou seja, possui a classificação $description");

}
