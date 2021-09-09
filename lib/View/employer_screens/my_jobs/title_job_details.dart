import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/candidates.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/edit_my%20job.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_title_and_subtitle_data_job.dart';

import '../../../constants.dart';

class JobDetails extends StatelessWidget {
  static String routeId = 'JobDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            titleAppbar: 'Title Job',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Candidates.routeId),
                        text: 'Candidates',
                        backgroundColor: kSecondColor),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EditMyJob.routeId);
                        },
                        text: 'Edit',
                        backgroundColor: kSecondColor),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                        onPressed: () {},
                        text: 'Cancel',
                        backgroundColor: kSecondColor),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 10),

              /// Job Details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                          'About job Title',
                          style: TextStyle(
                              fontSize: 20,
                              color: kSecondColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),

                        /// JOb title

                        CustomTitleAndSubtitleData(
                            title: 'Job title     ', subtitle: 'Ios Developer'),

                        SizedBox(height: 10),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 10),

                        CustomTitleAndSubtitleData(
                            title: 'Job Field     ', subtitle: 'Software'),

                        SizedBox(height: 10),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 10),

                        /// details
                        CustomTitleAndSubtitleData(
                          title: ' Details      ',
                          subtitle:
                              'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
                        ),
                        SizedBox(height: 10),
                        Divider(
                          height: 10,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),

                        /// salary
                        CustomTitleAndSubtitleData(
                            title: 'salary        ', subtitle: '1000.00'),

                        SizedBox(height: 10),
                        Divider(
                          height: 10,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),

                        /// Gender
                        CustomTitleAndSubtitleData(
                            title: 'Gender        ', subtitle: 'Male'),

                        SizedBox(height: 10),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 10),

                        /// Experience
                        CustomTitleAndSubtitleData(
                            title: 'Experience   ', subtitle: '5 years'),
                        SizedBox(height: 10),
                        Divider(
                          height: 10,
                          thickness: 1,
                        ),
                        SizedBox(height: 10),

                        /// Qualification
                        CustomTitleAndSubtitleData(
                            title: 'Qualification',
                            subtitle: 'Bachelors Degree'),

                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
