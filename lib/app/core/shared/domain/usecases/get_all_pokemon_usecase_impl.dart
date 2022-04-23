import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/id_index.dart';
import 'package:pokedex/app/core/shared/domain/errors/errors.dart';

import '../../../utils/connectivity.dart';
import '../../infra/repositories/pokemon_api_repository_impl.dart';
import '../interfaces/domain/get_all_pokemon_usecase.dart';

class GetIdsAllPokemonUseCaseImpl implements GetIdsAllPokemonUseCase {
  final PokemonApiRepositoryImpl pokemonApiRepositoryImpl;

  GetIdsAllPokemonUseCaseImpl(this.pokemonApiRepositoryImpl);

  @override
  Future<Either<Failure, List<IdIndex>>> call() async {
    if (await VerifyConnectivity.isConnected()) {
      try {
        var listCodes = <IdIndex>[];
        var pokemonList = await pokemonApiRepositoryImpl.getAllPokemonList();
        pokemonList.fold((l) {
          return Failure();
        }, (r) {
          r?.asMap().forEach((index, element) {
            var uri = Uri.dataFromString(element.url ?? '');
            var code = uri.pathSegments[6];
            listCodes.add(IdIndex(index, int.parse(code)));
          });
        });
        return right(listCodes);
      } catch (e) {
        return left(Failure(message: e));
      }
    } else {
      return left(NoConnection());
    }
  }
}
