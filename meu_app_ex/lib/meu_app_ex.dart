
import 'package:meu_app_ex/exception/nome_invalido_exception.dart';
import 'package:meu_app_ex/models/Aluno.dart';
import 'package:meu_app_ex/models/Utils.dart';

void execute() {


  print("Bem vindo ao sistema de notas!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do aluno: ");
  

  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
  } catch(e) {
    print(e);
  }

  var aluno = Aluno(nome);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida("Digite a nota ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);

  print(aluno.toString());
  print("A média do aluno foi ${aluno.retornaMedia()}");

  if (aluno.aprovado(7)) {
    print("O aluno ${aluno.getNome()} foi aprovado!");
  } else {
    print("O aluno ${aluno.getNome()} foi reprovado!");
  }
}