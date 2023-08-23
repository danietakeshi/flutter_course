import 'package:imc_calculator/imc_calculator.dart' as app;
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(app.calculate(), 42);
  });

  test('Calculate IMC', () {
    expect(app.calculateIMC(80, 1.8), 24.691358024691358);
  });

  group('Testa as classificações de IMC', () {
    var valuesToTest = {
      {'imc': 15} : "Magreza grave",
      {'imc': 16} : "Magreza moderada",
      {'imc': 17} : "Magreza leve",
      {'imc': 19} : "Saudável",
      {'imc': 25} : "Sobrepeso",
      {'imc': 30} : "Obesidade Grau I",
      {'imc': 35} : "Obesidade Grau II (severa)",
      {'imc': 42} : "Obesidade Grau III (mórbida)",
    };
    valuesToTest.forEach((values, expected) { 
      test('$values: $expected', () {
        expect(app.descriptionIMC(
          double.parse(values["imc"].toString())), 
          equals(expected));
      });
    });
  });

}
