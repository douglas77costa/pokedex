import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/shared/infra/models/types_model.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PokemonModel extends Pokemon {
  @HiveField(0)
  int? code;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? characteristic;
  @HiveField(4)
  List<String>? abilities;
  @HiveField(5)
  String? about;
  @HiveField(6)
  final List<TypesModel>? types;

  PokemonModel(
      {this.code,
      this.name,
      this.image,
      this.characteristic,
      this.abilities,
      this.about,
      this.types})
      : super();

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
