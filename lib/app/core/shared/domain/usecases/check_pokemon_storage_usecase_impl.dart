import 'package:dartz/dartz.dart';

import '../../infra/repositories/pokemon_local_repository_impl.dart';
import '../errors/errors.dart';
import '../interfaces/domain/check_pokemon_storage_usecase.dart';

class CheckPokemonStorageUseCaseImpl implements CheckPokemonStorageUseCase {
  final PokemonLocalRepositoryImpl pokemonLocalRepositoryImpl;

  CheckPokemonStorageUseCaseImpl(this.pokemonLocalRepositoryImpl);

  @override
  Future<Either<Failure, bool>?> call() async {
    try {
      return await pokemonLocalRepositoryImpl.isPokemonEmpty();
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
