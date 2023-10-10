import 'package:flutter/material.dart';
import 'package:flutter_demo_02/representation/screens/account_screen.dart';
import 'package:flutter_demo_02/representation/screens/home_screen.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';
import 'package:flutter_demo_02/representation/screens/profile_screen.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => const SplashScreen(),
  HomeScreen.routName: (context) => const HomeScreen(),
  MainApp.routName: (context) => const MainApp(),
  Profile.routName: (context) => const Profile(),
  AccountScreen.routName: (context) => const AccountScreen(),
};
