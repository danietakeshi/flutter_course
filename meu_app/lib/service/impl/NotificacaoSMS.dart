import 'package:meu_app/service/NotificacaoInterface.dart';

class NotificacaoSMS implements NotificacaoInterface {

  @override
  void enviarNotificacao(pessoa) {
      print("Enviado SMS para: ${pessoa.getNome()}");
  }
}