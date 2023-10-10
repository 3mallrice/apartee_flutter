import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../core/const/color_const.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgColor,
        title: const Text(
          'Account',
          style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
        ),
        elevation: 3, //create the shadow for app bar
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Phần trên cùng
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(AssetHelper.imageBanner),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                          color: ColorPalette.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Xử lý khi nhấn vào "View Profile"
                          // Ví dụ: điều hướng đến trang chi tiết profile
                        },
                        child: const Text(
                          'View Profile',
                          style: TextStyle(
                            color: ColorPalette.textOnTapColor,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: upcomingRequests.length,
            itemBuilder: (context, index) {
              final request = upcomingRequests[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(request.title),
                  subtitle: Text(request.date),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Xử lý khi bấm vào một yêu cầu
                    // Ví dụ: điều hướng đến trang chi tiết yêu cầu
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class UpcomingRequest {
  final String title;
  final String date;

  UpcomingRequest(this.title, this.date);
}

List<UpcomingRequest> upcomingRequests = [
  UpcomingRequest('Yêu cầu số 1', '10/10/2023'),
  UpcomingRequest('Yêu cầu số 2', '15/10/2023'),
  UpcomingRequest('Yêu cầu số 3', '20/10/2023'),
  // Thêm các yêu cầu khác vào đây
];
