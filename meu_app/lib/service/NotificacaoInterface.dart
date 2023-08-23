import 'package:meu_app/classes/Pessoa.dart';
import 'package:meu_app/service/EmailNotificacao.dart';

abstract class NotificacaoInterface {
  void enviarNotificacao(Pessoa pessoa);
}