import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routName = 'homw_screen';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [

        ],
      ),
    );
  }
}