import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/staff_request.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/model/login.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_request_routes/staff_request_detail.dart';

import '../../../apis/api_services.dart';
import '../../../core/helpers/asset_helpers.dart';

class StaffHome extends StatefulWidget {
  static const routName = 'staffHome';
  const StaffHome({super.key});

  @override
  State<StaffHome> createState() => _StaffHomeState();
}

class _StaffHomeState extends State<StaffHome> {
  static const List<String> sampleImages = [
    AssetHelper.imageBanner,
    AssetHelper.imageBanner1,
    AssetHelper.imageBanner2
  ];

  Future<LoginResponse>? account;
  int currentPage = 1;
  int totalPage = 1;
  bool isLastPage = false;
  List<Request> requestList = [];
  CallApi callApi = CallApi();
  int staffid = -1;

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    account!.then(
      (acc) {
        staffid = acc.id;
        getRequest();
      },
    );
  }

  Future<LoginResponse> loadAccount() async {
    final loginData = await LoginAccount.loadLoginAccount();
    return loginData;
  }

  getRequest() async {
    requestList = await callApi.getStaffRequest(staffid, currentPage);
    setState(() {});
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
              staffid = snapshot.data!.id;
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
                                AssetHelper.imageBanner,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ],
                          ),
                          titlePadding: const EdgeInsets.only(bottom: 80),
                          centerTitle: true,
                          title: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorPalette.secondColor),
                              child: Text(
                                "Hello${snapshot.data != null ? (" ${snapshot.data!.name}") : ""}, How are you today?",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.bgColor),
                              ))),
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
                          "Today requests",
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
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: StaffRequest(
                                  staffRequest: requestList[index],
                                  requestid: requestList[index].requestId,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        StaffRequestDetail.routName,
                                        arguments:
                                            requestList[index].requestId);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        },
                        childCount: requestList.length,
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
