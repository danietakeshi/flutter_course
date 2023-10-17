import 'package:hive/hive.dart';
import 'user_config_model.dart';

class DadosUsuarioRepository {
  static late Box _box;

  DadosUsuarioRepository._criar();

  static Future<DadosUsuarioRepository> carregar() async {
    if (Hive.isBoxOpen('DadosUsuarioModel')) {
      _box = Hive.box('DadosUsuarioModel');
    } else {
      _box = await Hive.openBox('DadosUsuarioModel');
    }
    return DadosUsuarioRepository._criar();
  }

  salvar(DadosUsuarioModel dadosUsuarioModel) {
    _box.put('DadosUsuarioModel', dadosUsuarioModel);
  }

  DadosUsuarioModel obterDados() {
    var dadosUsuarioModel = _box.get('DadosUsuarioModel');
    if (dadosUsuarioModel == null) {
      return DadosUsuarioModel.vazio();
    }
    return dadosUsuarioModel;
  }
}