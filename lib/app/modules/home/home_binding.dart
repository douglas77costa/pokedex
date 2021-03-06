import 'package:get/get.dart';

import '../../core/shared/domain/usecases/check_pokemon_storage_usecase_impl.dart';
import '../../core/shared/domain/usecases/get_all_pokemon_api_usecase_impl.dart';
import '../../core/shared/domain/usecases/get_list_pokemon_usecase_impl.dart';
import '../../core/shared/domain/usecases/get_pokemon_api_usecase_impl.dart';
import '../../core/shared/domain/usecases/save_pokemon_usecase_impl.dart';
import '../../core/shared/external/network/pokemon_api_datasource_impl.dart';
import '../../core/shared/external/storage/pokemon_local_datasource_impl.dart';
import '../../core/shared/infra/repositories/pokemon_api_repository_impl.dart';
import '../../core/shared/infra/repositories/pokemon_local_repository_impl.dart';
import 'presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonLocalDataSourceImpl());
    Get.lazyPut(() => PokemonLocalRepositoryImpl(Get.find<PokemonLocalDataSourceImpl>()));
    Get.lazyPut(() => PokemonApiDataSourceImpl());
    Get.lazyPut(() => PokemonApiRepositoryImpl(Get.find<PokemonApiDataSourceImpl>()));

    Get.lazyPut(
        () => CheckPokemonStorageUseCaseImpl(Get.find<PokemonLocalRepositoryImpl>()));
    Get.lazyPut(
        () => GetIdsAllPokemonApiUseCaseImpl(Get.find<PokemonApiRepositoryImpl>()));
    Get.lazyPut(() => GetPokemonApiUseCaseImpl(
        Get.find<PokemonLocalRepositoryImpl>(), Get.find<PokemonApiRepositoryImpl>()));
    Get.lazyPut(() => SavePokemonUseCaseImpl(
        Get.find<PokemonLocalRepositoryImpl>(), Get.find<PokemonApiRepositoryImpl>()));
    Get.lazyPut(() => GetListPokemonUseCaseImpl(Get.find<PokemonLocalRepositoryImpl>()));

    Get.lazyPut(() => HomeController(
        Get.find<GetListPokemonUseCaseImpl>(),
        Get.find<CheckPokemonStorageUseCaseImpl>(),
        Get.find<SavePokemonUseCaseImpl>(),
        Get.find<GetIdsAllPokemonApiUseCaseImpl>(),
        Get.find<GetPokemonApiUseCaseImpl>()));
  }
}
