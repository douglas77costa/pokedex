import 'package:dartz/dartz.dart';

import '../../entities/pokemon.dart';
import '../../errors/errors.dart';

abstract class PokemonLocalRepository {
  Future<Either<Failure, List<Pokemon>?>> getAllPokemonList();

  Future<Either<Failure, Pokemon>?> getPokemonById(int id);

  Future<Either<Failure, bool>?> saveAllPokemon(List<Pokemon> list);

  Future<Either<Failure, bool>?> deleteAllPokemon();

  Future<Either<Failure, bool>?> isPokemonEmpty();
}
