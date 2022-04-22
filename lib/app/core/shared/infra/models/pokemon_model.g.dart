// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..name = json['name'] as String?
      ..image = json['image'] as String?
      ..characteristic = json['characteristic'] as String?
      ..abilities = (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..about = json['about'] as String?;

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
