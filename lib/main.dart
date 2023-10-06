import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aparter app',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.bgColor,
      ),

      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: routes,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
