import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/pages/Auth/login/controller.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/button.dart';
import '../../../common/widgets/input.dart';

class SigninScreen extends StatelessWidget {
  static final TextEditingController email = TextEditingController();
  static final TextEditingController pwd = TextEditingController();

  final SignInController _signInController = Get.put(SignInController());
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 70, right: 70, top: 40, bottom: 20),
                child: Image.asset('Assets/Icons/orphanage.png'),
              ),
              const Text(
                'Welcome back',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('To continue using your account, log in',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: const Icon(
                  Icons.email,
                  size: 35,
                ),
                hintText: 'your email',
                suffix: IconButton(
                  onPressed: () {
                    email.clear();
                  },
                  icon: const Icon(
                    Icons.clear_all,
                    size: 35,
                  ),
                ),
                autofocus: false,
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: const Icon(
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
                    icon: const Icon(Icons.visibility_off_outlined)),
                autofocus: false,
                controller: pwd,
                keyboardType: TextInputType.multiline,
                obscureText: true,
              ),
              const SizedBox(
                height: 7,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 35),
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
              const SizedBox(
                height: 35,
              ),
              LargeButton(
                  text: 'Sign In',
                  color: const Color.fromRGBO(51, 144, 124, 1),
                  ontap: () async {
                    await _signInController.signIn(email.text, pwd.text);
                    Get.offAllNamed(AppRoutes.homescreen);
                  },
                  containerColor: AppColor.scaffoldBackground),
              const SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(
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
                    style: const TextStyle(
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
