// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesResponse _$PokemonSpeciesResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonSpeciesResponse(
      flavorTextEntries: (json['flavorTextEntries'] as List<dynamic>?)
          ?.map((e) =>
              FlavorTextEntriesApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpeciesResponseToJson(
        PokemonSpeciesResponse instance) =>
    <String, dynamic>{
      'flavorTextEntries': instance.flavorTextEntries,
    };
