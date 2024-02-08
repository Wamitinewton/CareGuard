import 'package:careguard/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputUtil extends StatelessWidget {
  // final String? Function(String?) validator;
  final TextEditingController phoneInputController = TextEditingController();
  final Rx<PhoneNumber> phoneNumber = PhoneNumber().obs;
  // PhoneInputUtil({super.key, required this.validator});

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (value) {
        phoneInputController.text;
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      ignoreBlank: true,
      autoValidateMode: AutovalidateMode.always,
      // validator: validator,
      selectorTextStyle: const TextStyle(
        color: Colors.black,
      ),
      textStyle: const TextStyle(
        color: Colors.black,
      ),
      initialValue: phoneNumber.value,
      textFieldController: phoneInputController,
      inputDecoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'phone Number'),
    );
  }
}
