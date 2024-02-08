import 'package:careguard/pages/Auth/onboarding/controller.dart';
import 'package:get/get.dart';

class OnboardingBinding implements Bindings{
  @override
  void dependencies (){
    Get.lazyPut(() => OnboardingController());
  }
}