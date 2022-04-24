import 'package:get/get.dart';

import '../../../../core/shared/domain/entities/pokemon.dart';
import '../../../../core/shared/domain/usecases/get_list_pokemon_usecase_impl.dart';
import '../../../../core/shared/enums/status_type.dart';
import '../../../../core/widgets/custom_snackbar.dart';

class PokemonSearchController extends GetxController {
  final GetListPokemonUseCaseImpl getListPokemonUseCaseImpl;

  PokemonSearchController(this.getListPokemonUseCaseImpl);

  final _status = StatusType.INITIAL.obs;

  get status => _status.value;

  set status(value) => _status.value = value;

  final listPokemon = <Pokemon>[].obs;
  final resultListPokemon = <Pokemon>[].obs;

  @override
  void onReady() {
    getPokemon();
    super.onReady();
  }

  void getPokemon() async {
    listPokemon.clear();
    var result = await getListPokemonUseCaseImpl.call();
    result.fold((l) {
      CustomSnackBar.showSnackBar(l.message.toString(), Get.context);
    }, (r) {
      listPokemon.addAll(r);
    });
  }

  void search(String keyword) {
    resultListPokemon.clear();
    resultListPokemon.addAll(listPokemon.where((pokemon) {
      if (pokemon.name!.isCaseInsensitiveContainsAny(keyword)) {
        return true;
      } else {
        return false;
      }
    }));
    if (resultListPokemon.isNotEmpty) {
      status = StatusType.SUCCESS;
    } else {
      status = StatusType.EMPTY;
    }
  }
}
