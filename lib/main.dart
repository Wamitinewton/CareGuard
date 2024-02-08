import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/routes/pages.dart';
import 'package:careguard/pages/Auth/onboarding/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: AppRoutes.onboarding,
        getPages: AppPages.routes,
        // home: OnboardingPage(),
      ),
    );
  }
}
