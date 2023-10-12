import 'package:flutter/material.dart';
import 'package:flutter_demo_02/components/my_button.dart';
import 'package:flutter_demo_02/components/my_textfield.dart';
import 'package:flutter_demo_02/components/square_title.dart';
import 'package:flutter_demo_02/core/const/color_const.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.bgColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),

                //logo
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/imgs/logo.png',
                    color: ColorPalette.primaryColor,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //welcome back, you've been missed!
                Text(
                  'Welcome back, you\'ve been missed!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),

                const SizedBox(
                  height: 30,
                ),

                //username textfield
                const MyTextfield(
                  Controller: TextEditingController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(
                  height: 5,
                ),

                //password textfield
                const MyTextfield(
                  Controller: TextEditingController,
                  obscureText: true,
                  hintText: 'Password',
                ),

                const SizedBox(
                  height: 30,
                ),

                //forgot password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(color: ColorPalette.unselectedIcon),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //sign-in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Login',
                ),

                const SizedBox(
                  height: 50,
                ),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
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
                    SquareTitle(imgPath: "", height: 40),
                    SizedBox(
                      width: 10,
                    ),
                    SquareTitle(
                      imgPath: "",
                      height: 25,
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //Not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Not a member?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(
                //       width: 4,
                //     ),
                //     const Text(
                //       'Register now',
                //       style: TextStyle(
                //           color: Colors.blue, fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
