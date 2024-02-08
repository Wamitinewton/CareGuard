import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/button.dart';
import 'package:careguard/common/widgets/phoneinput_util.dart';
import 'package:careguard/pages/Auth/otp_verification/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatelessWidget {
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
  final TextEditingController phoneInputController = TextEditingController();
  final PhoneNumberController _numberController =
      Get.put(PhoneNumberController());
  PhoneNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.primaryBackground,
      body: Padding(
        padding: EdgeInsets.all(17),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset('Assets/Icons/mentorship.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Select your country',
                style: TextStyle(
                  color: AppColor.primaryText,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              PhoneInputUtil(),
              const SizedBox(
                height: 25,
              ),
              LargeButton(
                  text: 'Continue',
                  color: const Color.fromRGBO(51, 144, 124, 1),
                  ontap: () {
                    Get.offAllNamed(AppRoutes.otpverify);
                  },
                  containerColor: AppColor.scaffoldBackground)
            ],
          ),
        ),
      ),
    ));
  }
}
