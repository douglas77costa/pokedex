// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesResponse _$PokemonSpeciesResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonSpeciesResponse(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) =>
              FlavorTextEntriesApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonSpeciesResponseToJson(
        PokemonSpeciesResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
    };
