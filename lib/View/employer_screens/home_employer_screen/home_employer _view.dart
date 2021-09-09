import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employer_screens/home_employer_screen/cubit_slider/slider_cubit.dart';
import 'package:medical_hiring/View/employer_screens/home_employer_screen/cubit_slider/slider_state.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/all_jobs.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/my_jobs_employer.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/title_job_details.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/title_jobs_others.dart';
import 'package:medical_hiring/View/employer_screens/new_meeting/add_new_job.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/widget/custom_button.dart';

class HomeEmployerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderCubit(),
      child: BlocConsumer<SliderCubit, SliderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SliderCubit cubit = SliderCubit.get(context);
          return Scaffold(
            body: ListView(
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 10),
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
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.search,
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
                // SizedBox(height: 10),

                /// Slider
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(seconds: 5),
                          autoPlayInterval: Duration(seconds: 10),
                          viewportFraction: 1,
                          initialPage: 0,
                          height: 150.0,
                          onPageChanged: (index, s) {
                            cubit.changeIndex(index);
                          }),
                      items: cubit.list.map((i) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black54)),
                                  child: Center(
                                    child: Text(
                                      'text $i',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ));
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cubit.list.map((e) {
                        int index = cubit.list.indexOf(e);
                        return Container(
                          height: 8,
                          width: 8,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cubit.currentIndex == index
                                ? kMainColor
                                : Colors.black12,
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),

                /// title Hospital\'s Jobs
                Column(
                  children: [
                    /// title Hospital\'s Jobs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hospital\'s Jobs ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyJobEmployer.routeId,
                                arguments: true);
                          },
                          child: Text(
                            'View ALL',
                            style: TextStyle(
                                fontSize: 17,
                                color: kMainColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    /// List
                    Container(
                      height: 150,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            highlightColor: kSecondColor.withOpacity(0.5),
                            onTap: () => Navigator.pushNamed(
                                context, JobDetails.routeId),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 200,
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                          Text(
                                            'ios developer',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '5+ years experience',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '21-12-2021',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Closed',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      right: 20,
                                      top: 5,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: index % 2 == 0
                                            ? Colors.green
                                            : Colors.black45,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),

                /// create new job
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1.0,

                          spreadRadius: 1.0,

                          offset: Offset(5.0, 5.0),

                          // shadow direction: bottom right
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Create New job',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consetetur',
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                  // SizedBox(height: 5),
                                  Text(
                                    'sadipscing elitr, sed diam nonumy eirmod',
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: CustomButton(
                              height: 60,
                              text: 'CREATE NEW JOB',
                              onPressed: () {
                                Navigator.pushNamed(context, AddNewJob.routeId,
                                    arguments: true);
                              },
                              backgroundColor: kSecondColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                /// Jobs
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jobs',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, AllJobs.routeId);
                            },
                            child: Text(
                              'View ALL',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: GridView.builder(
                            physics: PageScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 0.1,
                            ),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, TitleJobsOthers.routeId,
                                      arguments: index);
                                },
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Spacer(),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Hospital',
                                                    style: TextStyle(
                                                        color: kMainColor,
                                                        fontSize: 20),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 25,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                'Nursing Support',
                                                style: TextStyle(
                                                    color: kMainColor,
                                                    fontSize: 15),
                                              ),

                                              ///Job description
                                              Text(
                                                'Junior',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: kMainColor,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                '2020/10/20',
                                                style: TextStyle(
                                                    color: kMainColor,
                                                    fontSize: 15),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: index % 1.5 == 0
                                              ? Colors.green
                                              : Colors.black45,
                                        )),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
