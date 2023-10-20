import 'package:flutter/material.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_account_routes/staff_account_screen.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_home_routes/staff_home_screen.dart';
import 'package:flutter_demo_02/representation/staff_screen/staff_noti_routes/staff_noti.dart';
import '../../core/const/color_const.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// ignore: implementation_imports
import 'package:font_awesome_icon_class/src/font_awesome_icon_class.dart';

class StaffBar extends StatefulWidget {
  const StaffBar({super.key});
  static String routName = 'staffbar';
  @override
  State<StaffBar> createState() => _StaffBarState();
}

class _StaffBarState extends State<StaffBar> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  var _selectedTab = _SelectedTab.Home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.bgColor,
        body: IndexedStack(
          index: _selectedTab.index,
          children: const [
            StaffHome(),
            StaffNoti(),
            StaffAccount(),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: DotNavigationBar(
            backgroundColor: const Color.fromARGB(182, 164, 144, 124),
            margin: const EdgeInsets.only(left: 5, right: 5),
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            onTap: _handleIndexChanged,
            dotIndicatorColor: ColorPalette.bgColor,
            unselectedItemColor: ColorPalette.bgColor,
            splashBorderRadius: 20,
            enableFloatingNavBar: true,
            borderRadius: 20,
            enablePaddingAnimation: false,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.house),
                selectedColor: ColorPalette.primaryColor,
              ),

              /// Noti
              DotNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.solidBell),
                selectedColor: ColorPalette.primaryColor,
              ),

              /// Account
              DotNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.solidUser),
                selectedColor: ColorPalette.primaryColor,
              ),
            ],
          ),
        ));
  }
}

// ignore: constant_identifier_names
enum _SelectedTab { Home, Message, Account }
