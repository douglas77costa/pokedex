// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text_entries_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlavorTextEntriesApiModel _$FlavorTextEntriesApiModelFromJson(
        Map<String, dynamic> json) =>
    FlavorTextEntriesApiModel(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : LanguageApiModel.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntriesApiModelToJson(
        FlavorTextEntriesApiModel instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };
