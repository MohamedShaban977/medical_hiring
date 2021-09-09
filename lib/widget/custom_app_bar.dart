import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({@required this.titleAppbar, @required this.leading});

  final String titleAppbar;
  final Widget leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      leading: leading,
      centerTitle: true,
      title: Text(
        titleAppbar,
        style: TextStyle(fontSize: 25, color: kWhiteColor),
      ),
      backgroundColor: kMainColor,
      toolbarHeight: 80,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
