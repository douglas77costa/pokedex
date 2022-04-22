import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/theme/assets.dart';
import 'package:pokedex/app/core/theme/colors.dart';
import 'package:pokedex/app/core/theme/layout_space.dart';

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
          SvgPicture.asset(Assets.background,fit: BoxFit.cover),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: layoutSpace28),
              child: Text(
                'Pokedex',
                style: CustomTextStyle.spartanTextStyle(const TextStyle(
                    fontSize: 36, fontWeight: FontWeight.w500, color: AppColors.secondaryDark)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
