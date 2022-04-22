import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/infra/models/abilities_api_model.dart';

import '../../domain/entities/pokemon_api.dart';
import 'types_api_model.dart';

part 'pokemon_api_model.g.dart';

@JsonSerializable()
class PokemonApiModel extends PokemonApi {
  final List<TypesApiModel>? types;
  final List<AbilitiesApiModel>? abilities;

  PokemonApiModel({this.abilities, this.types}) : super(types: types,abilities: abilities);

  factory PokemonApiModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonApiModelToJson(this);
}
