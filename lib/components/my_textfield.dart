import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class MyTextfield extends StatelessWidget {
  final Controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.Controller,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: Controller, //require?
        obscureText:
            obscureText, //True or False, when type hide or not... (password)
        // maxLength: 30,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.secondColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.primaryColor),
            ),
            fillColor: ColorPalette.secondbgColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: ColorPalette.unselectedIcon)),
      ),
    );
  }
}
