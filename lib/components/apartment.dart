import 'package:flutter/material.dart';
import 'package:flutter_demo_02/model/apartment.dart';
import 'package:intl/intl.dart';

import '../core/const/color_const.dart';

class MyApartment extends StatelessWidget {
  final Apartment apartment;
  final Function()? onTap;
  const MyApartment({super.key, required this.apartment, this.onTap});

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
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                apartment.apartmentName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.primaryColor),
              ),
              Text(
                "Contract Number: ${apartment.contractNumber}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "From Date: ${DateFormat('dd/MM/yyyy').format(apartment.fromDate)}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "To Date: ${DateFormat('dd/MM/yyyy').format(apartment.toDate)}",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
