import 'dart:convert';
import 'dart:io';
import 'dart:math';

int calculate() {
  return 6 * 7;
}


double lerConsoleDouble(String texto) {
  print(texto);
  var number = stdin.readLineSync(encoding: utf8) ?? "";
  do {
      try {
        greaterThanZero(double.parse(number));
        return double.parse(number);
      } catch (e) {
        print(e);
        print(texto);
        number = stdin.readLineSync(encoding: utf8) ?? "";
      }
    } while (true);
}

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  if (line == "") {
    print("Você pode excrever seu nome novamente, me parece que veio vazio?");
    lerConsole(texto);
  } else {
    return line ?? "";
  }

  return line ?? "";
  
}

bool greaterThanZero(double number) {
  if (number <= 0) {
    throw FormatException("Número tem que ser maior ou igual a zero!");
  }
  return true;
}

double calculateIMC(double peso, double altura) {
  return peso / pow(altura, 2);
}

String descriptionIMC(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc >= 16 && imc < 17) {
    return "Magreza moderada";
  } else if (imc >= 17 && imc < 18.5) {
    return "Magreza leve";
  } else if (imc >= 18.5 && imc < 25) {
    return "Saudável";
  } else if (imc >= 25 && imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    return "Obesidade Grau I";
  } else if (imc >= 35 && imc < 40) {
    return "Obesidade Grau II (severa)";
  } else if (imc >= 40) {
    return "Obesidade Grau III (mórbida)";
  } else {
    return "";
  }
}