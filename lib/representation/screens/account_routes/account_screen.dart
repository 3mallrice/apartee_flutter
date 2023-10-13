import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/account_button.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/components/my_button.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/representation/screens/profile_screen.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../core/const/color_const.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const routName = 'account';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: const AppBarCom(
        appBarText: 'Account',
        textColor: ColorPalette.bgColor,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: Container(
        color: ColorPalette.bgColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Box.sizedBox(10, ColorPalette.secondColor, null),
              // Phần trên cùng
              Container(
                color: ColorPalette.bgColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(AssetHelper.imageBanner),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nguyễn Văn A',
                              style: TextStyle(
                                color: ColorPalette.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Box.sizedBox(8, null, null),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Profile.routName);
                              },
                              child: const Text(
                                'View Profile',
                                style: TextStyle(
                                  color: ColorPalette.textOnTapColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Box.sizedBox(10, ColorPalette.secondColor, null),

              const MyAccountButton(
                  text: 'Bills',
                  leftIcon: FontAwesomeIcons.fileInvoiceDollar,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              const MyAccountButton(
                  text: 'Requests',
                  leftIcon: FontAwesomeIcons.notesMedical,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              const MyAccountButton(
                  text: 'Apartment',
                  leftIcon: FontAwesomeIcons.solidBuilding,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              const MyAccountButton(
                  text: 'Contracts',
                  leftIcon: FontAwesomeIcons.fileContract,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              const MyAccountButton(
                  text: 'Package',
                  leftIcon: FontAwesomeIcons.cubes,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              const MyAccountButton(
                  text: 'Services',
                  leftIcon: FontAwesomeIcons.ethernet,
                  rightIcon: Icons.arrow_forward),
              Box.sizedBox(1, ColorPalette.spaceLine, null),

              ElevatedButton(
                onPressed: () {
                  OnPress.onPressed();
                },
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
                        'About Apartee',
                        style: TextStyle(
                            color: ColorPalette.textColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
              Box.sizedBox(1, ColorPalette.spaceLine, null),
              Box.sizedBox(20, ColorPalette.bgColor, null),

              //Logout
              MyButton(
                onTap: OnTap.onTap(),
                text: 'Logout',
                color: ColorPalette.secondColor,
                textColor: ColorPalette.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnPress {
  static void Function()? onPressed() {
    return null;
  }
}

class OnTap {
  static dynamic Function()? onTap() {
    return null;
  }
}

class Box {
  static SizedBox sizedBox(double? height, Color? color, double? width) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        color: color,
      ),
    );
  }
}
