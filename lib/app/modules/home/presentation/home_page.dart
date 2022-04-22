import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/theme/colors.dart';

import '../../../core/theme/assets.dart';
import '../../../core/theme/layout_space.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();
  final List<Map> myProducts =
  List.generate(100000, (index) => {"id": index, "name": "Product $index"})
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: Container(
              color: AppColors.primary,
              padding: const EdgeInsets.only(
                  left: layoutSpace16, right: layoutSpace16, bottom: layoutSpace24),
             child: Container(
               margin: EdgeInsets.only(top: 28+MediaQuery.of(context).padding.top),
               decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(30))
               ),
               padding: const EdgeInsets.only(left: layoutSpace20,right: layoutSpace20),
               height: 56,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: const [
                   Text("Search a pokemon...",),
                   Icon(FluentIcons.search_24_regular)
                 ],
               ),
             ),
            ),
            preferredSize: const Size.fromHeight(135)),
      body: Column(
        children: [
          SvgPicture.asset(Assets.top,fit: BoxFit.cover),
          const SizedBox(height: layoutSpace20,),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.only(left: layoutSpace16,right: layoutSpace16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14),
                itemCount: myProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(myProducts[index]["name"]),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
