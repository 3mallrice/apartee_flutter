import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/model/login.dart';
import 'package:flutter_demo_02/model/package.dart'; // Import đúng model Package
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';

import '../../../components/package.dart';
import '../../../core/helpers/local_storage_helper.dart'; // Import đúng AssetHelper

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routName = 'home'; // Sửa lại tên biến routName thành routeName
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  static const List<String> sampleImages = [
    AssetHelper.imageBanner,
    AssetHelper.imageBanner1,
    AssetHelper.imageBanner2
  ];

  String? name;
  LoginResponse? account;

  @override
  void initState() {
    super.initState();
    account = LocalStorageHelper.getValue("account");

    if (account != null) {
      name = account?.name;
    }
  }

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
              title: Text(
                "Hello${name != null ? " $name" : ""},\nHow are you today?",
                style: const TextStyle(
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
              padding: EdgeInsets.symmetric(horizontal: 20),
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
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPackage(
                onTap: () {},
                package: Package(
                    packageID: 1,
                    apartmentTypeName: 'Apartment22',
                    code: "ABC123",
                    name:
                        "Sample Package This is a sample package description.",
                    description:
                        "This is a sample package description. This is a sample package description. This is a sample package description. This is a sample package description.",
                    price: 100.0,
                    imageUri:
                        'https://maxst.icons8.com/vue-static/landings/license/mobileApps1x.webp'),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPackage(
                onTap: () {},
                package: Package(
                    packageID: 1,
                    apartmentTypeName: 'Apartment22',
                    code: "ABC123",
                    name:
                        "Sample Package This is a sample package description.",
                    description:
                        "This is a sample package description. This is a sample package description. This is a sample package description. This is a sample package description.",
                    price: 100.0,
                    imageUri:
                        'https://maxst.icons8.com/vue-static/landings/license/websites1x.webp'),
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
          ),
        ],
      ),
    );
  }
}
