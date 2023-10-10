import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routName = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  static const List<String> sampleImages = [
    'assets/imgs/banner.webp',
    'assets/imgs/banner_1.png',
    'assets/imgs/banner2.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: CustomScrollView(
        slivers: [
          //Sliver app bar
          SliverAppBar(
            // pinned: true,
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
                    color: Colors.black
                        .withOpacity(0.4), // Độ trong suốt của màu đen
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
                    // isClickable: false,
                    expandedImageFitMode: BoxFit.contain),
              ],
            ),
          ),

          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 400,
                color: ColorPalette.secondColor,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
