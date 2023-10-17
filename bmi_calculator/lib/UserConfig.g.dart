// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserConfig.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserConfigAdapter extends TypeAdapter<UserConfig> {
  @override
  final int typeId = 0;

  @override
  UserConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserConfig()
      ..name = fields[0] as String?
      ..height = fields[1] as double?;
  }

  @override
  void write(BinaryWriter writer, UserConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
