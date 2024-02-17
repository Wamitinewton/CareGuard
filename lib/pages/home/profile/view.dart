import 'package:careguard/common/routes/names.dart';
import 'package:careguard/common/style/color.dart';
import 'package:careguard/pages/Auth/onboarding/controller.dart';
import 'package:careguard/pages/home/profile/profile_component.dart';
import 'package:careguard/pages/home/utils/bottombar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<OnboardingController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          'profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                color: AppColor.primaryBackground,
              )),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          ),
          Positioned(
              top: 106,
              left: 26,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('Assets/Images/wallpaper1.jpg'),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 10,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Faith Chela',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '+254729302230',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wamitifaith@love.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            top: 273,
            left: 20,
            right: 20,
            child: Container(
              width: 335,
              height: 266,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  ProfileComponent(
                    text: "Edit Profile",
                    onTap: () {
                      print("... Edit Profile...");
                    },
                  ),
                  ProfileComponent(
                    text: "Feedback",
                    onTap: () {
                      print("... Feedback ...");
                    },
                  ),
                  ProfileComponent(
                    text: "Refer a Friend",
                    onTap: () {
                      print("... Refer a Friend ...");
                    },
                  ),
                  ProfileComponent(
                    text: "Terms & Conditions",
                    onTap: () {
                      print("... Tearms & Conditions ...");
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      print("... Logout ...");
                      Get.offAllNamed(AppRoutes.signin);
                      BottomNavigationUtil.onExit();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFF33907C),
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
