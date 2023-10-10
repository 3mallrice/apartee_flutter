import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class MyAccountButton extends StatelessWidget {
  final IconData iconLeft;
  final String buttonText;
  final IconData iconRight;

  const MyAccountButton(
      {super.key,
      required this.iconLeft,
      required this.buttonText,
      required this.iconRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.bgColor,
      child: Center(
        child: Row(
          children: [
            Container(
              color: ColorPalette.bgColor,
              child: Icon(
                iconLeft,
                size: 10,
                weight: 10,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: ColorPalette.bgColor,
              width: 200,
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: ColorPalette.textColor, fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: ColorPalette.bgColor,
              child: Icon(
                iconRight,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
