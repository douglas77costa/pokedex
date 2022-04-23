import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon.dart';
import '../../domain/errors/errors.dart';
import '../../domain/interfaces/infra/pokemon_local_repository.dart';
import '../../external/storage/pokemon_local_datasource_impl.dart';

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  final PokemonLocalDataSourceImpl pokemonLocalDataSourceImpl;

  PokemonLocalRepositoryImpl(this.pokemonLocalDataSourceImpl);

  @override
  Future<Either<Failure, List<Pokemon>?>> getAllPokemonList() async {
    try {
      var list = pokemonLocalDataSourceImpl.getAllPokemon();
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
  Future<Either<Failure, bool>?> deleteAllPokemon() async {
    try {
      return right(await pokemonLocalDataSourceImpl.deleteAllPokemon());
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, Pokemon>?> getPokemonById(int id) async {
    try {
      var pokemon = pokemonLocalDataSourceImpl.getPokemonById(id);
      if (pokemon != null) {
        return right(pokemon);
      } else {
        return left(EmptyResult());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>?> saveAllPokemon(List<Pokemon> list) async {
    try {
      return right(await pokemonLocalDataSourceImpl.saveAllPokemon(list));
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>?> isPokemonEmpty() async {
    try {
      return right(await pokemonLocalDataSourceImpl.isPokemonEmpty());
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
