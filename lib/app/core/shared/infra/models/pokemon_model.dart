import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/domain/enitities/pokemon.dart';
import 'package:pokedex/app/core/shared/infra/models/types_model.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel extends Pokemon{

  final List<TypesModel>? types;

  PokemonModel({this.types}):super(types: types);

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}