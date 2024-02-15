import 'dart:math';
import 'dart:ui';

import 'package:careguard/pages/home/utils/colors.dart';
import 'package:careguard/pages/home/icon_data.dart';
import 'package:careguard/pages/home/utils/text_util.dart';
import 'package:flutter/material.dart';

class ContainerUtil {
  static Color getRandomColor() {
    return Color(Random().nextInt(0xFFFFFF) | 0xFF000000);
  }

  static int currentIconIndex = 0;
  static int currentColorIndex = 0;

  static Widget coloredContainer() {
    Color containerColor = getRandomColor();
    IconData selectedIcon = iconList[currentIconIndex];
    Color nextColor = colorList[currentColorIndex];
    String selectedText = textList[currentIconIndex];

    currentIconIndex = (currentIconIndex + 1) % iconList.length;
    currentColorIndex = (currentColorIndex + 1) % colorList.length;
    return Container(
        width: 180,
        height: 180,
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
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: ClipOval(
                  child: Icon(
                    selectedIcon,
                    size: 60,
                    color: containerColor,
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
        ));
  }
}
