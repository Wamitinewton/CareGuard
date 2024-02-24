import 'package:careguard/utils/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final HttpUtil httpUtil = HttpUtil();

  final RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(isLoggedIn, (callback) => handleAuthChanges);
  }

  void handleAuthChanges(bool loggedIn) {
    if (loggedIn) {
      // navigate user to a new page
    } else {
      // navigate user to login page
    }
  }

  Future<void> signUp(String fname, String lname, String password,
      String cfmPassword, String email) async {
    try {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(),
          status: "Authenticating...",
          maskType: EasyLoadingMaskType.clear);
      EasyLoading.dismiss();
      isLoading.value = true;

      final response = await httpUtil.dio.post('/api/signup', data: {
        fname: fname,
        lname: lname,
        password: password,
        email: email,
        cfmPassword: cfmPassword
        // 'confirmPassword': cfmPassword
      });

      isLoading.value = false;
      isLoggedIn = true.obs;
    } catch (error) {
      handleError(error);
      // EasyLoading.showError(e.toString());
      // EasyLoading.dismiss();
    }
  }

  Future<void> logOut() async {
    try {
      isLoading.value = true;
      EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        status: "Logging out....",
        maskType: EasyLoadingMaskType.clear,
      );

      await httpUtil.dio.post('api/logout');
      // replace with actual backend endpoints from the base Url.

      isLoading.value = false;
      isLoggedIn.value = false;
    } catch (error) {
      handleError(error);
    }
  }

  void handleError(dynamic error) {
    isLoading.value = false;
    isLoggedIn.value = false;

    if (error is DioException) {
      final errorEntity = httpUtil.createErrorEntity(error);

      if (errorEntity.code == 401) {
        errorMessage.value = "Invalid auth credentials. Please try again";
      } else {
        errorMessage.value = 'Error: ${errorEntity.message}';
      }
    } else {
      errorMessage.value = "Unexpected error occurred";
    }
    print("Error: ${error}");
  }
}
