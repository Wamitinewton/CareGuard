import 'package:careguard/common/style/color.dart';
import 'package:flutter/material.dart';

///
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColor.primaryBackground,
  String title = "button",
  Color fontColor = AppColor.primaryText,
  double fontSize = 16,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 16,
        )),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) &&
                !states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.deepPurple;
            }
            return fontColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[200];
          }
          return gbColor;
        }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: 1,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}

///
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 86,
  double height = 25,
  required String iconFileName,
}) {
  return SizedBox(
    width: width,
    // height: height.h,
    child: TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) &&
                !states.contains(MaterialState.pressed)) {
              return AppColor.primaryBackground;
            } else if (states.contains(MaterialState.pressed)) {
              return AppColor.primaryBackground.withOpacity(0.2);
            }
            return AppColor.scaffoldBackground;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColor.primaryBackground;
          }
          return AppColor.onlineStatus;
        }),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
      onPressed: onPressed,
      // child: Image.asset(
      //   "assets/images/icons-$iconFileName.png",
      // ),
      child: Align(
        alignment: Alignment.center,
        child: Text(iconFileName),
      ),
    ),
  );
}

class LargeButton extends StatelessWidget {
  const LargeButton({
    super.key,
    required this.text,
    required this.color,
    required this.ontap,
    required this.containerColor,
  });
  final String text;
  final Color color;
  final VoidCallback ontap;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 48,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: ShapeDecoration(
          color: containerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: -0.39,
            ),
          ),
        ),
      ),
    );
  }
}
