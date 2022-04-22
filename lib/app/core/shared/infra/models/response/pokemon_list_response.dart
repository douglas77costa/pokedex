import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/infra/models/pokemon_item_model.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponseModel{
  int? count;
  String? next;
  String? previous;
  List<PokemonItemModel>? results;

  PokemonListResponseModel({this.count, this.next, this.previous, this.results});

  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListResponseModelToJson(this);
}