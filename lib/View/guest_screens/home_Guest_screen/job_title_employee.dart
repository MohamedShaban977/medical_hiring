import 'package:flutter/material.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:share/share.dart';

class JobTitleEmployeeView extends StatelessWidget {
  static String routeId = 'JobTitleEmployeeView';
  @override
  Widget build(BuildContext context) {
    final bool arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          titleAppbar: 'IOS developer',
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Stack(
            children: [
              Column(
                // physics: PageScrollPhysics(),
                // shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  /// Company Details

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,

                            spreadRadius: 2.0,

                            offset: Offset(1.0, 5.0),

                            // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Company Details',
                            style: TextStyle(
                                fontSize: 20,
                                color: kSecondColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),

                          /// name company
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'El-Madina',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// address
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Cairo - Egypt',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Start From',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '2015',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  /// Job Details
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5.0,

                            spreadRadius: 2.0,

                            offset: Offset(1.0, 5.0),

                            // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'Job Details',
                            style: TextStyle(
                                fontSize: 20,
                                color: kSecondColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),

                          /// JOb title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Job title',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Nurse',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// details
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text(
                                  'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 2,
                          ),
                          SizedBox(height: 10),

                          /// salary
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Salary',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '10.000',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// Gender
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// Qualification
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Qualification',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Bachelors Degree',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kMainColor,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustomButton(
                            onPressed: () {
                              Share.share('');
                            },
                            text: 'SHARE',
                            backgroundColor: kSecondColor),
                      ),
                      SizedBox(width: 10),
                      arg
                          ? Expanded(
                              child: CustomButton(
                                  onPressed: () {
                                    alertDialog(context);
                                  },
                                  text: 'Enroll',
                                  textColor: kSecondColor,
                                  backgroundColor: kWhiteColor),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: kMainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void alertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/images/enroll.png',
              fit: BoxFit.cover,
            ),
            Spacer(),
            Text(
              'You have enrolled successfully',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: kSecondColor, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ok',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
