import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/domain/enitities/pokemon_item.dart';

part 'pokemon_item_model.g.dart';

@JsonSerializable()
class PokemonItemModel extends PokemonItem{
  PokemonItemModel(): super();

  factory PokemonItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonItemModelToJson(this);
}