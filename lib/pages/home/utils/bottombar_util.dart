import 'package:careguard/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationUtil {
  static List<BottomNavigationBarItem> getBottomNavBarItems() {
    return const [
      BottomNavigationBarItem(
          icon: Icon(Icons.emergency_outlined), label: 'Emergency'),
      BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), label: 'About us'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
    ];
  }

  static int _bottomIndex = 0;

  static void _handleTabTap(int index) {
    _bottomIndex = index;
    switch (index) {
      case 0:
        Get.offAllNamed(AppRoutes.emergency);
        break;
      case 1:
        Get.offAllNamed(AppRoutes.profile);
        break;
      case 2:
        Get.offAllNamed(AppRoutes.profile);
        break;
      case 3:
        Get.offAllNamed(AppRoutes.profile);
        break;
    }
  }

  static BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      items: getBottomNavBarItems(),
      currentIndex: _bottomIndex,
      onTap: _handleTabTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    );
  }
  static int onExit(){
   _bottomIndex = 0;
    return _bottomIndex;
  }
}
