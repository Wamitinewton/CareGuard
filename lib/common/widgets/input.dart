import 'package:careguard/common/style/color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

///
Widget inputTextEdit({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
  Widget? preffix,
  Widget? suffix,
}) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: const BoxDecoration(
      color: AppColor.borderColor,
      borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefix: preffix,
        suffix: suffix,
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColor.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      maxLines: 1,
      autocorrect: false, //
      obscureText: isPassword, //
    ),
  );
}

bool isPasswordVisible = false;
Widget inputEmailEdit({
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  // double marginTop =15,
  bool autofocus = false,
  Widget? preffix,
  Widget? suffix,
  bool obscureText = false,
}) {
  return Container(
    height: 48.h,
    margin: EdgeInsets.symmetric(horizontal: 32.w),
    padding: EdgeInsets.only(bottom: 8.h),
    decoration: BoxDecoration(
      color: AppColor.primaryBackground,
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      obscureText: obscureText,
        autofocus: autofocus,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: preffix,
          suffixIcon: suffix,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w100,
            fontSize: 16.sp,
          ),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
          border: InputBorder.none,
          // hintStyle: TextStyle(
          //   color: AppColors.primaryText,
          // ),
        ),
        style: TextStyle(
          color: AppColor.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        maxLines: 1,
        autocorrect: false, //
        ),
  );
}
