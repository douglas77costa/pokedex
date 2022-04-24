import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/widgets/custom_snackbar.dart';

import '../../../../core/shared/domain/usecases/get_list_pokemon_usecase_impl.dart';

class HomeController extends GetxController {
  final GetListPokemonUseCaseImpl getListPokemonUseCaseImpl;

  HomeController(this.getListPokemonUseCaseImpl);

  final listPokemon = <Pokemon>[].obs;

  @override
  void onReady() {
    getPokemon();
    super.onReady();
  }

  void getPokemon() async{
    listPokemon.clear();
    var result = await getListPokemonUseCaseImpl.call();
    result.fold((l) {
      CustomSnackBar.showSnackBar(l.message.toString(), Get.context);
    }, (r) {
      listPokemon.addAll(r);
    });
  }
}
