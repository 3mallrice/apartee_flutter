import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xFFFF8228);
  static const Color secondColor = Color(0x38FF8228);
  static const Color bgColor = Color(0xFFFFFFFF);
  static Color secondbgColor = const Color.fromARGB(230, 255, 255, 255);
  static const Color textColor = Color(0xff333131);
  static const Color textOnTapColor = Color(0xff11b621);
  static const Color unselectedIcon = Colors.grey;
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
      //nhat dan ra ngoai
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [ColorPalette.secondColor, ColorPalette.primaryColor]);
}
