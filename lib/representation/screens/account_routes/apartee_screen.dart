import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/account_button.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import 'account_screen.dart';

// ignore: unused_element
final Uri _url = Uri.parse('https://flutter.dev');

class Apartee extends StatelessWidget {
  const Apartee({super.key});
  static String routName = '/apartee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'About Apartee',
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
      body: Container(
        color: ColorPalette.secondColor,
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Box.sizedBox(10, ColorPalette.secondColor, null),
            MyAccountButton(
                text: 'Application Infor',
                leftIcon: FontAwesomeIcons.a,
                rightIcon: Icons.arrow_forward,
                onPressed: () {}),
            Box.sizedBox(5, ColorPalette.secondColor, null),
            ElevatedButton(
              onPressed: () {},
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
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorPalette.primaryColor,
                      child: Image.asset(
                        'assets/imgs/logo.png',
                        width: 50,
                        height: 50,
                        color: ColorPalette.bgColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Apartee.com.vn',
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
            Box.sizedBox(5, ColorPalette.secondColor, null),
          ],
        ))),
      ),
    );
  }
}
