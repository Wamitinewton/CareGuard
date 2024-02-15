import 'package:flutter/material.dart';

class DividerUtil extends StatelessWidget {
  const DividerUtil({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        color: Colors.black,
        thickness: 1.0,
      ),
    );
  }
}