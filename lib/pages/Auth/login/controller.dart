import 'package:careguard/utils/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final HttpUtil httpUtil = HttpUtil();
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    ever(isLoggedIn, (callback) => handleAuthChanges);
  }

  void handleAuthChanges(bool loggedIn) {
    if (loggedIn) {
      // handle cases where the user might already be logged in
      //eg, navigate them to a new page.
    } else {}
  }

  Future<void> signIn( String email, String password) async {
    try {
      isLoading.value = true;
      EasyLoading.show(
          indicator: const CircularProgressIndicator(),
          status: "Logging you in...",
          maskType: EasyLoadingMaskType.clear);
      final response = await httpUtil.dio.post('api/login',
          // replace with actual backend Url end point.
          data: {email: email, password: password});

      isLoading.value = false;
      isLoggedIn.value = true;
      EasyLoading.dismiss();
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
