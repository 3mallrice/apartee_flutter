import 'package:flutter/material.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/account_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/apartee_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/apartment_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/bill_sceen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/contract_screen.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/request_screen.dart';
import 'package:flutter_demo_02/representation/screens/home_routes/home_screen.dart';
import 'package:flutter_demo_02/representation/screens/intro_screen.dart';
import 'package:flutter_demo_02/login_page.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/profile_screen.dart';
import 'package:flutter_demo_02/representation/screens/package_screen.dart';
import 'package:flutter_demo_02/representation/screens/request_routes/raise_request_screen.dart';
import 'package:flutter_demo_02/representation/screens/service_screen.dart';
import 'package:flutter_demo_02/representation/screens/splash_screen.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_home_routes/staff_home_screen.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_navbar.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routName: (context) => const SplashScreen(),
  IntroScreen.routName: (context) => const IntroScreen(),
  HomeScreen.routName: (context) => const HomeScreen(),
  MainApp.routName: (context) => const MainApp(),
  Profile.routName: (context) => const Profile(),
  AccountScreen.routName: (context) => const AccountScreen(),
  Apartee.routName: (context) => const Apartee(),
  RaiseRequestScreen.routName: (context) => const RaiseRequestScreen(),
  MyBillScreen.routName: (context) => const MyBillScreen(),
  MyRequestScreen.routName: (context) => const MyRequestScreen(),
  MyApartmentScreen.routName: (context) => const MyApartmentScreen(),
  MyContractScreen.routName: (context) => const MyContractScreen(),
  PackageScreen.routName: (context) => const PackageScreen(),
  ServiceScreen.routName: (context) => const ServiceScreen(),
  LoginPage.routeName: (context) => const LoginPage(),

  //staff
  StaffBar.routName: (context) => const StaffBar(),
  StaffHome.routName: (context) => const StaffHome(),
};
