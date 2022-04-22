import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/enitities/pokemon_item.dart';
import 'package:pokedex/app/core/shared/domain/enitities/pokemon_api.dart';
import 'package:pokedex/app/core/shared/infra/models/pokemon_api_model.dart';
import 'package:pokedex/app/core/shared/infra/models/response/pokemon_list_response.dart';
import 'package:pokedex/app/core/utils/api_base.dart';

import '../../infra/interfaces/network/pokemon_api_datasource.dart';

class PokemonApiDataSourceImpl implements PokemonApiDataSource {
  final GetConnect getConnect = GetConnect();

  @override
  Future<List<PokemonItem>?> getAllPokemonList() async {
    try {
      var response = await getConnect.get('${ApiBase.baseUrlPokeApi}/pokemon?limit=1126');
      if (response.statusCode == 200) {
        var list = PokemonListResponseModel.fromJson(json.decode(response.body));
        return list.results;
      } else {
        throw Exception(response.bodyString);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PokemonApi>? getPokemonById(int id)async{
    try {
      var response = await getConnect.get('${ApiBase.baseUrlPokeApi}/pokemon/$id');
      if (response.statusCode == 200) {
        var pokemonSpecie = PokemonApiModel.fromJson(json.decode(response.body));
        return pokemonSpecie;
      } else {
        throw Exception(response.bodyString);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}