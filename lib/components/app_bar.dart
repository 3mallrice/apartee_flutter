import 'package:flutter/material.dart';
import '../../core/const/color_const.dart';

class AppBarCom extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final bool leading;
  final Widget? leftIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final List<Widget>? action;

  const AppBarCom({
    super.key,
    required this.appBarText,
    this.leading = false,
    this.leftIcon,
    this.backgroundColor,
    this.textColor,
    this.action,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: leading,
        leading: leftIcon,
        backgroundColor: backgroundColor ?? ColorPalette.primaryColor,
        title: Text(
          appBarText,
          style: TextStyle(
            color: textColor ?? ColorPalette.bgColor,
            fontSize: 25,
          ),
        ),
        elevation: 3,
        actions: action,
      ),
    );
  }
}
