import 'package:meu_app/classes/Pessoa.dart';
import 'package:meu_app/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {

  String _cnpj = "";

  void setcnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getcnpj() {
    return _cnpj;
  }

  PessoaJuridica (String nome, String endereco, String cnpj, TipoNotificacao tipoNotificacao):super(nome, endereco, tipoNotificacao : tipoNotificacao) {
    _cnpj = cnpj;
  }

  @override
  String toString() {
    return {
    "Nome": super.getNome(),
    "Endereço": super.getEndereco(),
    "CNPJ": _cnpj,
    "TipoNotificacao": getTipoNotificacao()
    }.toString();
  }
}