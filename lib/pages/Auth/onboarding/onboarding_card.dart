import 'package:careguard/common/style/color.dart';
import 'package:careguard/common/widgets/button.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.text,
    required this.childIcon,
    required this.onTap,
    required this.content,
  });
  final String text;
  final String childIcon;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: AppColor.primaryBackground,
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
              ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 140),
            child: Column(
              children: [
                Container(
                  width: 307,
                  height: 334,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Image.asset("Assets/Icons/$childIcon.png"),
                ),
                SizedBox(
                  height: 42,
                ),
                Container(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColor.primaryBackground,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                LargeButton(
                    text: text,
                    color: Colors.white,
                    ontap: onTap,
                    containerColor: AppColor.primaryBackground)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
