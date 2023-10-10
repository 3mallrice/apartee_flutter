import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/representation/screens/login_page.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';
import 'package:flutter_demo_02/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartee app',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.bgColor,
      ),
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
