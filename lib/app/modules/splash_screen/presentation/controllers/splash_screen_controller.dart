import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/entities/id_index.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/routes/pages.dart';
import '../../../../core/shared/domain/entities/pokemon.dart';
import '../../../../core/shared/domain/usecases/check_pokemon_storage_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/get_all_pokemon_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/get_pokemon_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/save_pokemon_usecase_impl.dart';
import '../../../../core/shared/enums/status_type.dart';

class SplashScreenController extends GetxController {
  CheckPokemonStorageUseCaseImpl checkPokemonStorageUseCaseImpl;
  SavePokemonUseCaseImpl savePokemonUseCaseImpl;
  GetIdsAllPokemonUseCaseImpl getIdsAllPokemonUseCaseImpl;
  GetPokemonUseCaseImpl getPokemonUseCaseImpl;

  SplashScreenController(this.checkPokemonStorageUseCaseImpl, this.savePokemonUseCaseImpl,
      this.getIdsAllPokemonUseCaseImpl, this.getPokemonUseCaseImpl);

  final _status = StatusType.INITIAL.obs;

  get status => _status.value;

  set status(value) => _status.value = value;

  final _progress = 0.obs;

  double get progress => _progress.value.toDouble();

  set progress(value) => _progress.value = value;

  @override
  void onReady() {
    _checkPokemon();
    super.onReady();
  }

  Future<void> _checkPokemon() async {
    var checkResult = await checkPokemonStorageUseCaseImpl.call();
    checkResult?.fold((l) => null, (r) {
      if (r) {
        status = StatusType.LOAD;
        _getPokemon();
      } else {
        Get.offAllNamed(Routes.home);
      }
    });
  }

  Future<void> _getPokemon() async {
    var listPokemon = <Pokemon>[];
    var result = await getIdsAllPokemonUseCaseImpl.call();
    result.fold((l) => null, (codes) async {
      await Future.forEach(codes, (IdIndex idIndex) async {
        var result = await getPokemonUseCaseImpl.call(idIndex.id);
        result.fold((l) => null, (r) {
          listPokemon.add(r);
          progress = idIndex.index + 1;
          if (kDebugMode) {
            print('Pokemon loaded: ${idIndex.index}/1126');
          }
        });
      });
      _savePokemon(listPokemon);
    });
  }

  Future<void> _savePokemon(List<Pokemon> list) async {
    var result = await savePokemonUseCaseImpl.call(list);
    result.fold((l) => null, (r) {
      Get.offAllNamed(Routes.home);
    });
  }
}
