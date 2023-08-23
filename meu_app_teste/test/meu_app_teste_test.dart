import 'package:meu_app_teste/classes/viacep.dart';
import 'package:meu_app_teste/meu_app_teste.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_teste_test.mocks.dart';

@GenerateMocks([MockViaCEP])
void main() {
  test('Calcula o Desconto do produto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcula o Desconto do produto sem porcentagem com produto zerado', () {
    expect(() => app.calcularDesconto(0, 150, false), 
      throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o Desconto do produto com porcentagem', () {
    expect(app.calcularDesconto(1000, 20, true), 800);
  });

  test('Calcula o Desconto do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, false), 
      throwsA(TypeMatcher<ArgumentError>()));
  });

group('Calcula o valor do produto com desconto', () {
  var valuesToTest = {
    {'valor': 1000, 'desconto': 150, 'percentual': false} : 850,
    {'valor': 1000, 'desconto': 15, 'percentual': true} : 850,
  };
  valuesToTest.forEach((values, expected) { 
    test('$values: $expected', () {
      expect(app.calcularDesconto(
        double.parse(values["valor"].toString()), 
        double.parse(values['desconto'].toString()), 
        values['percentual'] == true), 
        equals(expected));
    });
  });
});

group('Calcula o valor do produto informando valores zerados', () {
  var valuesToTest = {
    {'valor': 0, 'desconto': 150, 'percentual': false},
    {'valor': 1000, 'desconto': 0, 'percentual': true},
  };
  for (var values in valuesToTest) { 
    test('$values', () {
      expect(() => app.calcularDesconto(
        double.parse(values["valor"].toString()), 
        double.parse(values['desconto'].toString()), 
        values['percentual'] == true), 
        throwsA(TypeMatcher<ArgumentError>()));
    });
  }
});

test('Testar conversão para uppercase', () {
    expect(app.convertToUpper("dio"), "DIO");
  });

  test('Retornar CEP', () async {
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornaCEP("04140040")).thenAnswer((realInvocation) => Future.value(
      {
        "cep": "04140-040",
        "logradouro": "Rua Gonçalo da Cunha",
        "complemento": "",
        "bairro": "Chácara Inglesa",
        "localidade": "São Paulo",
        "uf": "SP",
        "ibge": "3550308",
        "gia": "1004",
        "ddd": "11",
        "siafi": "7107"
      }
    ));


    var body = await mockMockViaCEP.retornaCEP("04140040");
    print(body);
    expect(body["bairro"], "Chácara Inglesa");
    expect(body["logradouro"], "Rua Gonçalo da Cunha");
  });

}

class MockViaCEP extends Mock implements ViaCEP {}