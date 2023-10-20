import 'package:flutter/material.dart';

import '../../../components/app_bar.dart';
import '../../../core/const/color_const.dart';
import '../../../core/helpers/asset_helpers.dart';

class StaffAccount extends StatefulWidget {
  const StaffAccount({super.key});

  @override
  State<StaffAccount> createState() => _StaffAccountState();
}

class _StaffAccountState extends State<StaffAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: const AppBarCom(
        appBarText: 'Account',
        textColor: ColorPalette.bgColor,
        backgroundColor: ColorPalette.primaryColor,
      ),
      body: Container(
        color: ColorPalette.bgColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Box.sizedBox(10, ColorPalette.secondColor, null),
                // Phần trên cùng
                Container(
                  color: ColorPalette.bgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage(AssetHelper.imageBanner),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Nguyễn Văn A',
                                style: TextStyle(
                                  color: ColorPalette.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Box.sizedBox(8, null, null),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context)
                                  //     .pushNamed(Profile.routName);
                                },
                                child: const Text(
                                  'View Profile',
                                  style: TextStyle(
                                    color: ColorPalette.textOnTapColor,
                                    fontSize: 16,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Box.sizedBox(10, ColorPalette.secondColor, null),

                MyAccountButton(
                  text: 'Bills',
                  leftIcon: FontAwesomeIcons.fileInvoiceDollar,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyBillScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Requests',
                  leftIcon: FontAwesomeIcons.notesMedical,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyRequestScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Apartments',
                  leftIcon: FontAwesomeIcons.solidBuilding,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyApartmentScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Assets',
                  leftIcon: FontAwesomeIcons.fileContract,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyContractScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Contracts',
                  leftIcon: FontAwesomeIcons.fileContract,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyContractScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Packages',
                  leftIcon: FontAwesomeIcons.cubes,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(PackageScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                MyAccountButton(
                  text: 'Services',
                  leftIcon: FontAwesomeIcons.ethernet,
                  rightIcon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).pushNamed(ServiceScreen.routName);
                  },
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Apartee.routName);
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: ColorPalette.secondColor,
                    surfaceTintColor: ColorPalette.primaryColor,
                    elevation: 5,
                    backgroundColor: ColorPalette.bgColor,
                    minimumSize: const Size(300, 51),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: ColorPalette.primaryColor,
                          child: Image.asset(
                            'assets/imgs/logo.png',
                            width: 50,
                            height: 50,
                            color: ColorPalette.bgColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      const SizedBox(
                        width: 300,
                        child: Text(
                          'About Apartee',
                          style: TextStyle(
                              color: ColorPalette.textColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
                Box.sizedBox(1, ColorPalette.spaceLine, null),
                Box.sizedBox(20, ColorPalette.bgColor, null),

                //Logout
                MyButton(
                  onTap: OnTap.onTap(),
                  text: 'Logout',
                  color: ColorPalette.secondColor,
                  textColor: ColorPalette.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnPress {
  static void Function()? onPressed() {
    return null;
  }
}

class OnTap {
  static dynamic Function()? onTap() {
    return null;
  }
}

class Box {
  static SizedBox sizedBox(double? height, Color? color, double? width) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        color: color,
      ),
    );
  }
}
