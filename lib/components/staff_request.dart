import 'package:flutter/material.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:intl/intl.dart';

import '../core/const/color_const.dart';

class StaffRequest extends StatelessWidget {
  final Request staffRequest;
  final int requestid;
  final Function()? onTap;
  const StaffRequest(
      {super.key,
      required this.staffRequest,
      this.onTap,
      required this.requestid});

  Color? getStatusColor(String status) {
    switch (status) {
      case 'PENDING':
        return Colors.yellow[100];
      case 'PROCESSING':
        return ColorPalette.secondColor;
      case 'DONE':
        return Colors.green[300];
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        elevation: 4,
        color: ColorPalette.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: InkWell(
          onTap: onTap,
          hoverColor: ColorPalette.secondColor,
          splashColor: ColorPalette.secondColor,
          child: Container(
            width: screenWidth, // Sét chiều rộng bằng chiều rộng màn hình
            decoration: BoxDecoration(
              color: getStatusColor(staffRequest.reqStatus),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Package: ${staffRequest.packageName}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Booking Date: ${DateFormat('dd-MM-yyyy HH:mm').format(staffRequest.bookDateTime.toLocal())}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Status: ${staffRequest.reqStatus}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
