import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/app/core/shared/enums/status_type.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../core/theme/assets.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/layout_space.dart';
import '../../../../core/theme/text_style.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  final controller = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(Assets.background, fit: BoxFit.cover),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Obx(() {
              switch (controller.status) {
                case StatusType.LOAD:
                  return Column(
                    children: [
                      Lottie.asset(Assets.load,
                          repeat: true,
                          width: 80,
                          reverse: false),
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
                            left: layoutSpace48,
                            right: layoutSpace48,
                            bottom: layoutSpace48),
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
                      )
                    ],
                  );
              }
              return Container();
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: layoutSpace28),
              child: Text(
                'Pokedex',
                style: CustomTextStyle.spartanTextStyle(const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryDark)),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
