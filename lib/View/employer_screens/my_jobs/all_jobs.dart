import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employee_Screens/home_employee_screen/job_title_employee.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/title_jobs_others.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';

import '../../../constants.dart';

class AllJobs extends StatelessWidget {
  static String routeId = 'AllJobs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            titleAppbar: 'Jobs',
          ),
        ),
        body: ListView(
          physics: PageScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              children: [
                /// Search widget
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 10, right: 10),
                  child: Container(
                    // width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,

                          spreadRadius: 2.0,

                          offset: Offset(1.0, 5.0),

                          // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                disabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                hintText: 'Search',
                              ),
                            ),
                          ),
                          Icon(
                            CupertinoIcons.search,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: GridView.builder(
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TitleJobsOthers.routeId,
                                arguments: true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Senawy',
                                      style: TextStyle(
                                          color: kMainColor, fontSize: 20),
                                    ),
                                    Text(
                                      'Nurse',
                                      style: TextStyle(
                                          color: kMainColor, fontSize: 15),
                                    ),

                                    ///Job description
                                    Text(
                                      'Job description goes here',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: kMainColor, fontSize: 15),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '2020/10/20',
                                          style: TextStyle(
                                              color: kMainColor, fontSize: 15),
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
                ),
              ],
            ),
          ],
        ));
  }
}
