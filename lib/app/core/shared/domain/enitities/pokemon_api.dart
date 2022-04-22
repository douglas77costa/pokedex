import 'package:pokedex/app/core/shared/domain/enitities/abilities_api.dart';

import 'types_api.dart';

class PokemonApi {
  String? name;
  List<TypesApi>? types;
  List<AbilitiesApi>? abilities;

  PokemonApi({this.name, this.types,this.abilities});
}