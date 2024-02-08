import 'package:get/get.dart';

import '../../../common/routes/names.dart';


class OnboardingController extends GetxController {
  

  @override
  void onInit() {
    // It is the perfect place to enter navigation events, like snackbar, dialogs, or a new route, or async request.
    super.onInit();
    print('OnboardingController');
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Get.offAllNamed(
    //     AppRoutes.signup,
    //   ),
    // );
  }

  void goToSignUp() {
    Get.offAllNamed(
      AppRoutes.signup,
    );
  }
}
