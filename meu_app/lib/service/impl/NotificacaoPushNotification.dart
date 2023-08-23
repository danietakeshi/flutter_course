import 'package:meu_app/service/NotificacaoInterface.dart';

class NotificacaoPushNotification implements NotificacaoInterface {

  @override
  void enviarNotificacao(pessoa) {
      print("Enviado Push para: ${pessoa.getNome()}");
  }
}