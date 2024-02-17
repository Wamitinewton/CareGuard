import 'package:flutter/material.dart';

Widget buildContactContainer(String name, String phoneNumber) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.person,
                color: Color(0xFF2196F3),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 130),
              child: Row(
                children: [
                  Icon(
                    Icons.email_rounded,
                    color: Color(0xFFE91E63),
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.phone,
                    color: Color(0xFF9C27B0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Divider(
        height: 1,
        thickness: 1,
      )
    ],
  );
}
