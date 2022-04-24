import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/shared/domain/entities/pokemon.dart';
import 'package:pokedex/app/core/theme/colors.dart';
import 'package:pokedex/app/core/theme/layout_space.dart';

import '../../../../core/utils/hex_color.dart';
import '../controllers/pokemon_details_controller.dart';
import '../widgets/custom_tag.dart';

class PokemonDetailsPage extends StatelessWidget {
  final controller = Get.find<PokemonDetailsController>();
  final Pokemon pokemon = Get.arguments as Pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.3, 0.8, 1.0],
          colors: [
            HexColor.fromHex(pokemon.types!.first.color!).withOpacity(0.5),
            Colors.white,
            Colors.white,
            HexColor.fromHex(pokemon.types!.first.color!).withOpacity(0.3)
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(layoutSpace24),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(FluentIcons.chevron_left_24_filled),
                      color: HexColor.fromHex(pokemon.types!.first.color!),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ),
              CachedNetworkImage(
                width: 280,
                fit: BoxFit.cover,
                imageUrl: pokemon.image ?? '',
                placeholder: (context, url) {
                  return const CupertinoActivityIndicator();
                },
                errorWidget: (context, url, error) =>
                    const Icon(FluentIcons.error_circle_12_regular),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text('${pokemon.name?.capitalizeFirst}',
                    style: TextStyle(
                        color: HexColor.fromHex(pokemon.types!.first.color!),
                        fontSize: 28,
                        fontWeight: FontWeight.w600)),
                trailing: Text('#${pokemon.code}',
                    style: TextStyle(
                        color: HexColor.fromHex(pokemon.types!.first.color!)
                            .withOpacity(0.3),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: layoutSpace8,
              ),
              SizedBox(
                height: layoutSpace28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pokemon.types?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: layoutSpace8),
                        child: CustomTag(
                          text: pokemon.types![index].type ?? '',
                          color: HexColor.fromHex(pokemon.types![index].color!),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: layoutSpace24,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text('Abilities',
                    style: TextStyle(
                        color: AppColors.defaultTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: layoutSpace8,
              ),
              SizedBox(
                height: layoutSpace28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pokemon.abilities?.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String text = pokemon.abilities![index]+',';
                      if ((index + 1 == pokemon.abilities?.length)) {
                       text = text.replaceAll(',', '');
                      }
                      return Padding(
                          padding: const EdgeInsets.only(right: layoutSpace4),
                          child: Text(
                            text,
                            style: const TextStyle(
                                color: AppColors.defaultTextColor, fontSize: 14),
                          ));
                    }),
              ),
              const SizedBox(
                height: layoutSpace24,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text('About',
                    style: TextStyle(
                        color: AppColors.defaultTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: layoutSpace8,
              ),
              Text(
                "${pokemon.about}",
                style: const TextStyle(color: AppColors.defaultTextColor, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
