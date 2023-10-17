// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DadosUsuarioModelAdapter extends TypeAdapter<DadosUsuarioModel> {
  @override
  final int typeId = 0;

  @override
  DadosUsuarioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DadosUsuarioModel()
      ..nome = fields[0] as String?
      ..altura = fields[1] as double?;
  }

  @override
  void write(BinaryWriter writer, DadosUsuarioModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.altura);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DadosUsuarioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
