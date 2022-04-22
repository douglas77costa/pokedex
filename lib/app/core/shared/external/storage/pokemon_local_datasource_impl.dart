import 'dart:html';

import 'package:hive/hive.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/shared/infra/models/pokemon_model.dart';

import '../../infra/interfaces/storage/pokemon_local_datasource.dart';

class PokemonLocalDataSourceImpl extends PokemonLocalDataSource {
  var boxPokemon = Hive.box<Pokemon>('pokemon');

  @override
  List<Pokemon>? getAllPokemon() {
    try {
      var list = <Pokemon>[];
      list.addAll(boxPokemon.values);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> addAllPokemon(List<Pokemon> list) async {
    try {
      await boxPokemon.addAll(list);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteAllPokemon() async {
    try {
      await boxPokemon.clear();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Pokemon getPokemonById(int id) {
    try {
      var response = boxPokemon.values.firstWhere((Pokemon poke) => poke.code == id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
