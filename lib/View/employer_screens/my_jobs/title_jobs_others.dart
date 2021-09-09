import 'package:flutter/material.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_title_and_subtitle_data_job.dart';
import 'package:share/share.dart';

import '../../../constants.dart';

class TitleJobsOthers extends StatelessWidget {
  static String routeId = 'TitleJobsOthers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          titleAppbar: 'TitleJobs Others',
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
                            'About Company',
                            style: TextStyle(
                                fontSize: 20,
                                color: kSecondColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),

                          /// name company
                          CustomTitleAndSubtitleData(
                            title: 'Name\t\t\t',
                            subtitle: 'Algorithm',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// address
                          CustomTitleAndSubtitleData(
                            title: 'Address',
                            subtitle: 'Cairo - Egypt',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),
                          CustomTitleAndSubtitleData(
                            title: 'Start From',
                            subtitle: '2015',
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
                            'About job Title',
                            style: TextStyle(
                                fontSize: 20,
                                color: kSecondColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),

                          /// JOb title
                          CustomTitleAndSubtitleData(
                            title: 'Job title',
                            subtitle: 'IOS Developer',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// details
                          CustomTitleAndSubtitleData(
                            title: 'Details',
                            subtitle:
                                'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et doloreLorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 2,
                          ),
                          SizedBox(height: 10),

                          /// salary
                          CustomTitleAndSubtitleData(
                            title: 'Start From',
                            subtitle: '2015',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
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
                            'Meeting Details',
                            style: TextStyle(
                                fontSize: 20,
                                color: kSecondColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),

                          /// Meeting date
                          CustomTitleAndSubtitleData(
                            title: 'Meeting date',
                            subtitle: '2-2-2020',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// Meeting time
                          CustomTitleAndSubtitleData(
                            title: 'Meeting time',
                            subtitle: '9:00 am - 12:00 pm',
                          ),

                          SizedBox(height: 10),
                          Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          SizedBox(height: 10),

                          /// Note
                          CustomTitleAndSubtitleData(
                            title: 'Note\t\t\t\t\t\t',
                            subtitle:
                                'You can join online meeting when your cv accepted by HR',
                          ),

                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  CustomButton(
                      width: MediaQuery.of(context).size.width * 0.5,
                      onPressed: () {
                        Share.share('');
                      },
                      text: 'SHARE',
                      backgroundColor: kSecondColor),
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
}
