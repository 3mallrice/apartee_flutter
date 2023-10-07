import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/core/helpers/image_helper.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routName = '/plash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectHome();
  }

  void redirectHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushNamed(MainApp.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF8228), // Đặt màu nền thành FF8228
      body: Stack(
        children: [
          ImageHelper.loadFormAsset(AssetHelper.imageLogoSplash,
              fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
