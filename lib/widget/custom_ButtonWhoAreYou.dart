import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButtonWhoAreYou extends StatelessWidget {
  CustomButtonWhoAreYou(
      {@required this.text,
        @required this.assetsImage,
        @required this.onPressed,
        this.rightTextToLiftImage = false});

  final String text, assetsImage;

  final Function onPressed;
  final bool rightTextToLiftImage;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.11,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40),
        child: TextButton(
          onPressed: onPressed,
          //     () {
          //   Navigator.pushNamed(context, LoginEmployer.routeId);
          // },
          child: rightTextToLiftImage
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: kMainColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(assetsImage
                // 'assets/images/registration/EmployerButton.png',
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetsImage
                // 'assets/images/registration/EmployerButton.png',
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: kMainColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}