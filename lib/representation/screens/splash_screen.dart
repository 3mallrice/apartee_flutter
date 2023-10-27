import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/core/helpers/image_helper.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/representation/screens/intro_screen.dart';
import 'package:flutter_demo_02/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntro();
  }

  void redirectTo(String redirectTo) {
    Navigator.of(context).pushNamed(redirectTo);
  }

  void redirectIntro() async {
    //await LocalStorageHelper.initLocalStorageHelper(); // Mở Hive box
    final ignoreIntroScreen =
        await LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;
    await Future.delayed(const Duration(milliseconds: 2000));

    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      redirectTo(LoginPage.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      redirectTo(IntroScreen.routName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8228),
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFormAsset(AssetHelper.imageLogoSplash,
                fit: BoxFit.fitWidth),
          )
        ],
      ),
    );
  }
}
