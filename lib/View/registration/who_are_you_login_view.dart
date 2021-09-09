import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/registration/Employer/login_Employer.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/widget/custom_ButtonWhoAreYou.dart';

import 'Employee/loginEmployee.dart';

class WhoAreYouView extends StatelessWidget {
  static String routeId = 'WhoAreYouView';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.4,
            width: width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage(
              //         'assets/images/registration/whoAreYou.png'))
            ),
            child: Image.asset(
              'assets/images/registration/whoAreYou2.png',
              fit: BoxFit.contain,
              // height: height * 0.35,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 20),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: kMainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomButtonWhoAreYou(
                    // rightTextToLiftImage: true,
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginEmployer.routeId),
                    text: 'Employer',
                    assetsImage:
                        'assets/images/registration/EmployerButton.png',
                  ),
                  SizedBox(height: 20),
                  CustomButtonWhoAreYou(
                    rightTextToLiftImage: true,
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginEmployee.routeId),
                    //     Navigator.pushNamed(context, LoginEmployer.routeId),
                    text: 'Employee',
                    assetsImage: 'assets/images/registration/employee.png',
                  ),
                  SizedBox(height: 20),
                  CustomButtonWhoAreYou(
                    // rightTextToLiftImage: true,
                    onPressed: () {},
                    //     Navigator.pushNamed(context, LoginEmployer.routeId),
                    text: 'Guest',
                    assetsImage: 'assets/images/registration/man.png',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
