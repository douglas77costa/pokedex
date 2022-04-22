// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text_entries_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorTextEntriesApiModel _$FlavorTextEntriesApiModelFromJson(
        Map<String, dynamic> json) =>
    FlavorTextEntriesApiModel(
      language: json['language'] == null
          ? null
          : LanguageApiModel.fromJson(json['language'] as Map<String, dynamic>),
    )..flavorText = json['flavorText'] as String?;

Map<String, dynamic> _$FlavorTextEntriesApiModelToJson(
        FlavorTextEntriesApiModel instance) =>
    <String, dynamic>{
      'flavorText': instance.flavorText,
      'language': instance.language,
    };
