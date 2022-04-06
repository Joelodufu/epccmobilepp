// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devotional.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevotionalAdapter extends TypeAdapter<Devotional> {
  @override
  final int typeId = 0;

  @override
  Devotional read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Devotional()
      ..topic = fields[0] as String
      ..bibleLink = fields[1] as String
      ..bibleText = fields[2] as String
      ..insight = fields[3] as String
      ..prayer = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, Devotional obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.topic)
      ..writeByte(1)
      ..write(obj.bibleLink)
      ..writeByte(2)
      ..write(obj.bibleText)
      ..writeByte(3)
      ..write(obj.insight)
      ..writeByte(4)
      ..write(obj.prayer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevotionalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
