import 'package:meu_app/enum/tipo_notificacao.dart';

abstract class Pessoa {

  String _nome = "";
  String _endereco = "";
  String _celular = "";
  String _email = "";
  String _token = "";
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;

  void setNome(String nome) {
    _nome = nome;
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  void setTipoNotificacao (TipoNotificacao tipoNotificacao) {
    _tipoNotificacao = tipoNotificacao;
  }

  void setCelular(String celular) {
    _celular = celular;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setToken(String token) {
    _token = token;
  }

  String getNome() {
    return _nome;
  }

  String getEndereco() {
    return _endereco;
  }

  String getCelular() {
    return _celular;
  }

  String getEmail() {
    return _email;
  }

  String getToken() {
    return _token;
  }

  TipoNotificacao getTipoNotificacao() {
    return _tipoNotificacao;
  }

  Pessoa (String nome, String endereco, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}) {
    _nome = nome;
    _endereco = endereco;
    _tipoNotificacao = tipoNotificacao;
  }

  @override
  String toString() {
    return {
    "Nome": _nome,
    "Endereço": _endereco
    }.toString();
  }

}