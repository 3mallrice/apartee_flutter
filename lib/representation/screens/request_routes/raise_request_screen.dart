import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_02/model/apartment.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/components/my_button.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/model/package.dart';
import 'package:intl/intl.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';

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
  String? _selectedApartment;
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  onPressedRaise() async {}

  int packageId = -1;
  Package? package;
  CallApi callApi = CallApi();
  Future<LoginResponse>? account;
  int? accId;
  List<Apartment>? apartmentList;
  TextEditingController descriptionController = TextEditingController();

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

  void getPackage(int packageId) async {
    Package pk = await callApi.getPackage(packageId);
    package = pk;
    // setState(() {});
  }

  void getApartment(int accId) async {
    List<Apartment> apartList = await callApi.getApartmentList(accId);
    apartmentList = apartList;
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
                  DropdownButton<String>(
                    value:
                        _selectedApartment ?? apartmentList?[0].apartmentName,
                    iconSize: 48.0,
                    items: apartmentList?.toSet().map((Apartment apartment) {
                      return DropdownMenuItem<String>(
                        value: apartment.apartmentName,
                        child: Text(apartment.apartmentName),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedApartment = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.bgColor,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              var today = DateTime.now();
                              return Dialog(
                                child: SpinnerDateTimePicker(
                                    initialDateTime: today,
                                    maximumDate:
                                        today.add(const Duration(days: 365)),
                                    minimumDate: now,
                                    mode: CupertinoDatePickerMode.dateAndTime,
                                    use24hFormat: true,
                                    didSetTime: (selectedDate) {
                                      if (selectedDate.isBefore(now)) {
                                        // Ngày không hợp lệ
                                        return;
                                      }

                                      // Ngày hợp lệ
                                      // Cập nhật ngày đã chọn
                                      setState(() {
                                        this.selectedDate = selectedDate;
                                      });
                                    }),
                              );
                            });
                      },
                      child: const Text(
                        "Select Request Date & Time",
                        style: TextStyle(
                            fontSize: 18, color: ColorPalette.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("Request date:"),
                    Text(
                      DateFormat('dd/MM/yyyy HH:mm').format(selectedDate),
                      style: const TextStyle(
                          fontSize: 18, color: ColorPalette.primaryColor),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.all(16),
              child: TextField(
                controller: descriptionController,
                maxLines: 2,
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
          onTap: onPressedRaise,
          text: 'Raise SR',
          color: ColorPalette.primaryColor,
          textColor: ColorPalette.bgColor,
        ),
      ),
    );
  }
}
