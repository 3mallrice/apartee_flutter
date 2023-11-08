import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/apartment.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/model/apartment.dart';

import '../../../apis/api_services.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../../../model/login.dart';

class MyApartmentScreen extends StatefulWidget {
  static const routName = 'apartment';
  const MyApartmentScreen({super.key});

  @override
  State<MyApartmentScreen> createState() => _MyApartmentScreenState();
}

class _MyApartmentScreenState extends State<MyApartmentScreen> {
  Future<LoginResponse>? account;
  List<Apartment> apartmentList = [];
  int? accId;
  CallApi callApi = CallApi();

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    account!.then((value) {
      accId = value.id;
      getApartment(accId!);
    });
  }

  void getApartment(int accId) async {
    List<Apartment> apartList = await callApi.getApartmentList(accId);
    setState(() {
      apartmentList = apartList;
    });
  }

  Future<LoginResponse> loadAccount() async {
    return await LoginAccount.loadLoginAccount();
  }

  Function()? onTap() {
    return null;
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
                appBar: AppBarCom(
                  appBarText: 'My apartments',
                  leading: true,
                  leftIcon: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorPalette.bgColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: CustomScrollView(
                  primary: false,
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: MyApartment(
                                      apartment: apartmentList[index],
                                      onTap: onTap,
                                    )),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          );
                        },
                        childCount: apartmentList.length,
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
