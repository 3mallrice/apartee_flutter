import 'package:flutter/material.dart';
import 'package:flutter_demo_02/apis/api_services.dart';
import 'package:flutter_demo_02/components/my_button.dart';
import 'package:flutter_demo_02/components/my_textfield.dart';
import 'package:flutter_demo_02/components/square_title.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';
import 'package:flutter_demo_02/representation/screens/main_app.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onPressedLogin() async {
    // Lấy email và password từ text field
    String email = emailController.text;
    String password = passwordController.text;

    // Gọi API
    String result = await CallApi().login(email, password);

    // Xử lý kết quả
    if (result == 'success') {
      // Chuyển sang home
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(MainApp.routName);
    } else {
      // Hiển thị lỗi
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Đăng nhập thất bại')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  //logo
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/imgs/logo.png',
                      color: ColorPalette.bgColor,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  //welcome back, you've been missed!
                  const Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(
                      color: ColorPalette.bgColor,
                      fontSize: 19,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //username textfield
                  MyTextfield(
                    Controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //password textfield
                  MyTextfield(
                    Controller: passwordController,
                    obscureText: true,
                    hintText: 'Password',
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //forgot password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(color: ColorPalette.bgColor),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //sign-in button
                  MyButton(
                    onTap: onPressedLogin,
                    text: 'Login',
                    color: ColorPalette.bgColor,
                    textColor: ColorPalette.primaryColor,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //or continue with
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                              thickness: 0.5, color: ColorPalette.bgColor),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: ColorPalette.bgColor),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: ColorPalette.bgColor),
                        ),
                      ],
                    ),
                  ),

                  //Google + Facebook buttons

                  const SizedBox(
                    height: 20,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTitle(imgPath: "assets/imgs/google.png"),
                      SizedBox(
                        width: 10,
                      ),
                      SquareTitle(
                        imgPath: "assets/imgs/facebook.png",
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
