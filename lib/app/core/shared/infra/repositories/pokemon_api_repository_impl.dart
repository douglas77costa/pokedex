import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/flavor_text_entries_api.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon_api.dart';

import '../../domain/entities/pokemon_item.dart';
import '../../domain/errors/errors.dart';
import '../../domain/interfaces/infra/pokemon_api_repository.dart';
import '../../external/network/pokemon_api_datasource_impl.dart';

class PokemonApiRepositoryImpl implements PokemonApiRepository {
  final PokemonApiDataSourceImpl pokemonApiDataSourceImpl;

  PokemonApiRepositoryImpl(this.pokemonApiDataSourceImpl);

  @override
  Future<Either<Failure, List<PokemonItem>?>> getAllPokemonList() async {
    try {
      var list = await pokemonApiDataSourceImpl.getAllPokemonList();
      if (list != null && list.isNotEmpty) {
        return right(list);
      } else {
        return left(EmptyResult());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, PokemonApi?>> getPokemonById(int id) async {
    try {
      var response = await pokemonApiDataSourceImpl.getPokemonById(id);
      if (response != null) {
        return right(response);
      } else {
        return left(EmptyResult());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, List<FlavorTextEntriesApi>?>> getPokemonTextById(int id) async {
    try {
      var list = await pokemonApiDataSourceImpl.getPokemonTextById(id);
      if (list != null && list.isNotEmpty) {
        return right(list);
      } else {
        return left(EmptyResult());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
