import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employee_Screens/home_employee_screen/job_title_employee.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';

import '../../../constants.dart';

class SavedEmployeeView extends StatelessWidget {
  static String routeId = 'SavedEmployeeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            titleAppbar: 'Saved',
          )),
      body: GridView.builder(
          padding: EdgeInsets.only(top: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, JobTitleEmployeeView.routeId,
                      arguments: true);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,

                        spreadRadius: 2.0,

                        offset: Offset(1.0, 5.0),

                        // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hospital',
                          style: TextStyle(
                              color: kMainColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Nursing Support',
                          style: TextStyle(color: kMainColor, fontSize: 15),
                        ),

                        ///Job description
                        Text(
                          'Junior',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: kMainColor, fontSize: 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2020/10/20',
                              style: TextStyle(color: kMainColor, fontSize: 15),
                            ),
                            Icon(
                              Icons.looks_5_rounded,
                              color: Colors.green,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
