import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../../apis/api_services.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../../../model/login.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  static const routName = 'RequestScreen';
  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<Apartment>? apartmentList;
  Future<LoginResponse>? account;
  CallApi callApi = CallApi();
  int? accId;
  Future<List<Request>>? ownerRequests; // Add this line

  @override
  void initState() {
    super.initState();
    account = loadAccount();
    account!.then((value) {
      accId = value.id;
      getApartment(accId!);
      ownerRequests = callApi.getOwnerRequest(accId!); // Fetch owner requests
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

  @override
  Widget build(BuildContext context) {
    Map<int, String> apartmentIdToNameMap = {};
    if (apartmentList != null) {
      for (Apartment apartment in apartmentList!) {
        apartmentIdToNameMap[apartment.apartmentId] = apartment.apartmentName;
      }
    }

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
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Request>>(
        future: ownerRequests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Request>? requests = snapshot.data;
            if (requests != null && requests.isNotEmpty) {
              return ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  var request = requests[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Apartment: ${request.apartmentName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Owner: ${request.owner ?? 'N/A'}'),
                          Text('Package: ${request.packageName}'),
                          Text('Description: ${request.description ?? 'N/A'}'),
                          Text('Status: ${request.reqStatus}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No requests available.'),
              );
            }
          }
        },
      ),
    );
  }
}
