import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/firebase_storage_helper.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static String routName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _imageUrl = "";

  Future<void> getImage() async {
    _imageUrl = await FirebaseStorageHelper.getCommonAssetUrl("banner.webp");
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Your profile',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 78),
          Center(
              child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(_imageUrl),
            backgroundColor: Colors.transparent,
          )),
        ],
      ),
    );
  }
}
