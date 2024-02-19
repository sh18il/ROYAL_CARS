// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'low_cars_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LowCarsModelAdapter extends TypeAdapter<LowCarsModel> {
  @override
  final int typeId = 3;

  @override
  LowCarsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LowCarsModel(
      name: fields[1] as String,
      model: fields[2] as String,
      km: fields[3] as String,
      dlnumber: fields[4] as String,
      owner: fields[5] as String,
      price: fields[6] as String,
      future: fields[7] as String,
      image: fields[8] as String?,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, LowCarsModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.km)
      ..writeByte(4)
      ..write(obj.dlnumber)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.future)
      ..writeByte(8)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LowCarsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
