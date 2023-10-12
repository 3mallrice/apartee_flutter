import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/core/helpers/image_helper.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/representation/screens/intro_screen.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routName = '/splash_screen'; // Đã chỉnh sửa routeName

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntro();
  }

  void redirectIntro() {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;

    Future.delayed(const Duration(seconds: 2), () {
      if (ignoreIntroScreen != null && ignoreIntroScreen == true) {
        Navigator.of(context).pushNamed(MainApp.routName);
      } else {
        LocalStorageHelper.setValue(
            'ignoreIntroScreen', true); // Đặt thành true
        Navigator.of(context).pushNamed(IntroScreen.routName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8228),
      body: Stack(
        children: [
          ImageHelper.loadFormAsset(AssetHelper.imageLogoSplash,
              fit: BoxFit.fitWidth), // Đã chỉnh sửa loadFromAsset
        ],
      ),
    );
  }
}
