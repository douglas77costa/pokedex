import 'package:hive/hive.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/shared/infra/models/pokemon_model.dart';

import '../../infra/interfaces/storage/pokemon_local_datasource.dart';

class PokemonLocalDataSourceImpl extends PokemonLocalDataSource {
  @override
  List<Pokemon>? getAllPokemon() {
    try {
      final _boxPokemon = Hive.box<PokemonModel>('pokemon');
      var list = <Pokemon>[];
      list.addAll(_boxPokemon.values);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveAllPokemon(List<Pokemon> list) async {
    try {
      final _boxPokemon = Hive.box<PokemonModel>('pokemon');
      await _boxPokemon.addAll(PokemonModel.toListModel(list));
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteAllPokemon() async {
    try {
      final _boxPokemon = Hive.box<PokemonModel>('pokemon');
      await _boxPokemon.clear();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Pokemon? getPokemonById(int id) {
    try {
      final _boxPokemon = Hive.box<PokemonModel>('pokemon');
      var response = _boxPokemon.values.firstWhere((Pokemon poke) => poke.code == id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isPokemonEmpty() async {
    try {
      final _boxPokemon = Hive.box<PokemonModel>('pokemon');
      return _boxPokemon.isEmpty;
    } catch (e) {
      rethrow;
    }
  }
}
