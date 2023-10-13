import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class SquareTitle extends StatelessWidget {
  final String imgPath;
  const SquareTitle({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(25),
        color: ColorPalette.bgColor,
      ),
      child: Image.asset(
        imgPath,
        height: 40,
      ),
    );
  }
}
