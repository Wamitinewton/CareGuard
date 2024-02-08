import 'package:careguard/pages/Auth/otp_verification/controller.dart';
import 'package:get/get.dart';

class PhoneNumberBindings implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => PhoneNumberController());
  }
}