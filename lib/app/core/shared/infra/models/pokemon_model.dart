import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/shared/infra/models/types_model.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class PokemonModel extends Pokemon {
  @HiveField(0)
  @override
  int? code;
  @HiveField(1)
  @override
  String? name;
  @HiveField(2)
  @override
  String? image;
  @HiveField(3)
  @override
  String? characteristic;
  @HiveField(4)
  @override
  List<String>? abilities;
  @HiveField(5)
  @override
  String? about;
  @HiveField(6)
  @override
  final List<TypesModel>? types;

  PokemonModel(
      {this.code,
      this.name,
      this.image,
      this.characteristic,
      this.abilities,
      this.about,
      this.types})
      : super(
            code: code,
            name: name,
            image: image,
            characteristic: characteristic,
            abilities: abilities,
            about: about,
            types: types);

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  static List<PokemonModel> toListModel(List<Pokemon>? list) {
    List<PokemonModel> listEntity = [];
    list?.forEach((element) {
      listEntity.add(PokemonModel(
          code: element.code,
          name: element.name,
          image: element.image,
          about: element.about,
          characteristic: element.characteristic,
          abilities: element.abilities,
          types: TypesModel.toListModel(element.types)));
    });
    return listEntity;
  }
}
