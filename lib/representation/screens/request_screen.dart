import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../core/const/color_const.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Request',
        action: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 5, 5),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                color: ColorPalette.bgColor,
              )),
        ],
      ),
      body: ListView.builder(
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
