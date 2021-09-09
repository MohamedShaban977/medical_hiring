import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/widget/custom_button.dart';

import '../../../constants.dart';

class ProfileEmployeeAccept extends StatelessWidget {
  static String routeId = 'ProfileEmployeeAccept';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.15,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: height * 0.12,
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(50))),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // SizedBox(width: width * 0.15),
                        Container(
                          width: width * 0.3,
                          height: height * 0.15,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.network(
                            'https://as2.ftcdn.net/v2/jpg/01/37/44/03/1000_F_137440378_5mMBNu4Xyxaj25zD8Ag8NQWsOkYKDeq8.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Johan Doe',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              'Egypt - Cairo',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade300),
                            ),
                            SizedBox(height: height * 0.05),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                SizedBox(width: width * 0.05),
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Accept',
                    backgroundColor: kSecondColor,
                  ),
                ),
                SizedBox(width: width * 0.05),
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Reject',
                    backgroundColor: kWhiteColor,
                    borderColor: kSecondColor,
                    textColor: kSecondColor,
                  ),
                ),
                SizedBox(width: width * 0.05),
              ],
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// Date of birth
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '09/09/1987',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                  SizedBox(height: height * 0.03),

                  /// industry
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Industry',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Engineering',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'SoftWare engineer',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Qualification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Qualification',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Bachelors Degree',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Experience Years
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Experience Years',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '3+',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Gender
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Male',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
