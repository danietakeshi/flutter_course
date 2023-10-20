import 'package:contatos/contatos_model.dart';
import 'package:dio/dio.dart';


class ContatosRepository {

  var _dio = Dio();
  

  ContatosRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] = "";
    _dio.options.headers["X-Parse-REST-API-Key"] = "";
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<ContatosModel> get() async {

    var result = await _dio.get('/Contatos');

    return ContatosModel.fromJson(result.data);
  }

  Future<void> post(Contato contato) async {
    
    try {
      var response = await _dio.post("/Contatos", 
      data: contato);
    } catch (e) {
      throw e;
    }

  }

    Future<void> delete(String? objectId) async {

    try {
      print("/Contatos/$objectId");
      var response = await _dio.delete("/Contatos/$objectId");
    } catch (e) {
      throw e;
    }

  }

}