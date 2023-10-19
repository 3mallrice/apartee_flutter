import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/model/package.dart';

class MyPackage extends StatelessWidget {
  final Package package;
  final Function()? onTap;

  const MyPackage({
    super.key,
    required this.onTap,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: ColorPalette.bgColor,
      borderRadius: const BorderRadius.all(Radius.circular(7)),
      child: InkWell(
        onTap: onTap,
        hoverColor: ColorPalette.secondColor,
        splashColor: ColorPalette.secondColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: Image.network(package.imageUri),
              transitionOnUserGestures: true,
              child: Image.network(
                package.imageUri,
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    package.name,
                    style: const TextStyle(
                      color: ColorPalette.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    package.description,
                    style: const TextStyle(
                      color: ColorPalette.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
