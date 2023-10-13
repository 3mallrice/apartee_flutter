import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/representation/screens/login_page.dart';
import 'package:flutter_demo_02/representation/widgets/ButtonWidget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routName = '/intro_screen';

  @override
  // ignore: library_private_types_in_public_api
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.toInt() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.bgColor,
      child: Stack(
        alignment: Alignment.bottomCenter, // Đặt nút ở dưới cùng
        children: [
          FlutterCarouselIntro(
            controller: _pageController,
            animatedRotateX: false,
            animatedRotateZ: false,
            scale: true,
            autoPlay: false,
            animatedOpacity: true,
            autoPlaySlideDuration: const Duration(milliseconds: 1000),
            autoPlaySlideDurationTransition: const Duration(milliseconds: 1000),
            primaryColor: ColorPalette.primaryColor,
            secondaryColor: Colors.grey,
            scrollDirection: Axis.horizontal,
            indicatorAlign: IndicatorAlign.bottom,
            indicatorEffect: IndicatorEffects.worm,
            slides: [
              Image.asset(AssetHelper.imageIntro1),
              Image.asset(AssetHelper.imageIntro2),
              Image.asset(AssetHelper.imageIntro3),
            ],
          ),
          Visibility(
            visible:
                currentPage == 2, // Hiển thị nút khi đang ở slide cuối cùng
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(60.0),
                child: ButtonWidget(
                  title: 'Get Started',
                  ontap: () {
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
