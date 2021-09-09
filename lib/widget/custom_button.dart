import 'package:flutter/material.dart';
import 'package:medical_hiring/constants.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color backgroundColor, borderColor, textColor;
  double width, height;
  CustomButton(
      {@required this.onPressed,
      @required this.text,
      @required this.backgroundColor,
      this.width,
      this.borderColor = kSecondColor,
      this.textColor = kWhiteColor,
      this.height});

  @override
  Widget build(BuildContext context) {
    final heightM = MediaQuery.of(context).size.height * 0.06;
    return Container(
      width: width,
      height: height == null ? heightM : height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
