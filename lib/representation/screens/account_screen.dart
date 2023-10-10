import 'package:flutter/material.dart';
import 'package:flutter_demo_02/core/helpers/asset_helpers.dart';
import 'package:flutter_demo_02/representation/screens/profile_screen.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../../core/const/color_const.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  static const routName = 'account';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      appBar: AppBar(
        backgroundColor: ColorPalette.bgColor,
        title: const Text(
          'Account',
          style: TextStyle(color: ColorPalette.textColor, fontSize: 25),
        ),
        elevation: 3,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: ColorPalette.bgColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
                child: Container(
                  color: ColorPalette.thirdbgColor,
                ),
              ),
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
                          backgroundImage: AssetImage(AssetHelper.imageBanner),
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
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Profile.routName);
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
              SizedBox(
                height: 10,
                child: Container(
                  color: ColorPalette.thirdbgColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: accountLayouts.length,
                  itemBuilder: (context, index) {
                    final request = accountLayouts[index];
                    return Card(
                      margin: const EdgeInsets.all(3.5),
                      child: ListTile(
                        leading: Icon(
                          request.icon,
                        ),
                        title: Text(request.title),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          // Xử lý khi bấm vào một yêu cầu
                          // Ví dụ: điều hướng đến trang chi tiết yêu cầu
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(
                  color: ColorPalette.thirdbgColor,
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấn
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: ColorPalette.secondColor,
                  surfaceTintColor: ColorPalette.primaryColor,
                  elevation: 5,
                  backgroundColor:
                      ColorPalette.bgColor, // Đặt màu nền của nút là màu cam
                  minimumSize: const Size(
                      double.infinity, 50), // Tràn hết width và đặt chiều cao
                ),
                child: const Text(
                  'About Apartee',
                  style: TextStyle(
                    color:
                        ColorPalette.primaryColor, // Đặt màu chữ là màu trắng
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountLayout {
  final IconData icon;
  final String title;

  AccountLayout(this.title, this.icon);
}

List<AccountLayout> accountLayouts = [
  AccountLayout('Bills', FontAwesomeIcons.fileInvoiceDollar),
  AccountLayout('Requests', FontAwesomeIcons.notesMedical),
  AccountLayout('Apartments', FontAwesomeIcons.solidBuilding),
  AccountLayout('Contracts', FontAwesomeIcons.fileContract),
  AccountLayout('Packages', FontAwesomeIcons.cubes),
  AccountLayout('Services', FontAwesomeIcons.ethernet),
  // Thêm các yêu cầu khác vào đây
];
