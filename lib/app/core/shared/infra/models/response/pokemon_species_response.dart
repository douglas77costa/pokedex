import 'package:json_annotation/json_annotation.dart';

import '../flavor_text_entries_api_model.dart';

part 'pokemon_species_response.g.dart';

@JsonSerializable()
class PokemonSpeciesResponse {
  @JsonKey(name: 'flavor_text_entries')
  List<FlavorTextEntriesApiModel>? flavorTextEntries;
  PokemonSpeciesResponse({this.flavorTextEntries});

  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpeciesResponseToJson(this);
}