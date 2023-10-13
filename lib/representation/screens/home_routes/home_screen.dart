import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routName = 'home';
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  static const List<String> sampleImages = [
    AssetHelper.imageBanner,
    AssetHelper.imageBanner1,
    AssetHelper.imageBanner2
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: ColorPalette.primaryColor.withOpacity(0.2),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/imgs/banner.webp",
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ],
              ),
              titlePadding: const EdgeInsets.only(bottom: 80),
              centerTitle: true,
              title: const Text(
                "Hello, How are you today?",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorPalette.bgColor,
                ),
              ),
            ),
            expandedHeight: 200,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  width: 900,
                ),
                FanCarouselImageSlider(
                  imagesLink: sampleImages,
                  sliderHeight: 200,
                  sliderWidth: 700,
                  isAssets: true,
                  autoPlay: false,
                  imageRadius: 12,
                  autoPlayInterval: const Duration(milliseconds: 10000),
                  expandedImageFitMode: BoxFit.contain,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0), // Căn trái
              child: Text(
                "Packages",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.textColor,
                ),
              ),
            ),
          ),
          //giua

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 55,
              child: Center(
                child: Text(
                  '© Copyright of Apartee',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.textColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
