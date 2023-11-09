import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/representation/screens/account_routes/request_screen.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../../apis/api_services.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../../../model/login.dart';
import '../../../model/request.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  CallApi callApi = CallApi();
  Future<LoginResponse>? account;
  int? accId;
  List<Request> requestList = [];

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    account!.then((value) {
      accId = value.id;
      getRequests(accId!);
    });
  }

  void getRequests(int accId) async {
    try {
      List<Request> requests = await callApi.getOwnerRequest(accId);
      setState(() {
        requestList = requests;
      });
    } catch (error) {
      Text(
        "Error loading requests: $error",
        style: const TextStyle(
            color: ColorPalette.primaryColor,
            fontWeight: FontWeight.normal,
            fontSize: 18),
      );
      // Xử lý lỗi nếu cần
    }
  }

  Future<LoginResponse> loadAccount() async {
    return await LoginAccount.loadLoginAccount();
  }

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
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRequestScreen.routName);
                },
                icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                color: ColorPalette.bgColor,
              )),
        ],
      ),
      // body: Column(
      //   children: [
      //     const SizedBox(width: 20.0),
      //     DropdownButton<int>(
      //       value: _selectedApartmentId ?? apartmentIdToNameMap.keys.first,
      //       iconSize: 48.0,
      //       items: apartmentIdToNameMap.keys.map((int id) {
      //         return DropdownMenuItem<int>(
      //           value: id,
      //           child: Text(apartmentIdToNameMap[id]!),
      //         );
      //       }).toList(),
      //       onChanged: (int? newValue) {
      //         setState(() {
      //           _selectedApartmentId = newValue!;
      //         });
      //       },
      //     ),
      //     ListView.builder(
      //       itemCount: upcomingRequests.length,
      //       itemBuilder: (context, index) {
      //         final request = upcomingRequests[index];
      //         return Card(
      //           margin: const EdgeInsets.all(8.0),
      //           child: ListTile(
      //             title: Text(request.title),
      //             subtitle: Text(request.date),
      //             trailing: const Icon(Icons.arrow_forward),
      //             onTap: () {
      //               Navigator.of(context).pushNamed(RequestDetail.routName);
      //             },
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // )
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
