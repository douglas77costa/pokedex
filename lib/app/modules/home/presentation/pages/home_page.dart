import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/app/core/theme/colors.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/card_item_pokemon.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../core/routes/pages.dart';
import '../../../../core/shared/enums/status_type.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Obx(() {
            switch (controller.status) {
              case StatusType.LOAD:
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 8,
                    ),
                    Lottie.asset(Assets.load, repeat: true, width: 80, reverse: false),
                    const SizedBox(
                      height: layoutSpace24,
                    ),
                    Text(
                      'Updating pokemons ${num.parse((((controller.progress * 100) / 1126)).toStringAsFixed(2))}%',
                      style: CustomTextStyle.spartanTextStyle(const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryDark)),
                    ),
                    const SizedBox(
                      height: layoutSpace24,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: layoutSpace48, right: layoutSpace48),
                      child: SfLinearGauge(
                        orientation: LinearGaugeOrientation.horizontal,
                        minimum: 0.0,
                        maximum: 100.0,
                        showTicks: false,
                        showLabels: false,
                        animateAxis: true,
                        axisTrackStyle: const LinearAxisTrackStyle(
                            thickness: 10,
                            edgeStyle: LinearEdgeStyle.bothCurve,
                            color: AppColors.primaryLight),
                        barPointers: <LinearBarPointer>[
                          LinearBarPointer(
                              value: ((controller.progress * 100) / 1126),
                              thickness: 10,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                              color: AppColors.primary),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: layoutSpace24,
                    ),
                    Text(
                      'The search will be available after the update',
                      style: CustomTextStyle.spartanTextStyle(const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondaryDark)),
                    ),
                    const SizedBox(
                      height: layoutSpace28,
                    ),
                  ],
                );
              case StatusType.SUCCESS:
                return Column(
                  children: [
                    PreferredSize(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.pokemonSearch),
                          child: Container(
                            color: AppColors.primary,
                            padding: const EdgeInsets.only(
                                left: layoutSpace16,
                                right: layoutSpace16,
                                bottom: layoutSpace24),
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 28 + MediaQuery.of(context).padding.top),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30))),
                              padding: const EdgeInsets.only(
                                  left: layoutSpace20, right: layoutSpace20),
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
                    SvgPicture.asset(Assets.top, fit: BoxFit.cover),
                    const SizedBox(
                      height: layoutSpace20,
                    )
                  ],
                );
              default:
                return Container();
            }
          }),
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
