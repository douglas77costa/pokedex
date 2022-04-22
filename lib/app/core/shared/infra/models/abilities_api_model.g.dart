// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilitiesApiModel _$AbilitiesApiModelFromJson(Map<String, dynamic> json) =>
    AbilitiesApiModel(
      ability: json['ability'] == null
          ? null
          : AbilityApiModel.fromJson(json['ability'] as Map<String, dynamic>),
    )
      ..isHidden = json['isHidden'] as bool?
      ..slot = json['slot'] as int?;

Map<String, dynamic> _$AbilitiesApiModelToJson(AbilitiesApiModel instance) =>
    <String, dynamic>{
      'isHidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };
