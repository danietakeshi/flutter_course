

import 'package:meu_app/classes/PessoaFisica.dart';
import 'package:meu_app/classes/pessoaJuridica.dart';
import 'package:meu_app/enum/tipo_notificacao.dart';
import 'package:meu_app/service/EmailNotificacao.dart';
import 'package:meu_app/service/NotificacaoInterface.dart';

void main(List<String> arguments) {
  var p2 = PessoaFisica("Daniel", "Rua 8", "12345678", TipoNotificacao.EMAIL);
  print(p2);
  var p3 = PessoaJuridica("Daniel", "Rua 8","12345678", TipoNotificacao.SMS);
  print(p3);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(p2);
  enviarNotificacao.notificar(p3);
}

