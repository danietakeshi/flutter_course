import 'package:hive/hive.dart';

part 'user_config_model.g.dart';

@HiveType(typeId: 0)
class DadosUsuarioModel extends HiveObject {
  @HiveField(0)
  String? nome;

  @HiveField(1)
  double? altura;

  DadosUsuarioModel();

  DadosUsuarioModel.vazio() {
    nome = "";
    altura = 1.0;
  }
}