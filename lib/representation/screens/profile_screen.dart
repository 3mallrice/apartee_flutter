import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static String routName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Your profile',
        leading: true,
        leftIcon: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: ColorPalette.bgColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.of(context).pushNamed(AccountScreen.routName);
          },
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 78),
          Center(
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(AssetHelper.imageBanner),
            ),
          ),
        ],
      ),
    );
  }
}
