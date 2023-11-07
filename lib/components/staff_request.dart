import 'package:flutter/material.dart';
import 'package:flutter_demo_02/model/request.dart';

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

  Color getStatusColor(String status) {
    switch (status) {
      case 'on-going':
        return Colors.greenAccent;
      case 'cancel':
        return Colors.redAccent;
      case 'finish':
        return ColorPalette.secondColor;
      default:
        return Colors.white;
    }
  }

  void Function()? onPressed() {}

  void showConfirmationDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Status Update"),
          content: const Text("Do you want to mark this request as done?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Perform status update here
                // You can update the status of 'myRequest' here
                onPressed;

                // Close the dialog
                Navigator.of(context).pop();

                // Show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Request marked as done."),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4,
        color: ColorPalette.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        child: InkWell(
          onTap: onTap,
          hoverColor: ColorPalette.secondColor,
          splashColor: ColorPalette.secondColor,
          child: Container(
            color: getStatusColor(staffRequest.reqStatus),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Package: ${staffRequest.packageName}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Booking Date: ${staffRequest.bookDateTime.toLocal()}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Status: ${staffRequest.reqStatus}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showConfirmationDialog(context);
                      },
                      child: const Text("Done"),
                    ),
                    const SizedBox(width: 10), // Add some space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle cancel action here
                        showConfirmationDialog(context);
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
