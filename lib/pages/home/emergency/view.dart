import 'package:careguard/common/style/color.dart';
import 'package:careguard/pages/home/emergency/container_util.dart';
import 'package:careguard/pages/home/emergency/emergency_component.dart';
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hey Newton',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primaryText),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'How can we help you?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primaryBackground),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
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
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Emergency Contacts',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildContactContainer('Officer 1', '+254726076806'),
            const SizedBox(
              height: 15,
            ),
            buildContactContainer('Officer 2', '+254726076806'),
            const SizedBox(
              height: 15,
            ),
            buildContactContainer('Meru Hospital', '+254726076806'),
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
