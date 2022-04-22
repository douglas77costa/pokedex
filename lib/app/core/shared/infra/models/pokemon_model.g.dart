// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 1;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      code: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      characteristic: fields[3] as String?,
      abilities: (fields[4] as List?)?.cast<String>(),
      about: fields[5] as String?,
      types: (fields[6] as List?)?.cast<TypesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.characteristic)
      ..writeByte(4)
      ..write(obj.abilities)
      ..writeByte(5)
      ..write(obj.about)
      ..writeByte(6)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      code: json['code'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      characteristic: json['characteristic'] as String?,
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      about: json['about'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'image': instance.image,
      'characteristic': instance.characteristic,
      'abilities': instance.abilities,
      'about': instance.about,
      'types': instance.types,
    };
