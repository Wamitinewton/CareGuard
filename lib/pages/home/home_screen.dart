import 'dart:math';

import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/container_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Color getRandomColor() {
  //   return Color(Random().nextInt(0xFFFFFF) | 0xFF000000);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.primaryBackground,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Get.offAllNamed(AppRoutes.signup);
            },
            child: Icon(Icons.arrow_back_ios)),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Center(child: Text('CareGuard')),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
        // actions: [
        //   Text('Hello world')
        // ],
      ),

      body: Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerUtil.coloredContainer(),
                    ContainerUtil.coloredContainer(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
