import 'package:hive/hive.dart';

part 'UserConfig.g.dart';

@HiveType(typeId: 0)
class UserConfig extends HiveObject  {
  @HiveField(0)
  String? name;

  @HiveField(1)
  double? height;

  UserConfig();

  UserConfig.vazio() {
    name = "";
    height = 0;
  }

}
