import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routName = 'home';
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  static const List<String> sampleImages = [
    'assets/imgs/banner.webp',
    'assets/imgs/banner_1.png',
    'assets/imgs/banner2.png'
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.star,
    Icons.phone,
    Icons.mail,
    Icons.camera,
    Icons.games,
    Icons.music_note,
    Icons.shopping_cart,
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
          SliverPadding(
            padding: const EdgeInsets.all(30),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.0, // Điều này có thể làm cho ô lớn hơn
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  IconData iconData = iconList[index];

                  return InkWell(
                    onTap: () {
                      //ontap
                    },
                    child: GridTile(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Container(
                          color: const Color(0x38FF8228), // Màu cố định
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                iconData,
                                color: ColorPalette.primaryColor,
                                size: 30,
                              ),
                              Text(
                                "Package $index", // Thay đổi nội dung văn bản ở đây
                                style: const TextStyle(
                                  color: ColorPalette.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 9,
              ),
            ),
          ),
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
