import 'package:dio/dio.dart';
import 'package:viacep/cep_model.dart';
import 'package:viacep/viacep_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CEPRepository {

  var _dio = Dio();
  

  CEPRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] = dotenv.env['APP_ID'];
    _dio.options.headers["X-Parse-REST-API-Key"] = dotenv.env['API_KEY'];
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<CEPModel> get() async {

    var result = await _dio.get('/CEP');

    return CEPModel.fromJson(result.data);
  }

  Future<void> post(ViaCEPModel viaCEPModel) async {

    try {
      var response = await _dio.post("/CEP", 
      data: viaCEPModel.toJson());
    } catch (e) {
      throw e;
    }

  }

    Future<void> delete(String? objectId) async {

    try {
      print("/CEP/$objectId");
      var response = await _dio.delete("/CEP/$objectId");
    } catch (e) {
      throw e;
    }

  }

}