import 'package:careguard/pages/home/emergency/controller.dart';
import 'package:get/get.dart';

class EmergencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmergencyController());
  }
}
