import 'package:json_annotation/json_annotation.dart';

import '../../domain/enitities/pokemon_api.dart';
import 'types_api_model.dart';

part 'pokemon_api_model.g.dart';

@JsonSerializable()
class PokemonApiModel extends PokemonApi{

  final List<TypesApiModel>? types;

  PokemonApiModel({this.types}):super(types:types);

  factory PokemonApiModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonApiModelToJson(this);
}