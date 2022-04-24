import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/app/core/shared/enums/status_type.dart';
import 'package:pokedex/app/core/theme/assets.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/widgets/filled_text_field.dart';
import '../controllers/pokemon_search_controller.dart';
import '../widgets/list_item_pokemon.dart';

class PokemonSearchPage extends StatelessWidget {
  final controller = Get.find<PokemonSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: Container(
            color: AppColors.primary,
            padding: EdgeInsets.only(
                top: layoutSpace8 + MediaQuery.of(context).padding.top,
                left: layoutSpace16,
                right: layoutSpace16,
                bottom: layoutSpace24),
            child: FilledTextField(
              fillColor: Colors.white,
              keyboardType: TextInputType.text,
              hintText: 'Search a pokemon...',
              onChanged: (query) => controller.query = query,
              autofocus: true,
              prefixIcon: IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Get.back();
                  },
                  icon: const Icon(FluentIcons.chevron_left_24_filled)),
              suffixIcon: IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    controller.search();
                  },
                  icon: const Icon(FluentIcons.search_24_filled)),
            ),
          ),
          preferredSize: const Size.fromHeight(100)),
      body: Obx(() {
        switch (controller.status) {
          case StatusType.INITIAL:
            return Lottie.asset(Assets.search);
          case StatusType.SUCCESS:
            return ListView.builder(
                itemCount: controller.resultListPokemon.length,
                padding: const EdgeInsets.only(
                    left: layoutSpace16, right: layoutSpace16, top: layoutSpace16),
                itemBuilder: (context, index) {
                  return ListItemPokemon(pokemon: controller.resultListPokemon[index])
                      .marginOnly(top: layoutSpace16);
                });
          case StatusType.EMPTY:
            return Center(
                child: SizedBox(
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.noResult,
                      width: 150,
                    ),
                    const SizedBox(
                      height: layoutSpace20,
                    ),
                    const Text(
                      'Nenhum resultado encontrado',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary),
                    ),
                    const SizedBox(
                      height: layoutSpace48,
                    ),
                  ]),
            ));
        }
        return Container();
      }),
    );
  }
}
