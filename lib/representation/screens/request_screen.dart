import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: ColorPalette.bgColor,
        title: const Text(
          'Request',
          style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 5, 5),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                color: ColorPalette.textColor,
              )),
        ],
        elevation: 3, //create the shadow for app bar
        automaticallyImplyLeading: false,
        // bottom: ,
      ),
    );
  }
}
