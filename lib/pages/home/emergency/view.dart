import 'package:careguard/common/style/color.dart';
import 'package:careguard/pages/home/emergency/container_util.dart';
import 'package:careguard/pages/home/utils/bottombar_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Hey Newton',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryText),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'How can we help you?',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryBackground),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ContainerUtility(
                    text: 'Hospital',
                    icon: Icons.local_hospital_rounded,
                    color: Color(0xFF2196F3)),
                ContainerUtility(
                    text: 'Officer',
                    icon: Icons.local_police_outlined,
                    color: Color(0xFFFFC107)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Emergency Contacts', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,

                  ),),
                )
              ],
            )
          ],
        )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: BottomNavigationUtil.buildBottomBar(),
        ),
      ),
    );
  }
}
