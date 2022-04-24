import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/layout_space.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({Key? key, required this.text, required this.color}) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: layoutSpace16, vertical: layoutSpace8),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: color,fontSize: 12,fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
