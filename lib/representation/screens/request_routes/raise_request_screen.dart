import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class RaiseRequestScreen extends StatelessWidget {
  static const routName = 'raise_request';
  const RaiseRequestScreen({super.key});

  Future<List<String>> getApartments() async {
    // Call API
    return ['Apartment A', 'Apartment B', 'Apartment C'];
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          // Lấy danh sách apartment từ API
          FutureBuilder(
            future: getApartments(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  items: snapshot.data?.map((apartment) {
                    return DropdownMenuItem(
                      value: apartment,
                      child: Text(apartment),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Lưu giá trị được chọn
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),

          // Phần view khác của screen
        ],
      ),
    );
  }
}
