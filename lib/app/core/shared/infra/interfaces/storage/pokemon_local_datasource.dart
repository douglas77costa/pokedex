
import 'package:pokedex/app/core/shared/infra/models/pokemon_model.dart';

import '../../../domain/entities/pokemon.dart';

abstract class PokemonLocalDataSource{
  List<Pokemon>? getAllPokemon();
  Pokemon? getPokemonById(int id);
  Future<bool> saveAllPokemon(List<PokemonModel> list);
  Future<bool> deleteAllPokemon();
  Future<bool> isPokemonEmpty();
}