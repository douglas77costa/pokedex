import 'package:pokedex/app/core/shared/domain/entities/flavor_text_entries_api.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon_item.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon_api.dart';

abstract class PokemonApiDataSource {
  Future<List<PokemonItem>?> getAllPokemonList();

  Future<PokemonApi>? getPokemonById(int id);

  Future<List<FlavorTextEntriesApi>?> getPokemonTextById(int id);
}
