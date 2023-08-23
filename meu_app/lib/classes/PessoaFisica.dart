import 'package:meu_app/classes/Pessoa.dart';
import 'package:meu_app/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {

  String _cpf = "";

  void setCPF(String cpf) {
    _cpf = cpf;
  }

  String getCPF() {
    return _cpf;
  }

  PessoaFisica (String nome, String endereco, String cpf, TipoNotificacao tipoNotificacao):super(nome, endereco, tipoNotificacao : tipoNotificacao) {
    _cpf = cpf;
  }

  @override
  String toString() {
    return {
    "Nome": super.getNome(),
    "Endereço": super.getEndereco(),
    "CPF": _cpf,
    "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}