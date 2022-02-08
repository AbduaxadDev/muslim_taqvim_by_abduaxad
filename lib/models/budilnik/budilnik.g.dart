// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budilnik.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************



class AlarmModelAdapter extends TypeAdapter<AlarmModel> {
  @override
  final int typeId = 7;

  @override
  AlarmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmModel(
      saharlik: fields[0] as bool,
      iftorlik: fields[1] as bool,
      bomdod: fields[2] as bool,
      quyosh: fields[3] as bool,
      peshin: fields[4] as bool,
      asr: fields[5] as bool,
      shom: fields[6] as bool,
      xufton: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.saharlik)
      ..writeByte(1)
      ..write(obj.iftorlik)
      ..writeByte(2)
      ..write(obj.bomdod)
      ..writeByte(3)
      ..write(obj.quyosh)
      ..writeByte(4)
      ..write(obj.peshin)
      ..writeByte(5)
      ..write(obj.asr)
      ..writeByte(6)
      ..write(obj.shom)
      ..writeByte(7)
      ..write(obj.xufton);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
