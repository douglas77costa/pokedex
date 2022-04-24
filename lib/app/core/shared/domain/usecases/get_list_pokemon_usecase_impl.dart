import 'package:dartz/dartz.dart';

import '../../infra/repositories/pokemon_local_repository_impl.dart';
import '../entities/pokemon.dart';
import '../errors/errors.dart';
import '../interfaces/domain/get_list_pokemon_usecase.dart';

class GetListPokemonUseCaseImpl implements GetListPokemonUseCase {
  final PokemonLocalRepositoryImpl pokemonLocalRepositoryImpl;

  GetListPokemonUseCaseImpl(this.pokemonLocalRepositoryImpl);

  @override
  Future<Either<Failure, List<Pokemon>>> call() async {
    try {
      return await pokemonLocalRepositoryImpl.getAllPokemonList();
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
