import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/cubit_candidates/cubit_candidates.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/cubit_candidates/state_candidates.dart';

import 'package:medical_hiring/View/employer_screens/profile/profile_employee_accept.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/custom_button.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../../constants.dart';

class Candidates extends StatefulWidget {
  static String routeId = 'Candidates';

  @override
  _CandidatesState createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  var selectCity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandidatesCubit(),
      child: BlocConsumer<CandidatesCubit, CandidatesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CandidatesCubit cubit = CandidatesCubit.get(context);
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                titleAppbar: 'Job Title',
                leading: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back)),
              ),
            ),
            body: ModalProgressHUD(
              inAsyncCall: state is CandidatesLoading,
              child: SingleChildScrollView(
                physics: PageScrollPhysics(),
                child: Column(
                  children: [
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
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          )),
                                      enabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          )),
                                      disabledBorder: UnderlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          )),
                                      focusedBorder: UnderlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          )),
                                      errorBorder: UnderlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          )),
                                      hintText: 'Search',
                                      hintStyle: TextStyle(fontSize: 20)),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.search,
                                size: 30,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => buildAlertDialog());
                                },
                                child: Container(
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: kSecondColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.line_horizontal_3_decrease,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 100,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(width: 10),
                              CustomButton(
                                onPressed: () async {
                                  cubit.changeToAll();
                                },
                                text: 'All',
                                width: 100,
                                backgroundColor:
                                cubit.all ? kSecondColor : kWhiteColor,
                                textColor:
                                cubit.all ? kWhiteColor : kSecondColor,
                              ),
                              SizedBox(width: 20),
                              CustomButton(
                                onPressed: () async {
                                  cubit.changeToNeedToConfirm();
                                },
                                text: 'Need to Confirm',
                                backgroundColor: cubit.needToConfirm
                                    ? kSecondColor
                                    : kWhiteColor,
                                textColor: cubit.needToConfirm
                                    ? kWhiteColor
                                    : kSecondColor,
                                width: 100,
                              ),
                              SizedBox(width: 20),
                              CustomButton(
                                onPressed: () async {
                                  cubit.changeToAccepted();
                                },
                                text: 'Accepted',
                                backgroundColor:
                                cubit.accepted ? kSecondColor : kWhiteColor,
                                textColor:
                                cubit.accepted ? kWhiteColor : kSecondColor,
                                width: 100,
                              ),
                              SizedBox(width: 20),
                              CustomButton(
                                onPressed: () async {
                                  cubit.changeToRejected();
                                },
                                text: 'Rejected',
                                backgroundColor:
                                cubit.rejected ? kSecondColor : kWhiteColor,
                                textColor:
                                cubit.rejected ? kWhiteColor : kSecondColor,
                                width: 100,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        )),
                    Container(
                      child: GridView.builder(
                          physics: PageScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.6,
                            crossAxisCount: 2,
                          ),
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: kSecondColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProfileEmployeeAccept.routeId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  clipBehavior: Clip.antiAlias,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'https://as2.ftcdn.net/v2/jpg/01/37/44/03/1000_F_137440378_5mMBNu4Xyxaj25zD8Ag8NQWsOkYKDeq8.jpg',
                                          fit: BoxFit.fill,
                                          height: 200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mr Bojangles',
                                              style: TextStyle(
                                                  color: kMainColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15),
                                            Text(
                                              'Cairo , Egypt',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '5 Years Experience',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '12-2 9:00 am',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 17),
                                            ),
                                            SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  StatefulBuilder buildAlertDialog() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) =>
          AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
            content: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Adobe XD layer: 'title (1)' (group)
                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   child: Stack(
                            //     children: <Widget>[
                            //       Pinned.fromPins(
                            //         Pin(size: 10.0, start: 3.0),
                            //         Pin(size: 3.0, middle: 0.4211),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 10.0 3.0" ><path transform="translate(-3.0, -9.0)" d="M 12.25 12 C 11.83600044250488 12 11.5 11.66399955749512 11.5 11.25 L 11.5 10.5 L 4.5 10.5 L 4.5 11.25 C 4.5 11.66399955749512 4.164000034332275 12 3.75 12 C 3.335999965667725 12 3 11.66399955749512 3 11.25 L 3 9.75 C 3 9.336000442504883 3.335999965667725 9 3.75 9 L 12.25 9 C 12.66399955749512 9 13 9.336000442504883 13 9.75 L 13 11.25 C 13 11.66399955749512 12.66399955749512 12 12.25 12 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 2, middle: 0.2222),
                            //         Pin(size: 10, middle: 0.55),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 1.5 9.5" ><path transform="translate(-7.25, -9.25)" d="M 8 18.75 C 7.585999965667725 18.75 7.25 18.41399955749512 7.25 18 L 7.25 10 C 7.25 9.586000442504883 7.585999965667725 9.25 8 9.25 C 8.413999557495117 9.25 8.75 9.586000442504883 8.75 10 L 8.75 18 C 8.75 18.41399955749512 8.413999557495117 18.75 8 18.75 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 7.0, middle: 0.2),
                            //         Pin(size: 2, middle: 0.7549),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 4.0 1.5" ><path transform="translate(-6.0, -17.5)" d="M 9.25 19 L 6.75 19 C 6.335999965667725 19 6 18.66399955749512 6 18.25 C 6 17.83600044250488 6.335999965667725 17.5 6.75 17.5 L 9.25 17.5 C 9.663999557495117 17.5 10 17.83600044250488 10 18.25 C 10 18.66399955749512 9.663999557495117 19 9.25 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 10.0, end: 3.0),
                            //         Pin(size: 2, middle: 0.3902),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 6.0 1.5" ><path transform="translate(-15.0, -9.0)" d="M 20.25 10.5 L 15.75 10.5 C 15.33600044250488 10.5 15 10.16399955749512 15 9.75 C 15 9.336000442504883 15.33600044250488 9 15.75 9 L 20.25 9 C 20.66399955749512 9 21 9.336000442504883 21 9.75 C 21 10.16399955749512 20.66399955749512 10.5 20.25 10.5 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 10.0, end: 3.0),
                            //         Pin(size: 2, middle: 0.5854),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 6.0 1.5" ><path transform="translate(-15.0, -13.0)" d="M 20.25 14.5 L 15.75 14.5 C 15.33600044250488 14.5 15 14.16399955749512 15 13.75 C 15 13.33600044250488 15.33600044250488 13 15.75 13 L 20.25 13 C 20.66399955749512 13 21 13.33600044250488 21 13.75 C 21 14.16399955749512 20.66399955749512 14.5 20.25 14.5 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 10.0, end: 3.0),
                            //         Pin(size: 2.0, middle: 0.7805),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 6.0 1.5" ><path transform="translate(-15.0, -17.0)" d="M 20.25 18.5 L 15.75 18.5 C 15.33600044250488 18.5 15 18.16399955749512 15 17.75 C 15 17.33600044250488 15.33600044250488 17 15.75 17 L 20.25 17 C 20.66399955749512 17 21 17.33600044250488 21 17.75 C 21 18.16399955749512 20.66399955749512 18.5 20.25 18.5 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(start: 0.0, end: 0.0),
                            //         Pin(start: 0.0, end: 0.0),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 24.0 22.0" ><path transform="translate(0.0, -1.0)" d="M 21.25 23 L 2.75 23 C 1.233000040054321 23 0 21.76700019836426 0 20.25 L 0 3.75 C 0 2.233000040054321 1.233000040054321 1 2.75 1 L 21.25 1 C 22.76700019836426 1 24 2.233000040054321 24 3.75 L 24 20.25 C 24 21.76700019836426 22.76700019836426 23 21.25 23 Z M 2.75 2.5 C 2.060999870300293 2.5 1.5 3.060999870300293 1.5 3.75 L 1.5 20.25 C 1.5 20.93899917602539 2.060999870300293 21.5 2.75 21.5 L 21.25 21.5 C 21.93899917602539 21.5 22.5 20.93899917602539 22.5 20.25 L 22.5 3.75 C 22.5 3.060999870300293 21.93899917602539 2.5 21.25 2.5 L 2.75 2.5 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(start: 0.0, end: 0.0),
                            //         Pin(size: 1.5, middle: 0.1707),
                            //         child: Stack(
                            //           children: <Widget>[
                            //             Pinned.fromPins(
                            //               Pin(start: 0.0, end: 0.0),
                            //               Pin(start: 0.0, end: 0.0),
                            //               child: SvgPicture.string(
                            //                 '<svg viewBox="0.0 0.0 24.0 1.5" ><path transform="translate(0.0, -4.5)" d="M 23.25 6 L 0.75 6 C 0.335999995470047 6 0 5.664000034332275 0 5.25 C 0 4.835999965667725 0.335999995470047 4.5 0.75 4.5 L 23.25 4.5 C 23.66399955749512 4.5 24 4.835999965667725 24 5.25 C 24 5.664000034332275 23.66399955749512 6 23.25 6 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //                 allowDrawingOutsideViewBox: true,
                            //                 fit: BoxFit.fill,
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Image.asset(
                              'assets/images/filter/title.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Title',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // Adobe XD layer: 'germany' (group)

                          children: [
                            // Container(
                            //   height: 40,
                            //   width: 30,
                            //   child: Stack(
                            //     children: <Widget>[
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.4171),
                            //         Pin(size: 1.0, middle: 0.712),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="65.6 21.2 1.0 1.0" ><path transform="translate(-149.91, -330.83)" d="M 215.5 352.0000305175781 L 216.46240234375 352.0000305175781 L 216.46240234375 352.9022827148438 L 215.5 352.9022827148438 L 215.5 352.0000305175781 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5008),
                            //         Pin(size: 1.0, middle: 0.712),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="67.5 21.2 1.0 1.0" ><path transform="translate(-179.98, -330.83)" d="M 247.5 352.0000305175781 L 248.46240234375 352.0000305175781 L 248.46240234375 352.9022827148438 L 247.5 352.9022827148438 L 247.5 352.0000305175781 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5845),
                            //         Pin(size: 1.0, middle: 0.712),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="69.4 21.2 1.0 1.0" ><path transform="translate(-210.06, -330.83)" d="M 279.5 352.0000305175781 L 280.46240234375 352.0000305175781 L 280.46240234375 352.9022827148438 L 279.5 352.9022827148438 L 279.5 352.0000305175781 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(start: 0.0, end: 0.0),
                            //         Pin(start: 0.0, end: 0.0),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="56.0 0.0 24.0 30.7" ><path transform="translate(0.0, 0.0)" d="M 78.63530731201172 13.17383003234863 C 77.77143096923828 11.52546977996826 76.514404296875 10.0784330368042 75.00030517578125 8.989230155944824 L 74.47338104248047 9.721619606018066 C 75.53208923339844 10.48330402374268 76.45455169677734 11.43416023254395 77.18712615966797 12.51133441925049 L 74.15891265869141 12.51133441925049 C 73.86923217773438 11.71169376373291 73.52144622802734 10.96432685852051 73.11856079101562 10.28414630889893 C 73.85401153564453 8.85960578918457 74.22556304931641 7.501831531524658 74.22556304931641 6.225561618804932 C 74.22556304931641 2.792780637741089 71.43278503417969 -6.264849616854917e-08 68 -6.264849616854917e-08 C 64.56722259521484 -6.264849616854917e-08 61.77443695068359 2.792780637741089 61.77443695068359 6.225561618804932 C 61.77443695068359 7.501831531524658 62.1459846496582 8.85960578918457 62.88150405883789 10.28408622741699 C 62.47861480712891 10.96432685852051 62.13082504272461 11.71163463592529 61.84114074707031 12.51127338409424 L 58.81293487548828 12.51127338409424 C 59.54550552368164 11.43410110473633 60.46796798706055 10.48324394226074 61.52667617797852 9.721560478210449 L 60.99975967407227 8.989170074462891 C 59.48565292358398 10.07837295532227 58.22869110107422 11.52540969848633 57.36475372314453 13.1737699508667 C 56.47193908691406 14.87728881835938 56.00000381469727 16.80095672607422 56.00000381469727 18.73683547973633 C 56.00000381469727 25.35367584228516 61.38315963745117 30.73683166503906 68 30.73683166503906 C 74.61684417724609 30.73683166503906 80 25.35367584228516 80 18.73683547973633 C 80 16.80095672607422 79.52806854248047 14.87728691101074 78.63530731201172 13.17383003234863 Z M 67.54887390136719 29.80576133728027 C 66.08313751220703 29.61887550354004 64.70423889160156 28.52413940429688 63.6259880065918 26.67577743530273 C 63.31711578369141 26.14627456665039 63.04301071166992 25.5723819732666 62.8056526184082 24.9623966217041 L 67.54887390136719 24.9623966217041 L 67.54887390136719 29.80576133728027 Z M 68.45112609863281 29.80576133728027 L 68.45112609863281 24.9623966217041 L 73.19434356689453 24.9623966217041 C 72.95699310302734 25.57244300842285 72.68288421630859 26.14627647399902 72.3740234375 26.67577743530273 C 71.29575347900391 28.52413940429688 69.9168701171875 29.61887550354004 68.45112609863281 29.80576133728027 Z M 68.45112609863281 24.06014060974121 L 68.45112609863281 23.06766128540039 L 67.54887390136719 23.06766128540039 L 67.54887390136719 24.06014060974121 L 62.48974609375 24.06014060974121 C 62.02369689941406 22.57460975646973 61.75915908813477 20.91698265075684 61.71988296508789 19.18796157836914 L 67.54887390136719 19.18796157836914 L 67.54887390136719 20.18044281005859 L 68.45112609863281 20.18044281005859 L 68.45112609863281 19.18796157836914 L 74.28012084960938 19.18796157836914 C 74.24083709716797 20.91698265075684 73.97630310058594 22.57460975646973 73.51025390625 24.06014060974121 L 68.45112609863281 24.06014060974121 Z M 56.91218185424805 19.18796157836914 L 60.81744384765625 19.18796157836914 C 60.85491561889648 20.90387153625488 61.10502624511719 22.55770683288574 61.54730987548828 24.06014060974121 L 58.26484298706055 24.06014060974121 C 57.46478271484375 22.60281944274902 56.98291778564453 20.94748306274414 56.91218185424805 19.18796157836914 Z M 64.99645233154297 13.41352844238281 C 66.10298156738281 14.75037002563477 67.15446472167969 15.71091175079346 67.54887390136719 16.0565357208252 L 67.54887390136719 18.28570938110352 L 61.72011947631836 18.28570938110352 C 61.76054000854492 16.57148361206055 62.03007507324219 14.90375423431396 62.49581527709961 13.41352844238281 L 64.99645233154297 13.41352844238281 Z M 71.00354766845703 13.41352844238281 L 73.50418090820312 13.41352844238281 C 73.96992492675781 14.90375423431396 74.23946380615234 16.57148361206055 74.27987670898438 18.28570938110352 L 68.45112609863281 18.28570938110352 L 68.45112609863281 16.0565357208252 C 68.84553527832031 15.71091175079346 69.89701843261719 14.75037002563477 71.00354766845703 13.41352844238281 Z M 75.18254852294922 19.18796157836914 L 79.08782196044922 19.18796157836914 C 79.01708221435547 20.94748306274414 78.53521728515625 22.60281944274902 77.73515319824219 24.06014060974121 L 74.45262908935547 24.06014060974121 C 74.89491271972656 22.55770683288574 75.14508056640625 20.90387153625488 75.18254852294922 19.18796157836914 Z M 77.73882293701172 13.41352844238281 C 77.77149200439453 13.47313785552979 77.8045654296875 13.53250598907471 77.83615112304688 13.59271717071533 C 78.59211730957031 15.03506183624268 79.0205078125 16.64871597290039 79.08739471435547 18.28570938110352 L 75.18254852294922 18.28570938110352 C 75.14537811279297 16.56378173828125 74.89594268798828 14.91253662109375 74.45455169677734 13.41352844238281 L 77.73882293701172 13.41352844238281 Z M 73.19019317626953 12.51127338409424 L 71.71151733398438 12.51127338409424 C 72.03897857666016 12.0701904296875 72.33467102050781 11.63428115844727 72.59855651855469 11.20402526855469 C 72.81497955322266 11.61515426635742 73.0126953125 12.05220603942871 73.19019317626953 12.51127338409424 Z M 68 0.9022552967071533 C 70.93527221679688 0.9022552967071533 73.32331085205078 3.290284395217896 73.32331085205078 6.225561618804932 C 73.32331085205078 10.16330432891846 69.14796447753906 14.21070194244385 67.99981689453125 15.24895858764648 C 66.85131072998047 14.21142387390137 62.67668914794922 10.16799640655518 62.67668914794922 6.225561618804932 C 62.67668914794922 3.290284395217896 65.06472015380859 0.9022552967071533 68 0.9022552967071533 Z M 63.40143966674805 11.20402526855469 C 63.66532135009766 11.63428115844727 63.96101760864258 12.07013130187988 64.28848266601562 12.51127338409424 L 62.80979919433594 12.51127338409424 C 62.9873046875 12.05220603942871 63.18502044677734 11.61515426635742 63.40143966674805 11.20402526855469 Z M 58.16390991210938 13.59271717071533 C 58.19542694091797 13.53256702423096 58.22850799560547 13.47313785552979 58.26123046875 13.41352844238281 L 61.54550170898438 13.41352844238281 C 61.10411834716797 14.91253662109375 60.85467147827148 16.56378173828125 60.81750106811523 18.28570938110352 L 56.91260528564453 18.28570938110352 C 56.97948837280273 16.64871597290039 57.40787887573242 15.03506183624268 58.16390991210938 13.59271717071533 Z M 58.8175048828125 24.9623966217041 L 61.84318542480469 24.9623966217041 C 62.12420654296875 25.73923683166504 62.45954513549805 26.46687698364258 62.84667205810547 27.13045501708984 C 63.35224151611328 27.99710273742676 63.92360687255859 28.71842765808105 64.543212890625 29.28263473510742 C 62.19133377075195 28.50982475280762 60.18375778198242 26.97117805480957 58.8175048828125 24.9623966217041 Z M 71.45677947998047 29.28263473510742 C 72.07638549804688 28.71842765808105 72.64775848388672 27.99710273742676 73.1533203125 27.13045501708984 C 73.54038238525391 26.46687698364258 73.87572479248047 25.73923683166504 74.15680694580078 24.9623966217041 L 77.1824951171875 24.9623966217041 C 75.81623840332031 26.97117805480957 73.80865478515625 28.50982475280762 71.45677947998047 29.28263473510742 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 8.6, middle: 0.5),
                            //         Pin(size: 8.6, start: 1.9),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="63.7 1.9 8.6 8.6" ><path transform="translate(-120.3, -30.08)" d="M 192.6015014648438 36.30075073242188 C 192.6015014648438 33.9293212890625 190.6721801757812 32 188.3007507324219 32 C 185.9293212890625 32 184 33.9293212890625 184 36.30075073242188 C 184 38.67218017578125 185.9293212890625 40.60149765014648 188.3007507324219 40.60149765014648 C 190.6721801757812 40.60149765014648 192.6015014648438 38.67218017578125 192.6015014648438 36.30075073242188 Z M 188.3007507324219 32.90225601196289 C 189.4736938476562 32.90225601196289 190.5096435546875 33.49961090087891 191.1206665039062 34.40601348876953 L 185.4808502197266 34.40601348876953 C 186.0918579101562 33.49961090087891 187.1278228759766 32.90225601196289 188.3007507324219 32.90225601196289 Z M 185.0504760742188 35.30826568603516 L 191.5510406494141 35.30826568603516 C 191.6471557617188 35.62237548828125 191.6992340087891 35.95554733276367 191.6992340087891 36.30075073242188 C 191.6992340087891 36.64595413208008 191.6471557617188 36.9791259765625 191.5510406494141 37.29323196411133 L 185.0504760742188 37.29323196411133 C 184.954345703125 36.9791259765625 184.9022521972656 36.64595413208008 184.9022521972656 36.30075073242188 C 184.9022521972656 35.95554733276367 184.954345703125 35.62237548828125 185.0504760742188 35.30826568603516 Z M 185.4808502197266 38.19548797607422 L 191.1206665039062 38.19548797607422 C 190.5096435546875 39.10189056396484 189.4736938476562 39.69924545288086 188.3007507324219 39.69924545288086 C 187.1278228759766 39.69924545288086 186.0918579101562 39.10189056396484 185.4808502197266 38.19548797607422 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Image.asset(
                              'assets/images/filter/country.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Country',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Adobe XD layer: 'buildings' (group)
                            // Container(
                            //   width: 30,
                            //   height: 40,
                            //   child: Stack(
                            //     children: <Widget>[
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         Pin(size: 3.6, end: 1.8),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="18.8 23.3 1.0 3.6" ><path transform="translate(-22.17, -27.72)" d="M 41 51 L 41.89129257202148 51 L 41.89129257202148 54.56517791748047 L 41 54.56517791748047 L 41 51 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 3.6, end: 1.8),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 23.3 1.0 3.6" ><path transform="translate(-24.39, -27.72)" d="M 45.00000381469727 51 L 45.89129638671875 51 L 45.89129638671875 54.56517791748047 L 45.00000381469727 54.56517791748047 L 45.00000381469727 51 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(start: 0.0, end: 0.0),
                            //         Pin(start: 0.0, end: 0.0),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="1.0 2.8 25.8 25.8" ><path transform="translate(0.0, 1.78)" d="M 23.51237106323242 15.58718395233154 L 23.51237106323242 6.83654260635376 L 22.67858123779297 6.83654260635376 L 22.67858123779297 2.592127561569214 L 21.84478950500488 2.730953931808472 L 21.84478950500488 1.833794116973877 L 21.0109977722168 1.833794116973877 L 21.0109977722168 2.870197296142578 L 20.17720413208008 3.009023427963257 L 20.17720413208008 1.000002861022949 L 19.34341239929199 1.000002861022949 L 19.34341239929199 3.148266553878784 L 18.50962066650391 3.287092924118042 L 18.50962066650391 1.833794355392456 L 17.67583084106445 1.833794355392456 L 17.67583084106445 3.425919532775879 L 16.84203910827637 3.564745664596558 L 16.84203910827637 6.836543560028076 L 16.00824737548828 6.836543560028076 L 16.00824737548828 11.00550174713135 L 12.67308139801025 11.00550174713135 L 12.67308139801025 5.168961048126221 L 11.00549793243408 5.168961048126221 L 11.00549793243408 2.667586326599121 L 10.171706199646 2.667586326599121 L 10.171706199646 1.000003218650818 L 6.002748966217041 1.000003218650818 L 6.002748966217041 2.667586326599121 L 5.168957233428955 2.667586326599121 L 5.168957233428955 5.168961048126221 L 3.5013747215271 5.168961048126221 L 3.5013747215271 12.95865726470947 C 2.637566566467285 13.37096691131592 2.008470773696899 14.19350242614746 1.867143392562866 15.17445850372314 L 1 15.17445850372314 L 1 26.84754180908203 L 26.8475341796875 26.84754180908203 L 26.8475341796875 15.11067390441895 L 23.51237106323242 15.58718395233154 Z M 17.67583084106445 4.271383762359619 L 21.84478950500488 3.576418399810791 L 21.84478950500488 6.83654260635376 L 17.67583084106445 6.83654260635376 L 17.67583084106445 4.271383762359619 Z M 16.84203910827637 7.670334815979004 L 22.67858123779297 7.670334815979004 L 22.67858123779297 15.70641803741455 L 20.17720413208008 16.06369590759277 L 20.17720413208008 18.23197174072266 L 18.92651748657227 16.56438827514648 L 17.67583084106445 18.23197174072266 L 17.67583084106445 11.0054988861084 L 16.84203910827637 11.0054988861084 L 16.84203910827637 7.670334815979004 Z M 16.84203910827637 12.67308235168457 L 11.00549793243408 12.67308235168457 L 11.00549793243408 11.8392915725708 L 16.84203910827637 11.8392915725708 L 16.84203910827637 12.67308235168457 Z M 16.84203910827637 21.01099967956543 L 21.0109977722168 21.01099967956543 L 21.0109977722168 26.01374816894531 L 16.84203910827637 26.01374816894531 L 16.84203910827637 21.01099967956543 Z M 17.25893592834473 20.17720603942871 L 18.92651748657227 17.95390129089355 L 20.59410095214844 20.17720603942871 L 17.25893592834473 20.17720603942871 Z M 6.836540222167969 1.83379328250885 L 9.33791446685791 1.83379328250885 L 9.33791446685791 2.667584657669067 L 6.836540222167969 2.667584657669067 L 6.836540222167969 1.83379328250885 Z M 6.002748966217041 3.501376152038574 L 10.171706199646 3.501376152038574 L 10.171706199646 5.168959617614746 L 6.002748966217041 5.168959617614746 L 6.002748966217041 3.501376152038574 Z M 4.335165977478027 6.002750873565674 L 11.83928966522217 6.002750873565674 L 11.83928966522217 11.0054988861084 L 10.171706199646 11.0054988861084 L 10.171706199646 12.95865535736084 C 9.791914939880371 12.77772235870361 9.368764877319336 12.67308235168457 8.921018600463867 12.67308235168457 L 4.752061367034912 12.67308235168457 C 4.610317230224609 12.67308235168457 4.471908092498779 12.68684005737305 4.335165977478027 12.70643424987793 L 4.335165977478027 6.002750873565674 Z M 4.752061367034912 13.50687408447266 L 8.921018600463867 13.50687408447266 C 9.92740535736084 13.50687408447266 10.76953506469727 14.22435092926025 10.96339130401611 15.17445755004883 L 2.709689617156982 15.17445755004883 C 2.903546094894409 14.22435092926025 3.745675086975098 13.50687408447266 4.752061367034912 13.50687408447266 Z M 11.83928966522217 16.00824928283691 L 11.83928966522217 16.842041015625 L 1.833791732788086 16.842041015625 L 1.833791732788086 16.00824928283691 L 11.83928966522217 16.00824928283691 Z M 10.171706199646 23.51237297058105 L 8.504122734069824 23.51237297058105 L 8.504122734069824 21.84479141235352 L 10.171706199646 21.84479141235352 L 10.171706199646 23.51237297058105 Z M 7.670331954956055 23.51237297058105 L 6.002748966217041 23.51237297058105 L 6.002748966217041 21.84479141235352 L 7.670331954956055 21.84479141235352 L 7.670331954956055 23.51237297058105 Z M 7.670331954956055 24.34616470336914 L 7.670331954956055 26.01374816894531 L 6.002748966217041 26.01374816894531 L 6.002748966217041 24.34616470336914 L 7.670331954956055 24.34616470336914 Z M 8.504122734069824 24.34616470336914 L 10.171706199646 24.34616470336914 L 10.171706199646 26.01374816894531 L 8.504122734069824 26.01374816894531 L 8.504122734069824 24.34616470336914 Z M 10.171706199646 21.01099967956543 L 8.504122734069824 21.01099967956543 L 8.504122734069824 19.34341430664062 L 10.171706199646 19.34341430664062 L 10.171706199646 21.01099967956543 Z M 7.670331954956055 21.01099967956543 L 6.002748966217041 21.01099967956543 L 6.002748966217041 19.34341430664062 L 7.670331954956055 19.34341430664062 L 7.670331954956055 21.01099967956543 Z M 5.168957233428955 21.01099967956543 L 3.5013747215271 21.01099967956543 L 3.5013747215271 19.34341430664062 L 5.168957233428955 19.34341430664062 L 5.168957233428955 21.01099967956543 Z M 3.5013747215271 21.84479141235352 L 5.168957233428955 21.84479141235352 L 5.168957233428955 23.51237297058105 L 3.5013747215271 23.51237297058105 L 3.5013747215271 21.84479141235352 Z M 3.5013747215271 24.34616470336914 L 5.168957233428955 24.34616470336914 L 5.168957233428955 26.01374816894531 L 3.5013747215271 26.01374816894531 L 3.5013747215271 24.34616470336914 Z M 11.00549793243408 26.01374816894531 L 11.00549793243408 18.50962257385254 L 2.667582988739014 18.50962257385254 L 2.667582988739014 26.01374816894531 L 1.833791732788086 26.01374816894531 L 1.833791732788086 17.67583274841309 L 11.83928966522217 17.67583274841309 L 11.83928966522217 26.01374816894531 L 11.00549793243408 26.01374816894531 Z M 11.80593776702881 15.17445755004883 C 11.71588897705078 14.54827976226807 11.42823028564453 13.98505306243896 11.00549793243408 13.55314922332764 L 11.00549793243408 13.50687408447266 L 16.84203910827637 13.50687408447266 L 16.84203910827637 19.34341430664062 L 16.00824737548828 20.45527648925781 L 16.00824737548828 26.01374816894531 L 12.67308139801025 26.01374816894531 L 12.67308139801025 15.17445755004883 L 11.80593776702881 15.17445755004883 Z M 26.01374435424805 26.01374816894531 L 21.84478950500488 26.01374816894531 L 21.84478950500488 20.45527648925781 L 21.0109977722168 19.34341430664062 L 21.0109977722168 16.78659439086914 L 26.01374435424805 16.07203483581543 L 26.01374435424805 26.01374816894531 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, middle: 0.5022),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 15.3 1.0 1.0" ><path transform="translate(-16.63, -17.74)" d="M 31 33 L 31.89129447937012 33 L 31.89129447937012 33.89129257202148 L 31 33.89129257202148 L 31 33 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, end: 1.7),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 26.0 1.0 1.0" ><path transform="translate(-16.63, -31.04)" d="M 31 57 L 31.89129447937012 57 L 31.89129447937012 57.89129257202148 L 31 57.89129257202148 L 31 57 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, middle: 0.5739),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 17.0 1.0 1.0" ><path transform="translate(-16.63, -19.96)" d="M 31 37 L 31.89129447937012 37 L 31.89129447937012 37.89129257202148 L 31 37.89129257202148 L 31 37 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, end: 3.5),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 24.2 1.0 1.0" ><path transform="translate(-16.63, -28.83)" d="M 31 53.00000381469727 L 31.89129447937012 53.00000381469727 L 31.89129447937012 53.89129638671875 L 31 53.89129638671875 L 31 53.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 20.6 1.0 1.0" ><path transform="translate(-16.63, -24.39)" d="M 31 45.00000381469727 L 31.89129447937012 45.00000381469727 L 31.89129447937012 45.89129638671875 L 31 45.89129638671875 L 31 45.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, middle: 0.6457),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 18.8 1.0 1.0" ><path transform="translate(-16.63, -22.17)" d="M 31 41 L 31.89129447937012 41 L 31.89129447937012 41.89129257202148 L 31 41.89129257202148 L 31 41 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.5381),
                            //         Pin(size: 1.0, middle: 0.7891),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="14.4 22.4 1.0 1.0" ><path transform="translate(-16.63, -26.61)" d="M 31 49 L 31.89129447937012 49 L 31.89129447937012 49.89129257202148 L 31 49.89129257202148 L 31 49 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.6098),
                            //         Pin(size: 1.0, middle: 0.6457),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="16.2 18.8 1.0 1.0" ><path transform="translate(-18.85, -22.17)" d="M 35 41 L 35.89129638671875 41 L 35.89129638671875 41.89129257202148 L 35 41.89129257202148 L 35 41 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.6098),
                            //         Pin(size: 1.0, middle: 0.5739),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="16.2 17.0 1.0 1.0" ><path transform="translate(-18.85, -19.96)" d="M 35 37 L 35.89129638671875 37 L 35.89129638671875 37.89129257202148 L 35 37.89129257202148 L 35 37 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.6098),
                            //         Pin(size: 1.0, middle: 0.5022),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="16.2 15.3 1.0 1.0" ><path transform="translate(-18.85, -17.74)" d="M 35 33 L 35.89129638671875 33 L 35.89129638671875 33.89129257202148 L 35 33.89129257202148 L 35 33 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: -0.1),
                            //         Pin(size: 1.0, end: 1.7),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="26.0 26.0 1.0 1.0" ><path transform="translate(-31.04, -31.04)" d="M 57 57 L 57.89129257202148 57 L 57.89129257202148 57.89129257202148 L 57 57.89129257202148 L 57 57 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: -0.1),
                            //         Pin(size: 1.0, middle: 0.7891),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="26.0 22.4 1.0 1.0" ><path transform="translate(-31.04, -26.61)" d="M 57 49 L 57.89129257202148 49 L 57.89129257202148 49.89129257202148 L 57 49.89129257202148 L 57 49 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: -0.1),
                            //         Pin(size: 1.0, end: 3.5),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="26.0 24.2 1.0 1.0" ><path transform="translate(-31.04, -28.83)" d="M 57 53.00000381469727 L 57.89129257202148 53.00000381469727 L 57.89129257202148 53.89129638671875 L 57 53.89129638671875 L 57 53.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: -0.1),
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="26.0 20.6 1.0 1.0" ><path transform="translate(-31.04, -24.39)" d="M 57 45.00000381469727 L 57.89129257202148 45.00000381469727 L 57.89129257202148 45.89129638671875 L 57 45.89129638671875 L 57 45.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: -0.1),
                            //         Pin(size: 1.0, middle: 0.6457),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="26.0 18.8 1.0 1.0" ><path transform="translate(-31.04, -22.17)" d="M 57 41 L 57.89129257202148 41 L 57.89129257202148 41.89129257202148 L 57 41.89129257202148 L 57 41 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 1.7),
                            //         Pin(size: 1.0, end: 3.5),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="24.2 24.2 1.0 1.0" ><path transform="translate(-28.83, -28.83)" d="M 53.00000381469727 53.00000381469727 L 53.89129638671875 53.00000381469727 L 53.89129638671875 53.89129638671875 L 53.00000381469727 53.89129638671875 L 53.00000381469727 53.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 1.7),
                            //         Pin(size: 1.0, middle: 0.6457),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="24.2 18.8 1.0 1.0" ><path transform="translate(-28.83, -22.17)" d="M 53.00000381469727 41 L 53.89129638671875 41 L 53.89129638671875 41.89129257202148 L 53.00000381469727 41.89129257202148 L 53.00000381469727 41 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 1.7),
                            //         Pin(size: 1.0, middle: 0.7891),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="24.2 22.4 1.0 1.0" ><path transform="translate(-28.83, -26.61)" d="M 53.00000381469727 49 L 53.89129638671875 49 L 53.89129638671875 49.89129257202148 L 53.00000381469727 49.89129257202148 L 53.00000381469727 49 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 1.7),
                            //         Pin(size: 1.0, end: 1.7),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="24.2 26.0 1.0 1.0" ><path transform="translate(-28.83, -31.04)" d="M 53.00000381469727 57 L 53.89129638671875 57 L 53.89129638671875 57.89129257202148 L 53.00000381469727 57.89129257202148 L 53.00000381469727 57 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 1.7),
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="24.2 20.6 1.0 1.0" ><path transform="translate(-28.83, -24.39)" d="M 53.00000381469727 45.00000381469727 L 53.89129638671875 45.00000381469727 L 53.89129638671875 45.89129638671875 L 53.00000381469727 45.89129638671875 L 53.00000381469727 45.00000381469727 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.3946),
                            //         Pin(size: 1.0, middle: 0.1793),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="10.8 7.2 1.0 1.0" ><path transform="translate(-12.2, -7.76)" d="M 23 15 L 23.89129257202148 15 L 23.89129257202148 15.89129543304443 L 23 15.89129543304443 L 23 15 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         Pin(size: 1.0, middle: 0.1793),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="9.0 7.2 1.0 1.0" ><path transform="translate(-9.98, -7.76)" d="M 19 15 L 19.89129257202148 15 L 19.89129257202148 15.89129543304443 L 19 15.89129543304443 L 19 15 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.1794),
                            //         Pin(size: 1.0, middle: 0.1793),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="5.5 7.2 1.0 1.0" ><path transform="translate(-5.54, -7.76)" d="M 11 15 L 11.89129543304443 15 L 11.89129543304443 15.89129543304443 L 11 15.89129543304443 L 11 15 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         Pin(size: 1.0, middle: 0.1793),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 7.2 1.0 1.0" ><path transform="translate(-7.76, -7.76)" d="M 15 15 L 15.89129543304443 15 L 15.89129543304443 15.89129543304443 L 15 15.89129543304443 L 15 15 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 9.0 1.0 1.0" ><path transform="translate(-7.76, -9.98)" d="M 15 19 L 15.89129543304443 19 L 15.89129543304443 19.89129257202148 L 15 19.89129257202148 L 15 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.3946),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="10.8 9.0 1.0 1.0" ><path transform="translate(-12.2, -9.98)" d="M 23 19 L 23.89129257202148 19 L 23.89129257202148 19.89129257202148 L 23 19.89129257202148 L 23 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.1794),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="5.5 9.0 1.0 1.0" ><path transform="translate(-5.54, -9.98)" d="M 11 19 L 11.89129543304443 19 L 11.89129543304443 19.89129257202148 L 11 19.89129257202148 L 11 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="9.0 9.0 1.0 1.0" ><path transform="translate(-9.98, -9.98)" d="M 19 19 L 19.89129257202148 19 L 19.89129257202148 19.89129257202148 L 19 19.89129257202148 L 19 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.1794),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="5.5 10.8 1.0 1.0" ><path transform="translate(-5.54, -12.2)" d="M 11 23 L 11.89129543304443 23 L 11.89129543304443 23.89129257202148 L 11 23.89129257202148 L 11 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 10.8 1.0 1.0" ><path transform="translate(-7.76, -12.2)" d="M 15 23 L 15.89129543304443 23 L 15.89129543304443 23.89129257202148 L 15 23.89129257202148 L 15 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="9.0 10.8 1.0 1.0" ><path transform="translate(-9.98, -12.2)" d="M 19 23 L 19.89129257202148 23 L 19.89129257202148 23.89129257202148 L 19 23.89129257202148 L 19 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 3.5),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="22.4 9.0 1.0 1.0" ><path transform="translate(-26.61, -9.98)" d="M 49 19 L 49.89129257202148 19 L 49.89129257202148 19.89129257202148 L 49 19.89129257202148 L 49 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 9.0 1.0 1.0" ><path transform="translate(-24.39, -9.98)" d="M 45.00000381469727 19 L 45.89129638671875 19 L 45.89129638671875 19.89129257202148 L 45.00000381469727 19.89129257202148 L 45.00000381469727 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         Pin(size: 1.0, middle: 0.2511),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="18.8 9.0 1.0 1.0" ><path transform="translate(-22.17, -9.98)" d="M 41 19 L 41.89129257202148 19 L 41.89129257202148 19.89129257202148 L 41 19.89129257202148 L 41 19 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 3.5),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="22.4 10.8 1.0 1.0" ><path transform="translate(-26.61, -12.2)" d="M 49 23 L 49.89129257202148 23 L 49.89129257202148 23.89129257202148 L 49 23.89129257202148 L 49 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7174),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="18.8 10.8 1.0 1.0" ><path transform="translate(-22.17, -12.2)" d="M 41 23 L 41.89129257202148 23 L 41.89129257202148 23.89129257202148 L 41 23.89129257202148 L 41 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 1.0, middle: 0.3228),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 10.8 1.0 1.0" ><path transform="translate(-24.39, -12.2)" d="M 45.00000381469727 23 L 45.89129638671875 23 L 45.89129638671875 23.89129257202148 L 45.00000381469727 23.89129257202148 L 45.00000381469727 23 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 1.0, middle: 0.538),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 16.2 1.0 1.0" ><path transform="translate(-24.39, -18.85)" d="M 45.00000381469727 35 L 45.89129638671875 35 L 45.89129638671875 35.89129638671875 L 45.00000381469727 35.89129638671875 L 45.00000381469727 35 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 1.0, middle: 0.4663),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 14.4 1.0 1.0" ><path transform="translate(-24.39, -16.63)" d="M 45.00000381469727 31 L 45.89129638671875 31 L 45.89129638671875 31.89129447937012 L 45.00000381469727 31.89129447937012 L 45.00000381469727 31 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, middle: 0.7892),
                            //         Pin(size: 1.0, middle: 0.3946),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="20.6 12.6 1.0 1.0" ><path transform="translate(-24.39, -14.41)" d="M 45.00000381469727 27 L 45.89129638671875 27 L 45.89129638671875 27.89129257202148 L 45.00000381469727 27.89129257202148 L 45.00000381469727 27 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 3.5),
                            //         Pin(size: 1.0, middle: 0.4663),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="22.4 14.4 1.0 1.0" ><path transform="translate(-26.61, -16.63)" d="M 49 31 L 49.89129257202148 31 L 49.89129257202148 31.89129447937012 L 49 31.89129447937012 L 49 31 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.0, end: 3.5),
                            //         Pin(size: 1.0, middle: 0.3946),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="22.4 12.6 1.0 1.0" ><path transform="translate(-26.61, -14.41)" d="M 49 27 L 49.89129257202148 27 L 49.89129257202148 27.89129257202148 L 49 27.89129257202148 L 49 27 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Image.asset(
                              'assets/images/filter/city.png',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'City',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Adobe XD layer: 'guarantee' (group)
                            // Container(
                            //   height: 30,
                            //   width: 30,
                            //   child: Stack(
                            //     children: <Widget>[
                            //       Pinned.fromPins(
                            //         Pin(start: 0.0, end: 0.0),
                            //         Pin(start: 0.0, end: 0.0),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="0.0 0.0 28.8 27.9" ><path  d="M 26.41383361816406 0 L 6.243269920349121 0 C 4.917655944824219 0.001641487702727318 3.843651056289673 1.075643301010132 3.842012166976929 2.401257753372192 L 3.842012166976929 21.13106536865234 L 0.4802515208721161 21.13106536865234 C 0.2150344103574753 21.13106536865234 0 21.34610176086426 0 21.61132049560547 L 0 22.57182121276855 C 0.001641487702727318 23.89743614196777 1.075643301010132 24.9714412689209 2.401257753372192 24.97307968139648 L 17.3005199432373 24.97307968139648 L 17.3005199432373 27.37433815002441 C 17.3005199432373 27.55630683898926 17.40322875976562 27.72256851196289 17.56597137451172 27.80393600463867 C 17.72871398925781 27.88530921936035 17.92334747314453 27.86771965026855 18.0689697265625 27.75844383239746 L 19.7017765045166 26.53389930725098 L 21.3345832824707 27.75844383239746 C 21.41759300231934 27.8210563659668 21.51889801025391 27.85482406616211 21.62277984619141 27.85458946228027 C 21.69735145568848 27.85529327392578 21.77098274230957 27.8388786315918 21.83805084228516 27.80651664733887 C 22.00149345397949 27.72467803955078 22.10420417785645 27.5570125579834 22.1030330657959 27.37433815002441 L 22.1030330657959 24.97307968139648 L 22.57179260253906 24.97307968139648 C 23.89740753173828 24.97143745422363 24.97141075134277 23.89743614196777 24.97304916381836 22.57182121276855 L 24.97304916381836 3.842012166976929 L 28.33481025695801 3.842012166976929 C 28.60002708435059 3.842012166976929 28.8150634765625 3.626977920532227 28.8150634765625 3.36176061630249 L 28.8150634765625 2.401257753372192 C 28.81342124938965 1.075643301010132 27.73941802978516 0.001638965797610581 26.41380500793457 0 Z M 17.3005199432373 24.01257705688477 L 2.401256799697876 24.01257705688477 C 1.605606079101562 24.01257705688477 0.9605021476745605 23.36747360229492 0.9605021476745605 22.57182121276855 L 0.9605021476745605 22.0915699005127 L 17.3005199432373 22.0915699005127 L 17.3005199432373 24.01257705688477 Z M 21.14253425598145 26.41383361816406 L 19.98997688293457 25.54947853088379 C 19.81926155090332 25.42120742797852 19.58453178405762 25.42120742797852 19.4135799407959 25.54947853088379 L 18.26102638244629 26.41383361816406 L 18.26102638244629 21.04992866516113 C 18.3538875579834 21.05719947814941 18.44721794128418 21.05555725097656 18.53960800170898 21.04453659057617 C 18.81678581237793 21.40214347839355 19.24380683898926 21.61131858825684 19.69615173339844 21.61131858825684 C 20.14849472045898 21.61131858825684 20.57528305053711 21.40214347839355 20.85245895385742 21.04453659057617 C 20.94813346862793 21.05602836608887 21.04474639892578 21.05790138244629 21.14065742492676 21.04992866516113 L 21.14253425598145 26.41383361816406 Z M 21.76020050048828 18.72020530700684 C 21.63216590881348 18.76569938659668 21.52922058105469 18.86348342895508 21.47739791870117 18.98893928527832 C 21.42533683776855 19.1146297454834 21.42885589599609 19.25626564025879 21.48748016357422 19.37914276123047 C 21.5782299041748 19.56955528259277 21.53977203369141 19.79655075073242 21.39109992980957 19.94615745544434 C 21.2421932220459 20.09576797485352 21.01543617248535 20.1356315612793 20.82455444335938 20.04582023620605 C 20.70191383361816 19.98719596862793 20.5600414276123 19.98344612121582 20.43435096740723 20.0352668762207 C 20.30842399597168 20.08732795715332 20.21087455749512 20.19026947021484 20.16514778137207 20.31854248046875 C 20.09503173828125 20.51739501953125 19.9069652557373 20.65059089660645 19.69615173339844 20.65059089660645 C 19.48510360717773 20.65059089660645 19.29703712463379 20.51739501953125 19.22692108154297 20.31854248046875 C 19.18142700195312 20.19026947021484 19.08364295959473 20.08732795715332 18.95795249938965 20.0352668762207 C 18.83202743530273 19.98344612121582 18.69015502929688 19.98719596862793 18.56751251220703 20.04582023620605 C 18.37663269042969 20.1356315612793 18.14987182617188 20.09576797485352 18.00120162963867 19.94615745544434 C 17.852294921875 19.79655075073242 17.81383895874023 19.56955528259277 17.90482139587402 19.37914276123047 C 17.96321105957031 19.25650024414062 17.96696472167969 19.1146297454834 17.91490745544434 18.98917388916016 C 17.86308288574219 18.86348342895508 17.76037216186523 18.76593017578125 17.63233757019043 18.72020530700684 C 17.43324851989746 18.64938735961914 17.30005264282227 18.46084976196289 17.30005264282227 18.24956703186035 C 17.30005264282227 18.03828620910645 17.43324851989746 17.84975051879883 17.63233757019043 17.7789306640625 C 17.76037216186523 17.73320198059082 17.86284828186035 17.63565063476562 17.91467094421387 17.51019668579102 C 17.96673202514648 17.38474082946777 17.96297836303711 17.24310302734375 17.90482139587402 17.12046241760254 C 17.81336784362793 16.9300479888916 17.85182571411133 16.70281982421875 18.000732421875 16.55297470092773 C 18.14940452575684 16.40336608886719 18.37639808654785 16.36326789855957 18.56751251220703 16.45331573486328 C 18.69015502929688 16.51193809509277 18.83202743530273 16.51568984985352 18.95795249938965 16.46386528015137 C 19.08364295959473 16.41180801391602 19.18142700195312 16.30886268615723 19.22692108154297 16.18059349060059 C 19.29703712463379 15.98173904418945 19.48510360717773 15.84854507446289 19.69615173339844 15.84854507446289 C 19.9069652557373 15.84854507446289 20.09503173828125 15.98173904418945 20.16514778137207 16.18059349060059 C 20.21087455749512 16.30886268615723 20.30842399597168 16.41180801391602 20.43435096740723 16.46386528015137 C 20.5600414276123 16.51568984985352 20.70191383361816 16.51193809509277 20.82455444335938 16.45331573486328 C 21.01543617248535 16.36350059509277 21.2421932220459 16.40336608886719 21.39109992980957 16.55297470092773 C 21.53977203369141 16.70258522033691 21.5782299041748 16.92957878112793 21.48748016357422 17.11999130249023 C 21.42885589599609 17.24286842346191 21.42533683776855 17.3845043182373 21.47739791870117 17.51019668579102 C 21.52922058105469 17.63565063476562 21.63216590881348 17.73343849182129 21.76020050048828 17.7789306640625 C 21.95882225036621 17.85021781921387 22.0915470123291 18.03851890563965 22.0915470123291 18.24956703186035 C 22.0915470123291 18.46061515808105 21.95882225036621 18.64891624450684 21.76020050048828 18.72020530700684 Z M 24.45575141906738 1.020534515380859 C 24.42854881286621 1.058992147445679 24.40439796447754 1.099794626235962 24.37953948974609 1.140128493309021 C 24.32818603515625 1.222202897071838 24.28222274780273 1.307090997695923 24.24118804931641 1.394558548927307 C 24.21961212158203 1.442630648612976 24.1994457244873 1.486950635910034 24.18068695068359 1.533850073814392 C 24.14504241943359 1.62811815738678 24.11502838134766 1.724262714385986 24.09134101867676 1.82204794883728 C 24.08032035827637 1.866836786270142 24.06625175476074 1.909984350204468 24.05780982971191 1.955477356910706 C 24.02873039245605 2.102507352828979 24.01372337341309 2.25164794921875 24.01255035400391 2.401257753372192 L 24.01255035400391 22.57182121276855 C 24.01255035400391 23.36747360229492 23.36744689941406 24.01257705688477 22.57179641723633 24.01257705688477 C 22.41163444519043 24.00952911376953 22.25334739685059 23.97974586486816 22.10303497314453 23.92417144775391 L 22.10303497314453 20.58351707458496 C 22.40178489685059 20.26928901672363 22.54271697998047 19.83711242675781 22.48737716674805 19.40703964233398 C 22.84428215026855 19.12915802001953 23.05298805236816 18.70190238952637 23.05298805236816 18.24955558776855 C 23.05298805236816 17.79720497131348 22.84428215026855 17.36995506286621 22.48737716674805 17.09207153320312 C 22.54412460327148 16.64370918273926 22.39053153991699 16.19417953491211 22.07137680053711 15.87385177612305 C 21.75222587585449 15.5537633895874 21.30315971374512 15.39899253845215 20.85433578491211 15.45456981658936 C 20.5771598815918 15.09696197509766 20.15037155151367 14.88778781890869 19.69802856445312 14.88778781890869 C 19.24568557739258 14.88778781890869 18.81866455078125 15.09696197509766 18.54148864746094 15.45456981658936 C 18.09289169311523 15.3992280960083 17.64383125305176 15.55399608612061 17.32468032836914 15.8740873336792 C 17.00576210021973 16.19417572021484 16.8521671295166 16.64370727539062 16.9086799621582 17.09207153320312 C 16.55177688598633 17.36995124816895 16.34283828735352 17.79720497131348 16.34283828735352 18.24955558776855 C 16.34283828735352 18.70190238952637 16.55177688598633 19.12915420532227 16.9086799621582 19.40703964233398 C 16.85193252563477 19.84320449829102 16.99732208251953 20.2814826965332 17.30334091186523 20.59758186340332 L 17.30334091186523 21.13106536865234 L 4.802513599395752 21.13106536865234 L 4.802513599395752 2.401256084442139 C 4.802513599395752 1.605605125427246 5.447617530822754 0.9605011940002441 6.243268013000488 0.9605011940002441 L 24.49282646179199 0.9605011940002441 C 24.47946166992188 0.979261040687561 24.46937561035156 1.000834941864014 24.45577430725098 1.020532608032227 Z M 27.85456466674805 2.881509065628052 L 24.97305488586426 2.881509065628052 L 24.97305488586426 2.401257753372192 C 24.97305488586426 1.605607032775879 25.6181583404541 0.9605030417442322 26.41381072998047 0.9605030417442322 C 27.20945930480957 0.9605030417442322 27.85456466674805 1.605607032775879 27.85456466674805 2.401257753372192 L 27.85456466674805 2.881509065628052 Z M 27.85456466674805 2.881509065628052" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 1.9, middle: 0.5893),
                            //         Pin(size: 1.0, start: 3.8),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="15.8 3.8 1.9 1.0" ><path transform="translate(-248.15, -60.16)" d="M 264 64 L 265.9210205078125 64 L 265.9210205078125 64.96050262451172 L 264 64.96050262451172 L 264 64 Z M 264 64" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 3.8, middle: 0.4423),
                            //         Pin(size: 1.0, start: 3.8),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="11.0 3.8 3.8 1.0" ><path transform="translate(-172.95, -60.16)" d="M 184 64 L 187.8420104980469 64 L 187.8420104980469 64.96050262451172 L 184 64.96050262451172 L 184 64 Z M 184 64" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 9.6, middle: 0.5),
                            //         Pin(size: 1.0, middle: 0.2325),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="9.6 6.2 9.6 1.0" ><path transform="translate(-150.39, -97.76)" d="M 160 104 L 169.6050415039062 104 L 169.6050415039062 104.9605026245117 L 160 104.9605026245117 L 160 104 Z M 160 104" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 2.4, middle: 0.2727),
                            //         Pin(size: 1.0, middle: 0.3398),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 9.1 2.4 1.0" ><path transform="translate(-112.8, -142.88)" d="M 120 152 L 122.4012603759766 152 L 122.4012603759766 152.9604949951172 L 120 152.9604949951172 L 120 152 Z M 120 152" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 5.3, middle: 0.3061),
                            //         Pin(size: 1.0, middle: 0.4292),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 11.5 5.3 1.0" ><path transform="translate(-112.8, -180.47)" d="M 120 192 L 125.2827606201172 192 L 125.2827606201172 192.9605102539062 L 120 192.9605102539062 L 120 192 Z M 120 192" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 11.0, middle: 0.5946),
                            //         Pin(size: 1.0, middle: 0.3398),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="10.6 9.1 11.0 1.0" ><path transform="translate(-165.43, -142.88)" d="M 176 152 L 187.0457916259766 152 L 187.0457916259766 152.9604949951172 L 176 152.9604949951172 L 176 152 Z M 176 152" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 8.2, middle: 0.6512),
                            //         Pin(size: 1.0, middle: 0.4292),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="13.4 11.5 8.2 1.0" ><path transform="translate(-210.55, -180.47)" d="M 224 192 L 232.1642608642578 192 L 232.1642608642578 192.9605102539062 L 224 192.9605102539062 L 224 192 Z M 224 192" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 9.6, middle: 0.375),
                            //         Pin(size: 1.0, middle: 0.5186),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 13.9 9.6 1.0" ><path transform="translate(-112.8, -218.07)" d="M 120 232 L 129.6050262451172 232 L 129.6050262451172 232.9605102539062 L 120 232.9605102539062 L 120 232 Z M 120 232" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //       Pinned.fromPins(
                            //         Pin(size: 8.2, middle: 0.3488),
                            //         Pin(size: 1.0, middle: 0.608),
                            //         child: SvgPicture.string(
                            //           '<svg viewBox="7.2 16.3 8.2 1.0" ><path transform="translate(-112.8, -255.67)" d="M 120 272 L 128.1642761230469 272 L 128.1642761230469 272.9605102539062 L 120 272.9605102539062 L 120 272 Z M 120 272" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //           allowDrawingOutsideViewBox: true,
                            //           fit: BoxFit.fill,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Image.asset(
                              'assets/images/filter/qualification.png',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Qualification',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Adobe XD layer: 'germany' (group)
                            // Container(
                            //     height: 30,
                            //     width: 30,
                            //     child: // Adobe XD layer: 'user-experience' (group)
                            //         Stack(
                            //       children: <Widget>[
                            //         Pinned.fromPins(
                            //           Pin(start: 0.0, end: 0.0),
                            //           Pin(start: 0.0, end: 0.0),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="0.5 0.0 25.8 25.9" ><path transform="translate(0.0, 0.0)" d="M 24.60407066345215 12.93050193786621 C 25.14801979064941 11.84614658355713 25.57619667053223 10.75607585906982 25.8734188079834 9.681981086730957 C 26.8053150177002 6.316498756408691 26.35406112670898 3.498309135437012 24.60248756408691 1.746959686279297 C 22.85111045837402 -0.004414635244756937 20.03293991088867 -0.4558664858341217 16.66747093200684 0.4760287404060364 C 15.59337329864502 0.773249626159668 14.50329875946045 1.201626658439636 13.41895008087158 1.745379328727722 C 12.06991577148438 1.068297505378723 10.71891212463379 0.5728636384010315 9.417216300964355 0.2874785959720612 C 6.393728256225586 -0.3752036094665527 3.845383882522583 0.1431082934141159 2.241718053817749 1.746959686279297 C 1.212392449378967 2.776285886764526 0.6153876781463623 4.222553730010986 0.5155889987945557 5.929547786712646 C 0.4258509278297424 7.465157985687256 0.7370748519897461 9.227377891540527 1.415337204933167 11.04267883300781 C 0.858366072177887 11.48308658599854 0.5000076293945312 12.16391181945801 0.5000076293945312 12.92737579345703 C 0.5000076293945312 13.69084167480469 0.8583691120147705 14.37166881561279 1.415337204933167 14.81207370758057 C 0.7370736598968506 16.62734985351562 0.4258478283882141 18.38976860046387 0.5155889987945557 19.92520332336426 C 0.615583062171936 21.63220024108887 1.212392449378967 23.07846260070801 2.241718053817749 24.1077938079834 C 3.391155242919922 25.25742721557617 5.003879070281982 25.85009384155273 6.951891899108887 25.85009384155273 C 7.34299373626709 25.85009384155273 7.747702121734619 25.82623100280762 8.165032386779785 25.77810668945312 C 9.835345268249512 25.58541679382324 11.62005424499512 25.01641845703125 13.42150402069092 24.11055755615234 C 14.50506782531738 24.6539134979248 15.59435367584229 25.08169937133789 16.6674633026123 25.37872123718262 C 17.8127613067627 25.69586563110352 18.89474868774414 25.85285949707031 19.89291191101074 25.85285949707031 C 21.8275089263916 25.85285949707031 23.44713401794434 25.26314926147461 24.60248947143555 24.10779571533203 C 26.20633506774902 22.5041446685791 26.72465324401855 19.95577430725098 26.06196975708008 16.93209457397461 C 25.77658271789551 15.63059616088867 25.28114891052246 14.27959060668945 24.60407066345215 12.93055820465088 Z M 16.86979866027832 1.207160592079163 C 19.96054077148438 0.351394385099411 22.51620292663574 0.7336188554763794 24.06599426269531 2.283427000045776 C 25.61580276489258 3.833235263824463 25.99802589416504 6.388901233673096 25.14225959777832 9.479626655578613 C 24.90262985229492 10.34545135498047 24.57345962524414 11.22311401367188 24.16401481628418 12.09998035430908 C 23.43033218383789 10.78428173065186 22.52802085876465 9.480610847473145 21.48251724243164 8.237096786499023 C 21.80281829833984 7.828836917877197 21.9945182800293 7.315062046051025 21.9945182800293 6.757106781005859 C 21.9945182800293 6.217690944671631 21.81997299194336 5.708058834075928 21.48942184448242 5.283230304718018 L 20.89063835144043 5.748883247375488 C 21.11666107177734 6.039398193359375 21.23598480224609 6.388097763061523 21.23598480224609 6.757108688354492 C 21.23598480224609 7.663562774658203 20.49855041503906 8.400798797607422 19.5922966003418 8.400798797607422 C 18.68603897094727 8.400798797607422 17.94860649108887 7.66356372833252 17.94860649108887 6.757108688354492 C 17.94860649108887 5.850656032562256 18.68603897094727 5.113420009613037 19.5922966003418 5.113420009613037 C 19.88813400268555 5.113420009613037 20.17825889587402 5.192705154418945 20.4309024810791 5.342991352081299 L 20.81865119934082 4.690958499908447 C 20.44865417480469 4.471050262451172 20.02461814880371 4.354686260223389 19.5922966003418 4.354686260223389 C 19.03433990478516 4.354686260223389 18.52056312561035 4.546587944030762 18.11250305175781 4.866883277893066 C 16.8687915802002 3.821384429931641 15.56512260437012 2.919071912765503 14.24942207336426 2.185188293457031 C 15.12629413604736 1.77594256401062 16.00395202636719 1.446770906448364 16.86977577209473 1.207140207290649 Z M 2.778120756149292 2.283427000045776 C 4.82908296585083 0.2324648350477219 8.589781761169434 0.3089877068996429 12.59152507781982 2.183038473129272 C 10.6379919052124 3.272518634796143 8.72193431854248 4.731409072875977 6.973896503448486 6.47922945022583 C 5.677720069885254 7.775405883789062 4.53696346282959 9.167628288269043 3.578636169433594 10.62099742889404 C 3.362673282623291 10.5582799911499 3.135468006134033 10.52494716644287 2.902346849441528 10.52494716644287 C 2.615381717681885 10.52494716644287 2.340250968933105 10.57583236694336 2.084841966629028 10.66833209991455 C 0.7705197930335999 7.086100101470947 1.016659021377563 4.044639110565186 2.778095960617065 2.283443927764893 Z M 6.971558570861816 25.08878326416016 C 5.255486965179443 25.08878326416016 3.796601295471191 24.58980178833008 2.777923822402954 23.57132339477539 C 1.016688585281372 21.81008338928223 0.7703527808189392 18.76884460449219 2.084866523742676 15.18643283843994 C 2.340275049209595 15.27913093566895 2.615406274795532 15.32981872558594 2.902371406555176 15.32981872558594 C 3.136874437332153 15.32981872558594 3.363291025161743 15.29530239105225 3.577873229980469 15.23238658905029 C 4.536200523376465 16.68634414672852 5.677351951599121 18.0789623260498 6.973921298980713 19.37553215026855 C 8.721353530883789 21.12276649475098 10.63681983947754 22.58126068115234 12.58978176116943 23.67073822021484 C 10.58378505706787 24.60954284667969 8.653923034667969 25.0889949798584 6.971597671508789 25.08879661560059 Z M 13.41989898681641 23.2579288482666 C 11.37091064453125 22.18166351318359 9.347554206848145 20.67603302001953 7.510388374328613 18.83906173706055 C 6.27594518661499 17.60442352294922 5.187057018280029 16.28142166137695 4.268965244293213 14.9016227722168 C 4.894173622131348 14.46752738952637 5.30460262298584 13.74469089508057 5.30460262298584 12.92757987976074 C 5.30460262298584 12.85637950897217 5.301644325256348 12.78439235687256 5.295332908630371 12.71358776092529 L 4.539557456970215 12.7804479598999 C 4.543896675109863 12.82896518707275 4.546065807342529 12.87827396392822 4.546065807342529 12.92738246917725 C 4.546065807342529 13.83383464813232 3.808633327484131 14.57106876373291 2.902376890182495 14.57106876373291 C 1.99612033367157 14.57106876373291 1.258687734603882 13.83383464813232 1.258687734603882 12.92738246917725 C 1.258687734603882 12.02092933654785 1.99612033367157 11.28369331359863 2.902376890182495 11.28369331359863 C 3.528372764587402 11.28369331359863 4.091852188110352 11.63160037994385 4.372703075408936 12.19152927398682 L 5.050769805908203 11.8515100479126 C 4.865377426147461 11.48170852661133 4.595176219940186 11.17541885375977 4.270541667938232 10.95037841796875 C 5.188436031341553 9.571762084960938 6.276733875274658 8.249356269836426 7.51038932800293 7.015700340270996 C 9.347949981689453 5.178140163421631 11.37209224700928 3.672111988067627 13.42166709899902 2.595845222473145 C 14.81665325164795 3.330122470855713 16.22800636291504 4.276811122894287 17.59538269042969 5.423289775848389 C 17.33938217163086 5.80511999130249 17.18988609313965 6.263868808746338 17.18988609313965 6.75713586807251 C 17.18988609313965 8.081713676452637 18.26773071289062 9.159357070922852 19.5923023223877 9.159357070922852 C 20.08556747436523 9.159357070922852 20.54431915283203 9.009860038757324 20.9261474609375 8.753859519958496 C 22.07262802124023 10.1212329864502 23.01911926269531 11.53278732299805 23.75339508056641 12.92757701873779 C 22.67712593078613 14.97716045379639 21.17110633850098 17.00129699707031 19.33373832702637 18.83905601501465 C 19.13158226013184 19.041015625 18.92390060424805 19.24179077148438 18.71405410766602 19.43842697143555 C 18.29533958435059 19.08420753479004 17.7547435760498 18.87001800537109 17.16463851928711 18.87001800537109 C 16.62522506713867 18.87001800537109 16.11559104919434 19.04476165771484 15.69076442718506 19.37511825561523 L 16.15661239624023 19.97389984130859 C 16.44693183898926 19.74807548522949 16.79562950134277 19.62875175476074 17.16463851928711 19.62855529785156 C 18.07089424133301 19.62855529785156 18.80832672119141 20.36598777770996 18.80832672119141 21.27224349975586 C 18.80832672119141 22.17870140075684 18.07089424133301 22.91593360900879 17.16463851928711 22.91593360900879 C 16.25838279724121 22.91593360900879 15.52095031738281 22.17870140075684 15.52095031738281 21.27224349975586 C 15.52095031738281 20.97640419006348 15.60023593902588 20.68647575378418 15.75052261352539 20.43382835388184 L 15.09848976135254 20.04588508605957 C 14.87858009338379 20.41588020324707 14.76221752166748 20.83992195129395 14.76221752166748 21.27224349975586 C 14.76221752166748 21.65288925170898 14.85156154632568 22.01263618469238 15.00973606109619 22.33273315429688 C 14.47821140289307 22.67196655273438 13.94727420806885 22.98042297363281 13.41988945007324 23.2579231262207 Z M 24.06597900390625 23.57132339477539 C 22.51617240905762 25.1213264465332 19.96050834655762 25.50335693359375 16.86978340148926 24.64778709411621 C 16.00455093383789 24.40815544128418 15.1276798248291 24.07938003540039 14.25139999389648 23.67033004760742 C 14.65098190307617 23.44706916809082 15.05075836181641 23.20743751525879 15.44935703277588 22.95222663879395 C 15.88582038879395 23.39756393432617 16.4932804107666 23.67466735839844 17.16463851928711 23.67466735839844 C 18.48921585083008 23.67466735839844 19.56705665588379 22.59701538085938 19.56705665588379 21.2724437713623 C 19.56705665588379 20.81113052368164 19.43610000610352 20.38018989562988 19.20987892150879 20.01374244689941 C 19.43353652954102 19.80448341369629 19.65482521057129 19.59069061279297 19.86999702453613 19.37551689147949 C 21.61801719665527 17.62729835510254 23.07670593261719 15.71124267578125 24.1663875579834 13.7576904296875 C 26.04043769836426 17.75961875915527 26.1169605255127 21.52033424377441 24.06599807739258 23.5712947845459 Z M 24.06597900390625 23.57132339477539" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 7.1, middle: 0.6427),
                            //           Pin(size: 4.6, middle: 0.6124),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="12.6 13.0 7.1 4.6" ><path transform="translate(-226.84, -245.01)" d="M 246.4833831787109 261.8559265136719 L 245.6996307373047 261.8559265136719 L 245.6996307373047 259.944580078125 C 245.6996307373047 259.0992736816406 245.1314239501953 258.3486633300781 244.3178558349609 258.1190490722656 L 244.0342559814453 258.0391845703125 L 243.8283386230469 258.7693176269531 L 244.1119689941406 258.8493957519531 C 244.5998992919922 258.987060546875 244.94091796875 259.4373168945312 244.94091796875 259.944580078125 L 244.94091796875 261.8559265136719 L 243.5753021240234 261.8559265136719 L 243.5753021240234 260.819091796875 L 242.8167572021484 260.819091796875 L 242.8167572021484 261.8559265136719 L 239.4027709960938 261.8559265136719 L 239.4027709960938 262.6144409179688 L 246.4833831787109 262.6144409179688 L 246.4833831787109 261.8559265136719 Z M 246.4833831787109 261.8559265136719" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 9.3, middle: 0.4041),
                            //           Pin(size: 12.2, middle: 0.3963),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="7.2 5.4 9.3 12.2" ><path transform="translate(-126.03, -101.83)" d="M 140.7018127441406 114.9381408691406 L 142.2827758789062 115.38427734375 L 142.4888610839844 114.6539459228516 L 140.9392700195312 114.2168884277344 L 140.9392700195312 113.2094650268555 C 141.6408081054688 112.7309799194336 142.1025085449219 111.9256973266602 142.1025085449219 111.0143127441406 L 142.1025085449219 109.9015655517578 C 142.1025085449219 108.4375457763672 140.9114685058594 107.2462997436523 139.4472351074219 107.2462997436523 C 137.9832458496094 107.2462997436523 136.7919769287109 108.4375534057617 136.7919769287109 109.9015655517578 L 136.7919769287109 111.0143127441406 C 136.7919769287109 111.9256973266602 137.2536926269531 112.7309799194336 137.9552307128906 113.2094497680664 L 137.9552307128906 114.2168884277344 L 135.3920593261719 114.9397125244141 C 134.5785217285156 115.1692962646484 134.0103149414062 115.9199447631836 134.0103149414062 116.765266418457 L 134.0103149414062 118.6765823364258 L 133.2265167236328 118.6765823364258 L 133.2265167236328 119.4351196289062 L 137.8288269042969 119.4351196289062 L 137.8288269042969 118.6765823364258 L 136.8931579589844 118.6765823364258 L 136.8931579589844 117.639762878418 L 136.1346282958984 117.639762878418 L 136.1346282958984 118.6765823364258 L 134.7690277099609 118.6765823364258 L 134.7690277099609 116.765266418457 C 134.7690277099609 116.2579956054688 135.1100158691406 115.8077239990234 135.5979766845703 115.670051574707 L 138.1926879882812 114.938346862793 C 138.5121917724609 115.2878341674805 138.9634399414062 115.4903793334961 139.447265625 115.4903793334961 C 139.9310455322266 115.4903793334961 140.3825073242188 115.2876281738281 140.7018127441406 114.9381408691406 Z M 139.4472351074219 108.0050506591797 C 140.4929504394531 108.0050506591797 141.3437805175781 108.8558883666992 141.3437805175781 109.9017868041992 L 141.3437805175781 110.3242340087891 L 140.54638671875 109.2694702148438 L 137.6593627929688 109.2694702148438 C 137.9203186035156 108.5336151123047 138.6230316162109 108.0050506591797 139.4472351074219 108.0050506591797 Z M 137.5507049560547 111.0143356323242 L 137.5507049560547 110.028205871582 L 140.1688842773438 110.028205871582 L 141.2808685302734 111.4987258911133 C 141.0660858154297 112.3107070922852 140.3255004882812 112.9108657836914 139.4472351074219 112.9108657836914 C 138.4015502929688 112.9108657836914 137.5507049560547 112.0600433349609 137.5507049560547 111.0143356323242 Z M 138.7139587402344 114.381591796875 L 138.7139587402344 113.5656661987305 C 138.9468841552734 113.6329116821289 139.1928100585938 113.6696014404297 139.4472351074219 113.6696014404297 C 139.7016754150391 113.6696014404297 139.9474182128906 113.6329116821289 140.1805267333984 113.5656661987305 L 140.1805267333984 114.381591796875 C 140.0022583007812 114.6022872924805 139.7351989746094 114.7316665649414 139.4472351074219 114.7316665649414 C 139.1592864990234 114.7316665649414 138.8920593261719 114.6022872924805 138.7139587402344 114.381591796875 Z M 138.7139587402344 114.381591796875" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 1.3, middle: 0.5639),
                            //           Pin(size: 1.0, middle: 0.5585),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="14.4 13.9 1.3 1.0" ><path transform="translate(-260.59, -260.7)" d="M 276.0174865722656 275.5978088378906 L 274.9489135742188 275.2964782714844 L 275.1549987792969 274.5663452148438 L 276.223388671875 274.8677062988281 L 276.0174865722656 275.5978088378906 Z M 276.0174865722656 275.5978088378906" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 1.0, middle: 0.63),
                            //           Pin(size: 1.0, middle: 0.5782),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="16.2 14.4 1.0 1.0" ><path transform="translate(-294.4, -270.22)" d="M 311.4913024902344 284.7918090820312 L 311.2852172851562 285.5219421386719 L 310.5550537109375 285.3160400390625 L 310.7611694335938 284.5858764648438 L 311.4913024902344 284.7918090820312 Z M 311.4913024902344 284.7918090820312" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 1.0, middle: 0.7531),
                            //           Pin(size: 1.0, middle: 0.2566),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="19.2 6.4 1.0 1.0" ><path transform="translate(-351.92, -119.9)" d="M 371.1289978027344 126.281005859375 L 371.8875427246094 126.281005859375 L 371.8875427246094 127.0397338867188 L 371.1289978027344 127.0397338867188 L 371.1289978027344 126.281005859375 Z M 371.1289978027344 126.281005859375" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 1.0, middle: 0.6554),
                            //           Pin(size: 1.0, end: 4.0),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="16.8 20.9 1.0 1.0" ><path transform="translate(-306.26, -392.88)" d="M 323.0469970703125 413.7699890136719 L 323.8055114746094 413.7699890136719 L 323.8055114746094 414.5285339355469 L 323.0469970703125 414.5285339355469 L 323.0469970703125 413.7699890136719 Z M 323.0469970703125 413.7699890136719" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //         Pinned.fromPins(
                            //           Pin(size: 1.0, start: 2.0),
                            //           Pin(size: 1.0, middle: 0.5049),
                            //           child: SvgPicture.string(
                            //             '<svg viewBox="2.5 12.5 1.0 1.0" ><path transform="translate(-38.04, -235.94)" d="M 40.56639862060547 248.4880065917969 L 41.32513046264648 248.4880065917969 L 41.32513046264648 249.2465515136719 L 40.56639862060547 249.2465515136719 L 40.56639862060547 248.4880065917969 Z M 40.56639862060547 248.4880065917969" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            //             allowDrawingOutsideViewBox: true,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         ),
                            //       ],
                            //     )),
                            Image.asset(
                              'assets/images/filter/experience.png',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Experience',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(1.0, 5.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/filter/age.png',
                              height: 40,
                              width: 40,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Age',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              // isExpanded: true,
                              underline: Container(
                                height: 0,
                                color: Colors.white,
                              ),
                              // itemHeight: 30,
                              icon: Icon(Icons.keyboard_arrow_down),
                              dropdownColor: Colors.white,
                              hint: Text('Title'),

                              // itemHeight: 300,

                              items: [
                                'Software engineer',
                                'Giza',
                                'Alexandria',
                                'Luxor',
                                'Port Said',
                                'Suez',
                                'Tanta',
                              ]
                                  .map(
                                    (item) =>
                                    DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                              )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectCity = value;
                                });
                              },
                              value: selectCity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  bottom: 20,
                ),
                child: CustomButton(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    onPressed: () {
                      MagicRouter.pop();
                    },
                    text: 'Filter',
                    backgroundColor: kSecondColor),
              ),
            ],
          ),
    );
  }
}

