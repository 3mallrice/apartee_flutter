import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/core/const/textstyle_const.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorPalette.primaryColor,
      ),
      child: MaterialButton(
        minWidth: 0, // Đặt chiều ngang tối thiểu để fit chữ
        height: 40,
        onPressed: ontap,
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
      ),
    );
  }
}
