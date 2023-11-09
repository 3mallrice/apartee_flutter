import 'package:flutter/material.dart';
import 'package:flutter_demo_02/apis/api_services.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/model/login.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:intl/intl.dart';

class StaffRequestDetail extends StatefulWidget {
  const StaffRequestDetail({super.key});

  static const routName = 'staffRequestDetail';
  @override
  State<StaffRequestDetail> createState() => _StaffRequestDetailState();
}

class _StaffRequestDetailState extends State<StaffRequestDetail> {
  int requestId = -1;
  Request? request;
  CallApi callApi = CallApi();
  Future<LoginResponse>? account;
  TextEditingController maintainItemController = TextEditingController();

  void getRequest(int requestId) async {
    Request rq = await callApi.getRequestDetail(requestId);
    setState(() {
      request = rq;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    requestId = ModalRoute.of(context)?.settings.arguments as int;

    setState(() {
      getRequest(requestId);
    });
  }

  Future<LoginResponse> loadAccount() async {
    return await LoginAccount.loadLoginAccount();
  }

  @override
  void initState() {
    super.initState();
    account = loadAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBarCom(
        appBarText: 'Request Detail',
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
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildInfoField(
                          "Apartment:", request?.apartmentName ?? 'N/A'),
                      _buildInfoField(
                          "Package Name:", request?.packageName ?? 'N/A'),
                      _buildInfoField("Package Price:",
                          request?.packagePrice.toString() ?? 'N/A'),
                      _buildInfoField("Owner:", request?.owner ?? 'N/A'),
                      _buildInfoField(
                          "Address:", request?.apartmentAddress ?? 'N/A'),
                      _buildInfoField(
                          "Description:", request?.description ?? 'N/A'),
                      _buildInfoField(
                        "Booking Date:",
                        formatDateTime(request?.bookDateTime),
                      ),
                      _buildInfoField("Status: ", request?.reqStatus ?? 'N/A'),
                      _buildInfoField(
                          "Maintain Item:", maintainItemController.text),
                      TextField(
                        controller: maintainItemController,
                        decoration: const InputDecoration(
                          labelText: 'Maintain Item',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ));
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  (request != null &&
                          (request?.reqStatus == 'PROCESSING' ||
                              request?.reqStatus == 'WORKING'))
                      ? Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPalette
                                      .primaryColor, // Màu nền của nút
                                ),
                                child: const Text(
                                  'HOME',
                                  style: TextStyle(
                                    fontSize: 20, // Đặt cỡ chữ thành 20
                                    fontWeight: FontWeight.bold, // In đậm
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (request != null) {
                                  if (request?.reqStatus == 'PROCESSING') {
                                    // Xử lý khi trạng thái là PROCESSING
                                    // Ví dụ: Navigator.push() để chuyển trang hoặc thực hiện hành động khác
                                  } else if (request?.reqStatus == 'WORKING') {
                                    // Xử lý khi trạng thái là WORKING
                                    // Ví dụ: Hiển thị thông báo hoặc thực hiện hành động khác
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPalette
                                    .primaryColor, // Màu nền của nút
                              ),
                              child: Text(
                                request?.reqStatus == 'PROCESSING'
                                    ? 'WORKING'
                                    : 'DONE',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String formatDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      return DateFormat('dd-MM-yyyy HH:mm').format(dateTime.toLocal());
    }
    return 'N/A';
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$label ',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18, // Đặt fontSize thành 18
                ),
              ),
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: ColorPalette.textColor,
                  fontSize: 18, // Đặt fontSize thành 18
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
