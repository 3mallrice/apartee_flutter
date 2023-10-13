import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/components/combo_box.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class RaiseRequestScreen extends StatelessWidget {
  static const routName = 'raiseRequest';
  const RaiseRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Raise request',
        leading: true,
        leftIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorPalette.bgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.of(context).pushNamed(AccountScreen.routName);
          },
        ),
      ),
      body: const Row(
        children: [
          MyComboBox(),
        ],
      ),
    );
  }
}
