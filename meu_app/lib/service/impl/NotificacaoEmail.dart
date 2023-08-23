import 'package:meu_app/service/NotificacaoInterface.dart';

class NotificacaoEmail implements NotificacaoInterface {

  @override
  void enviarNotificacao(pessoa) {
      print("Enviado Email para: ${pessoa.getNome()}");
  }
}