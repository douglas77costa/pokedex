import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/utils/hex_color.dart';

import '../../../../core/routes/pages.dart';
import '../../../../core/shared/domain/entities/pokemon.dart';
import '../../../../core/theme/layout_space.dart';

class ListItemPokemon extends StatelessWidget {
  const ListItemPokemon({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        type: MaterialType.card,
        elevation: 0,
        color: HexColor.fromHex(pokemon.types!.first.color!).withOpacity(0.2),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.pokemonDetails, arguments: pokemon),
          child: Padding(
            padding: const EdgeInsets.only(left: layoutSpace8),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: HexColor.fromHex(pokemon.types!.first.color!)
                            .withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(layoutSpace12),
                            topRight: Radius.circular(layoutSpace12)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: layoutSpace12, vertical: layoutSpace4),
                          child: Text(
                            '${pokemon.types!.first.type!.capitalizeFirst}',
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: layoutSpace4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            '${pokemon.name?.capitalizeFirst}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: HexColor.fromHex(pokemon.types!.first.color!),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          child: Text(
                            '#${pokemon.code}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: HexColor.fromHex(pokemon.types!.first.color!)
                                    .withOpacity(0.5),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CachedNetworkImage(
                          width: 110,
                          fit: BoxFit.cover,
                          imageUrl: pokemon.image ?? '',
                          placeholder: (context, url) {
                            return const CupertinoActivityIndicator();
                          },
                          errorWidget: (context, url, error) =>
                              const SizedBox(height: 100,child: Icon(FluentIcons.error_circle_12_regular)),
                        ),
                      ).marginOnly(
                          right: layoutSpace4, top: layoutSpace4, bottom: layoutSpace8),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
