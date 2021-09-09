import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/title_job_details.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';

import '../../../constants.dart';

class MyJobEmployer extends StatelessWidget {
  static String routeId = 'MyJobEmployer';
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: arg == null
            ? null
            : arg
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(80),
                    child: CustomAppBar(
                      titleAppbar: 'My Jobs',
                    ),
                  )
                : null,
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
                        return InkWell(
                          highlightColor: kSecondColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Navigator.pushNamed(context, JobDetails.routeId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
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
                                      'Dentist',
                                      style: TextStyle(
                                          color: kMainColor, fontSize: 20),
                                    ),
                                    Text(
                                      'Junior',
                                      style: TextStyle(
                                          color: kMainColor, fontSize: 17),
                                    ),
                                    Text(
                                      '2020/10/20',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
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
