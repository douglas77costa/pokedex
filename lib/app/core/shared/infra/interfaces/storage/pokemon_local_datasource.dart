
import '../../../domain/entities/pokemon.dart';

abstract class PokemonLocalDataSource{
  List<Pokemon>? getAllPokemon();
  Pokemon getPokemonById(int id);
  Future<bool> addAllPokemon(List<Pokemon> list);
  Future<bool> deleteAllPokemon();
}