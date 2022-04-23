import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/types.dart';
import 'package:pokedex/app/core/shared/infra/models/pokemon_types.dart';

import '../../../utils/connectivity.dart';
import '../../infra/repositories/pokemon_api_repository_impl.dart';
import '../../infra/repositories/pokemon_local_repository_impl.dart';
import '../entities/pokemon.dart';
import '../entities/pokemon_api.dart';
import '../errors/errors.dart';
import '../interfaces/domain/save_pokemon_usecase.dart';

class SavePokemonUseCaseImpl implements SavePokemonUseCase {
  final PokemonLocalRepositoryImpl pokemonLocalRepositoryImpl;
  final PokemonApiRepositoryImpl pokemonApiRepositoryImpl;

  SavePokemonUseCaseImpl(this.pokemonLocalRepositoryImpl, this.pokemonApiRepositoryImpl);

  @override
  Future<Either<Failure, bool>> call(List<Pokemon> list) async {
    if (await VerifyConnectivity.isConnected()) {
      var result = await pokemonLocalRepositoryImpl.deleteAllPokemon();
      if (result!.isRight()) {
        var result = await pokemonLocalRepositoryImpl.saveAllPokemon(list);
        result?.fold((l) {
          return Failure();
        }, (r) => right(r));
      }
      return right(false);
    } else {
      return left(NoConnection());
    }
  }
}
