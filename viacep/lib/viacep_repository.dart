import 'package:dio/dio.dart';
import 'package:viacep/viacep_model.dart';

class ViaCEPRepository {

  Future<ViaCEPModel> get(String cep) async {
    var dio = Dio();
    
    var result = await dio.get('https://viacep.com.br/ws/$cep/json/');

    return ViaCEPModel.fromJson(result.data);
  }

}