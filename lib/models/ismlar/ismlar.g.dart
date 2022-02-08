// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ismlar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OllohIsmlariModelAdapter extends TypeAdapter<OllohIsmlariModel> {
  @override
  final int typeId = 6;

  @override
  OllohIsmlariModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OllohIsmlariModel(
      id: fields[0] as String?,
      arName: fields[1] as String?,
      enName: fields[2] as String?,
      meaning: fields[3] as String?,
      explanation: fields[4] as String?,
      benefit: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OllohIsmlariModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.arName)
      ..writeByte(2)
      ..write(obj.enName)
      ..writeByte(3)
      ..write(obj.meaning)
      ..writeByte(4)
      ..write(obj.explanation)
      ..writeByte(5)
      ..write(obj.benefit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OllohIsmlariModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
