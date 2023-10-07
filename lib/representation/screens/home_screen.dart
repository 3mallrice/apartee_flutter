import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/core/helpers/image_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const routName = 'home_screen';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PageController _pageController = PageController();

  Widget _buildItemInHomeScreen(String image){
    return Column(
      children: [
        ImageHelper.loadFormAsset(
          image,
          height: 300,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildItemInHomeScreen(AssetHelper.imageBanner),
        ],
      ),
    );
  }
}