import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/theme/colors.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/card_item_pokemon.dart';

import '../../../../core/routes/pages.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/layout_space.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.pokemonSearch),
            child: Container(
              color: AppColors.primary,
              padding: const EdgeInsets.only(
                  left: layoutSpace16, right: layoutSpace16, bottom: layoutSpace24),
              child: Container(
                margin: EdgeInsets.only(top: 28 + MediaQuery.of(context).padding.top),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: const EdgeInsets.only(left: layoutSpace20, right: layoutSpace20),
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Search a pokemon...",
                    ),
                    Icon(FluentIcons.search_24_regular)
                  ],
                ),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(135)),
      body: Column(
        children: [
          SvgPicture.asset(Assets.top, fit: BoxFit.cover),
          const SizedBox(
            height: layoutSpace20,
          ),
          Expanded(
            child: Obx(() {
              return GridView.builder(
                  padding:
                      const EdgeInsets.only(left: layoutSpace16, right: layoutSpace16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 1.11,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14),
                  itemCount: controller.listPokemon.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardItemPokemon(pokemon: controller.listPokemon[index]);
                  });
            }),
          )
        ],
      ),
    );
  }
}
