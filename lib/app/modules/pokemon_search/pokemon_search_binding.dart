import 'package:get/get.dart';

import '../../core/shared/domain/usecases/get_list_pokemon_usecase_impl.dart';
import '../../core/shared/external/storage/pokemon_local_datasource_impl.dart';
import '../../core/shared/infra/repositories/pokemon_local_repository_impl.dart';
import 'presentation/controllers/pokemon_search_controller.dart';

class PokemonSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonLocalDataSourceImpl());
    Get.lazyPut(() => PokemonLocalRepositoryImpl(Get.find<PokemonLocalDataSourceImpl>()));
    Get.lazyPut(() => GetListPokemonUseCaseImpl(Get.find<PokemonLocalRepositoryImpl>()));

    Get.lazyPut(() => PokemonSearchController(Get.find<GetListPokemonUseCaseImpl>()));
  }
}
