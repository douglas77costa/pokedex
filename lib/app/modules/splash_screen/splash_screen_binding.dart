import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/usecases/check_pokemon_storage_usecase_impl.dart';
import 'package:pokedex/app/core/shared/domain/usecases/save_pokemon_usecase_impl.dart';
import 'package:pokedex/app/core/shared/external/network/pokemon_api_datasource_impl.dart';
import 'package:pokedex/app/core/shared/infra/repositories/pokemon_api_repository_impl.dart';
import 'package:pokedex/app/core/shared/infra/repositories/pokemon_local_repository_impl.dart';

import '../../core/shared/domain/usecases/get_all_pokemon_usecase_impl.dart';
import '../../core/shared/domain/usecases/get_pokemon_usecase_impl.dart';
import '../../core/shared/external/storage/pokemon_local_datasource_impl.dart';
import 'presentation/controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonLocalDataSourceImpl());
    Get.lazyPut(() => PokemonLocalRepositoryImpl(Get.find<PokemonLocalDataSourceImpl>()));
    Get.lazyPut(() => PokemonApiDataSourceImpl());
    Get.lazyPut(() => PokemonApiRepositoryImpl(Get.find<PokemonApiDataSourceImpl>()));

    Get.lazyPut(
        () => CheckPokemonStorageUseCaseImpl(Get.find<PokemonLocalRepositoryImpl>()));
    Get.lazyPut(() => GetIdsAllPokemonUseCaseImpl(Get.find<PokemonApiRepositoryImpl>()));
    Get.lazyPut(() => GetPokemonUseCaseImpl(
        Get.find<PokemonLocalRepositoryImpl>(), Get.find<PokemonApiRepositoryImpl>()));
    Get.lazyPut(() => SavePokemonUseCaseImpl(
        Get.find<PokemonLocalRepositoryImpl>(), Get.find<PokemonApiRepositoryImpl>()));

    Get.lazyPut(() => SplashScreenController(
        Get.find<CheckPokemonStorageUseCaseImpl>(),
        Get.find<SavePokemonUseCaseImpl>(),
        Get.find<GetIdsAllPokemonUseCaseImpl>(),
        Get.find<GetPokemonUseCaseImpl>()));
  }
}
