import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/routes/observers.dart';
import 'package:careguard/pages/Auth/login/bindings.dart';
import 'package:careguard/pages/Auth/login/view.dart';
import 'package:careguard/pages/Auth/onboarding/binding.dart';
import 'package:careguard/pages/Auth/onboarding/view.dart';
import 'package:careguard/pages/Auth/otp_verification/binding.dart';
import 'package:careguard/pages/Auth/otp_verification/verification.dart';
import 'package:careguard/pages/Auth/otp_verification/view.dart';
import 'package:careguard/pages/Auth/signup/binding.dart';
import 'package:careguard/pages/Auth/signup/view.dart';
import 'package:careguard/pages/home/application/binding.dart';
import 'package:careguard/pages/home/application/home_screen.dart';
import 'package:careguard/pages/home/profile/binding.dart';
import 'package:careguard/pages/home/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.onboarding;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.signup,
        page: () => SignUpScreen(),
        binding: SignupBinding()),
    GetPage(
        name: AppRoutes.signin,
        page: () => SigninScreen(),
        binding: SigninBinding()),
    GetPage(
        name: AppRoutes.inputphone,
        page: () => PhoneNumberInput(),
        binding: PhoneNumberBindings()),
    GetPage(
        name: AppRoutes.otpverify,
        page: () => VerificationScreen(),
        binding: PhoneNumberBindings()),
    GetPage(
      name: AppRoutes.homescreen,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    )
  ];
}
