import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/button.dart';
import '../../../common/widgets/input.dart';

class SigninScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 70, right: 70, top: 40, bottom: 20),
                child: Image.asset('Assets/Icons/orphanage.png'),
              ),
              Text(
                'Welcome back',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text('To continue using your account, log in',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: Icon(
                  Icons.email,
                  size: 35,
                ),
                hintText: 'your email',
                suffix: IconButton(
                  onPressed: () {
                    email.clear();
                  },
                  icon: Icon(
                    Icons.clear_all,
                    size: 35,
                  ),
                ),
                autofocus: false,
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: Icon(
                  Icons.lock,
                  size: 35,
                ),
                hintText: 'Enter password',
                suffix: IconButton(
                    onPressed: () {
                      Get.snackbar('Error', 'Action not allowed',
                          snackPosition: SnackPosition.TOP,
                          showProgressIndicator: true,
                          isDismissible: true,
                          forwardAnimationCurve: Curves.easeInCirc,
                          backgroundColor: Colors.blue,
                          colorText: Colors.black);
                    },
                    icon: Icon(Icons.visibility_off_outlined)),
                autofocus: false,
                controller: pwd,
                keyboardType: TextInputType.multiline,
                obscureText: true,
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'forgot your password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              LargeButton(
                  text: 'Sign In',
                  color: const Color.fromRGBO(51, 144, 124, 1),
                  ontap: () {},
                  containerColor: AppColor.scaffoldBackground),
              SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Don\'t Have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoutes.signup);
                      },
                    text: 'Register',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ])),
            ],
          ),
        ),
      ),
    ));
  }
}
