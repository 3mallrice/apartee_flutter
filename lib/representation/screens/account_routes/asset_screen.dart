import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class AssetScreen extends StatefulWidget {
  const AssetScreen({super.key});
  static const routName = 'asset';

  @override
  State<AssetScreen> createState() => _AssetScreenState();
}

class _AssetScreenState extends State<AssetScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'My assets',
        leading: true,
        leftIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorPalette.bgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
