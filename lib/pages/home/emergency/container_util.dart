import 'package:careguard/common/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerUtility extends StatelessWidget {
  const ContainerUtility({super.key, required this.text, required this.icon, required this.color});
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(10),
      width: 155,
      height: 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ]
      ),
      child: Column(
        children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          child: ClipOval(child: Icon(icon, size: 40, color: Color(0xFFE91E63),))),
          SizedBox(height: 7,),
          Text(text, style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
        ],
      ),
    );
  }
}
