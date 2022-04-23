// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypesModelAdapter extends TypeAdapter<TypesModel> {
  @override
  final int typeId = 2;

  @override
  TypesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypesModel(
      id: fields[0] as int?,
      type: fields[1] as String?,
      color: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TypesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesModel _$TypesModelFromJson(Map<String, dynamic> json) => TypesModel(
      id: json['id'] as int?,
      type: json['type'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$TypesModelToJson(TypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'color': instance.color,
    };
