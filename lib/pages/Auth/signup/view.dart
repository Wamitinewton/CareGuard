import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/button.dart';
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
  // final SignUpController _signUpController = Get.put(SignUpController());
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
                padding:
                    EdgeInsets.only(left: 70, right: 70, top: 40, bottom: 20),
                child: Image.asset('Assets/Icons/mentorship.png'),
              ),
              // SizedBox(
              //   height: ,
              // ),
              const Text(
                'Welcome to careguard.Register to continue',
                style: TextStyle(color: AppColor.primaryText, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              inputEmailEdit(
                  preffix: Icon(
                    Icons.person_2,
                    size: 35,
                  ),
                  hintText: 'First name',
                  suffix: IconButton(
                    onPressed: () {
                      fname.clear();
                    },
                    icon: Icon(
                      Icons.clear_all,
                      size: 35,
                    ),
                  ),
                  autofocus: false,
                  controller: fname,
                  keyboardType: TextInputType.text),

              SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                  preffix: Icon(
                    Icons.person_2,
                    size: 35,
                  ),
                  hintText: 'Last name',
                  suffix: IconButton(
                    onPressed: () {
                      lname.clear();
                    },
                    icon: Icon(
                      Icons.clear_all,
                      size: 35,
                    ),
                  ),
                  autofocus: false,
                  controller: lname,
                  keyboardType: TextInputType.text),
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
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: _passwordVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)),
                autofocus: false,
                controller: pwd,
                keyboardType: TextInputType.multiline,
                obscureText: !_passwordVisible,
              ),
              SizedBox(
                height: 20,
              ),
              inputEmailEdit(
                preffix: Icon(
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
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)),
                autofocus: false,
                controller: cfmpwd,
                keyboardType: TextInputType.multiline,
                obscureText: !_cfmPasswordVisible,
              ),
              SizedBox(
                height: 35,
              ),
              LargeButton(
                  text: 'Register',
                  color: const Color.fromRGBO(51, 144, 124, 1),
                  ontap: () {},
                  containerColor: AppColor.scaffoldBackground),

              SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
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
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ])),
              SizedBox(
                height: 14,
              ),

              AuthMethods(text: 'Google Authentication', authlogo: 'authlogo1'),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.inputphone);
                  },
                  child: AuthMethods(
                      text: 'Phone Authentication', authlogo: 'authlogo2'))
            ],
          ),
        ),
      ),
    ));
  }
}
