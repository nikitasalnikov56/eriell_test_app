// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDataAdapter extends TypeAdapter<HiveData> {
  @override
  final int typeId = 0;

  @override
  HiveData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveData(
      userName: fields[0] as String?,
      userEmail: fields[1] as String?,
      password: fields[2] as String?,
      isAuthenticated: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.userEmail)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.isAuthenticated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
