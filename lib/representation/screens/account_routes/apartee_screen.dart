import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class Apartee extends StatelessWidget {
  const Apartee({super.key});
  static String routName = '/apartee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgColor,
        title: const Text(
          'About Apartee',
          style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
        ),
        elevation: 3, //create the shadow for app
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorPalette.textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
