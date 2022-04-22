import 'package:pokedex/app/core/shared/domain/enitities/pokemon_item.dart';
import 'package:pokedex/app/core/shared/domain/enitities/pokemon_api.dart';

abstract class PokemonApiDataSource {
  Future<List<PokemonItem>?> getAllPokemonList();
  Future<PokemonApi>? getPokemonById(int id);
}
