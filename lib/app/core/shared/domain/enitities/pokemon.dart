import 'package:pokedex/app/core/shared/domain/enitities/types.dart';

class Pokemon {
  int? code;
  String? name;
  String? image;
  String? characteristic;
  List<String>? abilities;
  String? about;
  List<Types>? types;

  Pokemon({this.code,
    this.name,
    this.image,
    this.characteristic,
    this.abilities,
    this.about,
    this.types});
}