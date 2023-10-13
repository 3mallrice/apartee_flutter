import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';
import 'package:flutter_demo_02/routes.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  // runApp(const MyApp());
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
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
        scaffoldBackgroundColor: ColorPalette.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      home: const SplashScreen(),
      // home: LoginPage(),
      routes: routes,
    );
  }
}
