import 'package:flutter/material.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => const SplashScreen(),
  //Home.routName:(context) => const Home(),
  MainApp.routName:(context) => const MainApp(),
};