import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTitleAndSubtitleData extends StatelessWidget {
  final String title, subtitle;

  const CustomTitleAndSubtitleData(
      {@required this.title, @required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return titleAndSubtitleData();
  }

  Widget titleAndSubtitleData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // 'Experience',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: kMainColor,
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 5,
          child: Text(
            subtitle,
            // '5 years',
            overflow: TextOverflow.visible,

            style: TextStyle(
              fontSize: 16,
              color: kMainColor,
            ),
          ),
        ),
        //     Spacer(
        //       flex: 5,
        // ),
      ],
    );
  }
}
