import 'package:dartz/dartz.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/shared/domain/errors/errors.dart';

import '../../../utils/connectivity.dart';
import '../../infra/models/pokemon_types.dart';
import '../../infra/repositories/pokemon_api_repository_impl.dart';
import '../../infra/repositories/pokemon_local_repository_impl.dart';
import '../entities/pokemon_api.dart';
import '../entities/types.dart';
import '../interfaces/domain/get_pokemon_usecase.dart';

class GetPokemonUseCaseImpl implements GetPokemonUseCase {
  final PokemonLocalRepositoryImpl pokemonLocalRepositoryImpl;
  final PokemonApiRepositoryImpl pokemonApiRepositoryImpl;

  GetPokemonUseCaseImpl(this.pokemonLocalRepositoryImpl, this.pokemonApiRepositoryImpl);

  @override
  Future<Either<Failure, Pokemon>> call(int id) async {
    if (await VerifyConnectivity.isConnected()) {
      try {
        PokemonApi? pokemonApi;
        List<Types>? types = [];
        List<String>? abilities = [];
        String? about;

        var pokemonApiResult = await pokemonApiRepositoryImpl.getPokemonById(id);
        pokemonApiResult.fold((l) {
          return Failure();
        }, (r) {
          pokemonApi = r;
          pokemonApi?.types?.forEach((element) {
            var uri = Uri.dataFromString(element.type?.url ?? '');
            var code = uri.pathSegments[6];
            types.add(Types(
                id: int.parse(code),
                type: element.type?.name,
                color: PokemonTypes.getType(int.parse(code)).color));
          });
          pokemonApi?.abilities?.forEach((element) {
            if (element.ability?.name != null) {
              abilities.add(element.ability!.name!);
            }
          });
        });

        var textResult = await pokemonApiRepositoryImpl.getPokemonTextById(id);
        textResult.fold((l) {
          return Failure();
        }, (r) {
          for (var element in r!) {
            if (element.language?.name == 'en') {
              about = element.flavorText?.replaceAll('\n', ' ').replaceAll('\f', ' ');
              break;
            }
          }
        });

        if (pokemonApi != null) {
          var pokemon = Pokemon(
              code: id,
              name: pokemonApi!.name,
              image:
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
              types: types,
              abilities: abilities,
              about: about);

          return right(pokemon);
        }
        return left(Failure());
      } catch (e) {
        return left(Failure(message: e));
      }
    } else {
      return left(NoConnection());
    }
  }
}
