import 'package:get/get.dart';

import 'presentation/controllers/pokemon_details_controller.dart';

class PokemonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PokemonDetailsController());
  }
}
