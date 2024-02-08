import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/button.dart';
import 'package:careguard/pages/Auth/otp_verification/controller.dart';
import 'package:careguard/pages/Auth/otp_verification/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final PhoneNumberController _numberController = Get.put(PhoneNumberController());

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 7,
                top: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.signup);
                  },
                  child: Icon(Icons.arrow_back_ios),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Verification code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'We have sent a verification code to your phone',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Get.offAllNamed(AppRoutes.inputphone);
              },
              child: const Text(
                'Change phone number?',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 4; i++)
                      OtpFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            LargeButton(
                text: 'Verify',
                color: const Color.fromRGBO(51, 144, 124, 1),
                ontap: () {},
                containerColor: AppColor.scaffoldBackground)
          ],
        ),
      ),
    ));
  }
}
