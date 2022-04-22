// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesApiModel _$TypesApiModelFromJson(Map<String, dynamic> json) =>
    TypesApiModel(
      type: json['type'] == null
          ? null
          : TypeApiModel.fromJson(json['type'] as Map<String, dynamic>),
    )..slot = json['slot'] as int?;

Map<String, dynamic> _$TypesApiModelToJson(TypesApiModel instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
