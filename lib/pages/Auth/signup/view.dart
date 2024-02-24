import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/button.dart';
import 'package:careguard/common/widgets/divider.dart';
import 'package:careguard/common/widgets/input.dart';
import 'package:careguard/pages/Auth/signup/controller.dart';
import 'package:careguard/pages/Auth/signup/or_continue.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController pwd = TextEditingController();

  final TextEditingController cfmpwd = TextEditingController();

  final TextEditingController fname = TextEditingController();

  final TextEditingController lname = TextEditingController();

  final TextEditingController email = TextEditingController();

  final SignUpController _signUpController = Get.put(SignUpController());
  bool _passwordVisible = false;
  bool _cfmPasswordVisible = false;

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
                child: Image.asset('Assets/Icons/mentorship.png'),
              ),
              // SizedBox(
              //   height: ,
              // ),
              const Text(
                'Welcome to careguard.Register to continue',
                style: TextStyle(color: AppColor.primaryText, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              inputEmailEdit(
                  preffix: const Icon(
                    Icons.person_2,
                    size: 35,
                  ),
                  hintText: 'First name',
                  suffix: IconButton(
                    onPressed: () {
                      fname.clear();
                    },
                    icon: const Icon(
                      Icons.clear_all,
                      size: 35,
                    ),
                  ),
                  autofocus: false,
                  controller: fname,
                  keyboardType: TextInputType.text),

              const SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                  preffix: const Icon(
                    Icons.person_2,
                    size: 35,
                  ),
                  hintText: 'Last name',
                  suffix: IconButton(
                    onPressed: () {
                      lname.clear();
                    },
                    icon: const Icon(
                      Icons.clear_all,
                      size: 35,
                    ),
                  ),
                  autofocus: false,
                  controller: lname,
                  keyboardType: TextInputType.text),
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
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: _passwordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                autofocus: false,
                controller: pwd,
                keyboardType: TextInputType.multiline,
                obscureText: !_passwordVisible,
              ),
              const SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: const Icon(
                  Icons.lock,
                  size: 35,
                ),
                hintText: 'Re-type your password',
                suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _cfmPasswordVisible = !_cfmPasswordVisible;
                      });
                    },
                    icon: _cfmPasswordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                autofocus: false,
                controller: cfmpwd,
                keyboardType: TextInputType.multiline,
                obscureText: !_cfmPasswordVisible,
              ),
              const SizedBox(
                height: 35,
              ),
              LargeButton(
                  text: 'Register',
                  color: const Color.fromRGBO(51, 144, 124, 1),
                  ontap: () {
                    _signUpController.signUp(fname.text, lname.text, email.text,
                        cfmpwd.text, pwd.text);
                    Get.offAllNamed(AppRoutes.homescreen);
                  },
                  containerColor: AppColor.scaffoldBackground),

              const SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(
                  text: 'Have an account? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.offAllNamed(AppRoutes.signin);
                      },
                    text: 'Sign in',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ])),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  DividerUtil(),
                  Text('Or continue with'),
                  DividerUtil(),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const AuthMethods(
                  text: 'Google Authentication', authlogo: 'authlogo1'),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.inputphone);
                  },
                  child: const AuthMethods(
                      text: 'Phone Authentication', authlogo: 'authlogo2'))
            ],
          ),
        ),
      ),
    ));
  }
}
