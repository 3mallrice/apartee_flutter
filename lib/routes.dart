import 'package:flutter/material.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/account_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/apartee_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/profile_screen.dart';
import 'package:flutter_demo_02/representation/screens/home_routes/home_screen.dart';
import 'package:flutter_demo_02/representation/screens/intro_screen.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';
import 'package:flutter_demo_02/representation/screens/request_routes/raise_request_screen.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => const SplashScreen(),
  IntroScreen.routName: (context) => const IntroScreen(),
  HomeScreen.routName: (context) => const HomeScreen(),
  MainApp.routName: (context) => const MainApp(),
  Profile.routName: (context) => const Profile(),
  AccountScreen.routName: (context) => const AccountScreen(),
  Apartee.routName: (context) => const Apartee(),
  RaiseRequestScreen.routName: (context) => const RaiseRequestScreen(),
};
