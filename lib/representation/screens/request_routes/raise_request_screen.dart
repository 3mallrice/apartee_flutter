import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/raise_request.dart';
import 'package:flutter_demo_02/model/apartment.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/components/my_button.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/model/package.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../apis/api_services.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../../../model/login.dart';

class RaiseRequestScreen extends StatefulWidget {
  static const routName = 'raise_request';

  const RaiseRequestScreen({Key? key}) : super(key: key);

  @override
  State<RaiseRequestScreen> createState() => _RaiseRequestScreenState();
}

class _RaiseRequestScreenState extends State<RaiseRequestScreen> {
  int? _selectedApartmentId;
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  int packageId = -1;
  Package? package;
  CallApi callApi = CallApi();
  Future<LoginResponse>? account;
  int? accId;
  List<Apartment>? apartmentList;
  TextEditingController descriptionController = TextEditingController();
  Map<int, String> apartmentIdToNameMap = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    packageId = ModalRoute.of(context)?.settings.arguments as int;

    getPackage(packageId);
  }

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    account!.then((value) {
      accId = value.id;
      getApartment(accId!);
    });
  }

  onPressedRaise() async {
    RaiseRequest request = RaiseRequest(
        apartmentId: _selectedApartmentId!,
        packageId: packageId,
        requestDescription: descriptionController.text);
    await callApi.raiseNewRequest(request);

    Fluttertoast.showToast(
      msg: "Request is raised successfully.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void getPackage(int packageId) async {
    Package pk = await callApi.getPackage(packageId);
    package = pk;
    setState(() {});
  }

  void getApartment(int accId) async {
    List<Apartment> apartList = await callApi.getApartmentList(accId);
    apartmentList = apartList;

    for (Apartment apartment in apartmentList!) {
      apartmentIdToNameMap[apartment.apartmentId] = apartment.apartmentName;
    }
  }

  Future<LoginResponse> loadAccount() async {
    return await LoginAccount.loadLoginAccount();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Raise request',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AssetHelper.imageBanner,
              width: screenWidth,
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  package?.packageName != null ? package!.packageName : "",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.textColor,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  package?.packageDescription != null
                      ? package!.packageDescription
                      : "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorPalette.unselectedIcon,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Select your apartment: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  DropdownButton<int>(
                    iconEnabledColor: ColorPalette.primaryColor,
                    focusColor: ColorPalette.spaceLine,
                    value: _selectedApartmentId,
                    iconSize: 48.0,
                    items: apartmentIdToNameMap.keys.map((int id) {
                      return DropdownMenuItem<int>(
                        value: id,
                        child: Text(apartmentIdToNameMap[id]!),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedApartmentId = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              color: ColorPalette.spaceLine,
              margin: const EdgeInsets.all(16),
              child: TextField(
                controller: descriptionController,
                onChanged: (text) {
                  setState(() {
                    // Bắt sự kiện thay đổi nội dung của descriptionController
                  });
                },
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter your request description...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: MyButton(
          onTap: () {
            onPressedRaise();
          },
          text: 'Raise SR',
          color: ColorPalette.primaryColor,
          textColor: ColorPalette.bgColor,
        ),
      ),
    );
  }
}
