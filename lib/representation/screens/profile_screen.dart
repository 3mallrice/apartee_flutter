import 'package:flutter/material.dart';
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
        appBar: AppBar(
          backgroundColor: ColorPalette.bgColor,
          title: const Text(
            'Your profile',
            style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
          ),
          elevation: 3, //create the shadow for app
          leading: IconButton(
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: ColorPalette.textColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(AssetHelper.imageBanner),
                  ),
                ),
              ),
              Row()
            ],
          ),
        ));
  }
}
