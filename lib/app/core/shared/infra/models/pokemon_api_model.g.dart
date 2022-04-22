// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonApiModel _$PokemonApiModelFromJson(Map<String, dynamic> json) =>
    PokemonApiModel(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypesApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..name = json['name'] as String?;

Map<String, dynamic> _$PokemonApiModelToJson(PokemonApiModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'types': instance.types,
    };
