import 'package:flutter/material.dart';
import 'package:flutter_demo_02/apis/api_services.dart';
import 'package:flutter_demo_02/components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/helpers/local_storage_helper.dart';
import 'package:flutter_demo_02/model/login.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:intl/intl.dart';

class StaffRequestDetail extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const StaffRequestDetail({Key? key});

  static const routName = 'staffRequestDetail';
  @override
  State<StaffRequestDetail> createState() => _StaffRequestDetailState();
}

class _StaffRequestDetailState extends State<StaffRequestDetail> {
  int requestId = -1;
  Request? request;
  CallApi callApi = CallApi();
  Future<LoginResponse>? account;

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

    getRequest(requestId);
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
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(30),
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
                        "Description:", request?.description ?? 'N/A'),
                    _buildInfoField(
                      "Booking Date:",
                      formatDateTime(request?.bookDateTime),
                    ),
                  ],
                ));
              },
            ),
          ),
          const SizedBox(
            height: 20,
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: ColorPalette.primaryColor, // Màu nền của nút
            ),
            child: Text(
              (request != null &&
                      (request?.reqStatus == 'PROCESSING' ||
                          request?.reqStatus == 'WORKING'))
                  ? (request?.reqStatus == 'PROCESSING' ? 'WORKING' : 'DONE')
                  : '',
              style: const TextStyle(
                fontSize: 20, // Đặt cỡ chữ thành 20
                fontWeight: FontWeight.bold, // In đậm
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
