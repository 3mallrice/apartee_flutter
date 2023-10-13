import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class MyAccountButton extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final IconData? rightIcon;
  final Function()? onPressed;

  const MyAccountButton({
    super.key,
    required this.text,
    required this.leftIcon,
    required this.rightIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: ColorPalette.secondColor,
        surfaceTintColor: ColorPalette.primaryColor,
        elevation: 5,
        backgroundColor: ColorPalette.bgColor,
        minimumSize: const Size(300, 51),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              leftIcon,
              color: ColorPalette.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            width: 300,
            child: Text(
              text,
              style: const TextStyle(
                  color: ColorPalette.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              rightIcon,
              color: ColorPalette.primaryColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
