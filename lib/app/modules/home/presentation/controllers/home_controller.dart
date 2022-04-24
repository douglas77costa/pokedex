import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/widgets/custom_snackbar.dart';

import '../../../../core/shared/domain/entities/id_index.dart';
import '../../../../core/shared/domain/usecases/check_pokemon_storage_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/get_all_pokemon_api_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/get_list_pokemon_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/get_pokemon_api_usecase_impl.dart';
import '../../../../core/shared/domain/usecases/save_pokemon_usecase_impl.dart';
import '../../../../core/shared/enums/status_type.dart';

class HomeController extends GetxController {
  final GetListPokemonUseCaseImpl getListPokemonUseCaseImpl;
  final CheckPokemonStorageUseCaseImpl checkPokemonStorageUseCaseImpl;
  final SavePokemonUseCaseImpl savePokemonUseCaseImpl;
  final GetIdsAllPokemonApiUseCaseImpl getIdsAllPokemonUseCaseImpl;
  final GetPokemonApiUseCaseImpl getPokemonUseCaseImpl;

  HomeController(
      this.getListPokemonUseCaseImpl,
      this.checkPokemonStorageUseCaseImpl,
      this.savePokemonUseCaseImpl,
      this.getIdsAllPokemonUseCaseImpl,
      this.getPokemonUseCaseImpl);

  final _status = StatusType.INITIAL.obs;

  get status => _status.value;

  set status(value) => _status.value = value;

  final _progress = 0.obs;

  double get progress => _progress.value.toDouble();

  set progress(value) => _progress.value = value;

  final listPokemon = <Pokemon>[].obs;

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
        _loadPokemon();
      } else {
        _getPokemon();
      }
    });
  }

  Future<void> _loadPokemon() async {
    var listP = <Pokemon>[];
    var result = await getIdsAllPokemonUseCaseImpl.call();
    result.fold((l) => null, (codes) async {
      await Future.forEach(codes, (IdIndex idIndex) async {
        var result = await getPokemonUseCaseImpl.call(idIndex.id);
        result.fold((l) => null, (r) {
          listPokemon.add(r);
          listP.add(r);
          progress = idIndex.index + 1;
          if (kDebugMode) {
            print('Pokemon loaded: ${idIndex.index}/1126');
          }
        });
      });
      _savePokemon(listP);
    });
  }

  Future<void> _savePokemon(List<Pokemon> list) async {
    var result = await savePokemonUseCaseImpl.call(list);
    result.fold((l) => null, (r) {
      status = StatusType.SUCCESS;
    });
  }

  void _getPokemon() async {
    listPokemon.clear();
    var result = await getListPokemonUseCaseImpl.call();
    result.fold((l) {
      CustomSnackBar.showSnackBar(l.message.toString(), Get.context);
    }, (r) {
      listPokemon.addAll(r);
    });
    status = StatusType.SUCCESS;
  }
}
