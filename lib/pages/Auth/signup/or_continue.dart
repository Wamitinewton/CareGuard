import 'package:careguard/common/style/color.dart';
import 'package:flutter/material.dart';

class AuthMethods extends StatelessWidget {
  const AuthMethods({super.key,
  required this.text,
  required this.authlogo
  });
  final String text;
  final String authlogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.only(bottom: 4, top: 4),
      decoration: BoxDecoration(
          color: AppColor.scaffoldBackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(41, 0, 0, 0),
              offset: Offset(0, 1),
              blurRadius: 0,
            ),
          ],
          border: Border.all(color: Colors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('Assets/Icons/$authlogo.png'),
              SizedBox(width: 8,),
              Text(text, style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),)
            ],
          ),
    );
  }
}
