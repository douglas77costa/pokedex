import 'package:get/get.dart';
import 'package:pokedex/app/modules/pokemon_details/pokemon_details_binding.dart';
import 'package:pokedex/app/modules/pokemon_details/presentation/pages/pokemon_details_page.dart';

import '../../modules/home/home_binding.dart';
import '../../modules/home/presentation/pages/home_page.dart';
import '../../modules/splash_screen/presentation/pages/splash_screen_page.dart';
import '../../modules/splash_screen/splash_screen_binding.dart';

part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.pokemonDetails,
      page: () => PokemonDetailsPage(),
      binding: PokemonDetailsBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
