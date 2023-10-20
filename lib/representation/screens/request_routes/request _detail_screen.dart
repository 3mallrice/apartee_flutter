import 'package:flutter/material.dart';
import '../../../components/app_bar.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class RequestDetail extends StatefulWidget {
  const RequestDetail({super.key});
  static const routName = 'request_detail';

  @override
  State<RequestDetail> createState() => _RequestDetailState();
}

class _RequestDetailState extends State<RequestDetail> {
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
    );
  }
}
