import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
            style: const TextStyle(
              color: Color(0xFF4F4F4F),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
