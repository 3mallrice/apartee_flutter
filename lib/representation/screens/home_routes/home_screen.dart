import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/model/login.dart';
import 'package:flutter_demo_02/model/package.dart'; // Import đúng model Package
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../apis/api_services.dart';
import '../../../components/get_list_response.dart';
import '../../../components/package.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../request_routes/raise_request_screen.dart'; // Import đúng AssetHelper

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

  Future<LoginResponse>? account;
  int? requestId;
  int currentPage = 1;
  int totalPage = 1;
  bool isLastPage = false;
  List<Package> packageList = [];
  CallApi callApi = CallApi();

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    getPackages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    requestId = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as int
        : null;

    if (requestId != null) {
      Fluttertoast.showToast(
          msg: "Request $requestId raise successfully!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: ColorPalette.spaceLine,
          textColor: ColorPalette.primaryColor,
          fontSize: 16.0);
    }
  }

  Future<LoginResponse> loadAccount() async {
    return await LoginAccount.loadLoginAccount();
  }

  getPackages() async {
    GetListResponse response = await callApi.getPackages(currentPage);
    packageList = response.list as List<Package>;
    totalPage = response.totalPage;
    setState(() {});
  }

  void _onPackagesReachedEnd() {
    if (currentPage == totalPage) {
      // Đã hết trang
      isLastPage = true;
      return;
    }

    currentPage++;

    getPackages();
  }

  // Hàm kiểm tra đến cuối danh sách
  bool hasReachedMaxPackages(List<Package> packages) {
    // Nếu currentPage * pageSize >= totalCount
    // là đã đến cuối

    return packages.length == 10 * currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: account,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return Scaffold(
                backgroundColor: ColorPalette.bgColor,
                body: CustomScrollView(
                  primary: false,
                  shrinkWrap: true,
                  slivers: [
                    SliverAppBar(
                      backgroundColor:
                          ColorPalette.primaryColor.withOpacity(0.2),
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
                          "Hello${snapshot.data != null ? (" ${snapshot.data!.name}") : ""}, How are you today?",
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
                            autoPlayInterval:
                                const Duration(milliseconds: 10000),
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
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          // Kiểm tra cuối danh sách
                          if (index == packageList.length - 1) {
                            // Gọi hàm load thêm
                            _onPackagesReachedEnd();
                          }

                          if (isLastPage) {
                            Fluttertoast.showToast(
                                msg: "No more package",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: ColorPalette.spaceLine,
                                textColor: ColorPalette.primaryColor,
                                fontSize: 16.0);
                          }

                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: MyPackage(
                                  package: packageList[index],
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        RaiseRequestScreen.routName,
                                        arguments:
                                            packageList[index].packageId);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                        childCount: packageList.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return const Center(
              child: CircularProgressIndicator(
            color: ColorPalette.primaryColor,
          ));
        });
  }
}
