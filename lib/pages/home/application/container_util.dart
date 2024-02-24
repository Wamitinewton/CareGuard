import 'dart:math';
import 'dart:ui';

import 'package:careguard/common/routes/names.dart';
import 'package:careguard/pages/home/utils/colors.dart';
import 'package:careguard/pages/home/utils/icon_data.dart';
import 'package:careguard/pages/home/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUtil {
  static Color getRandomColor() {
    return Color(Random().nextInt(0xFFFFFF) | 0xFF000000);
  }

  static int currentIconIndex = 0;
  static int currentColorIndex = 0;
  static int _selectedIndex = 0;
  static IconData selectedIcon = iconList[currentIconIndex];

  static Widget coloredContainer() {
    Color containerColor = getRandomColor();
    IconData selectedIcon = iconList[currentIconIndex];
    Color nextColor = colorList[currentColorIndex];
     String selectedText = textList[currentIconIndex];

    currentIconIndex = (currentIconIndex + 1) % iconList.length;
    currentColorIndex = (currentColorIndex + 1) % colorList.length;
    return GestureDetector(
      onTap: () => _handleContainerTap(_selectedIndex),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
        child: Container(
            width: 155,
            height: 170,
            decoration: BoxDecoration(
              color: nextColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, right: 55, left: 55),
                  child: Container(
                    // width: 30,
                    // height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: ClipOval(
                      child: Icon(
                        selectedIcon,
                        size: 40,
                        color: nextColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    selectedText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }

  static _handleContainerTap(int selectedIcon) {
    _selectedIndex = selectedIcon;
    switch (selectedIcon) {
      case 0:
        Get.offAllNamed(AppRoutes.emergency);
       
      case 1:
        Get.snackbar('hey', 'I love Faith',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 2:
        Get.snackbar('Hey', 'I am a programmer',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 3:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 4:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 5:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 7:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 8:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 9:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       
      case 10:
        Get.snackbar('title', 'message',
            snackPosition: SnackPosition.TOP,
            showProgressIndicator: true,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeInCirc,
            backgroundColor: Colors.blue,
            colorText: Colors.black);
       

      default:
        Get.snackbar('title', 'message');
    }
  }
}
