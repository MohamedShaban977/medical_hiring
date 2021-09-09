import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_hiring/View/employee_Screens/home_employee_screen/home_employee_view.dart';
import 'package:medical_hiring/View/employee_Screens/my_jobs/my_jobs.dart';
import 'package:medical_hiring/View/employee_Screens/settings/employee_settings.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';

import '../../../constants.dart';
import '../messages_screens/messages.dart';
import '../notifications_employee/notifications__employee_view.dart';
import '../savedemployee/saved_employee_view.dart';

class NavBarEmployee extends StatefulWidget {
  static String routeId = 'NavBarEmployee';
  @override
  _NavBarEmployeeState createState() => _NavBarEmployeeState();
}

class _NavBarEmployeeState extends State<NavBarEmployee> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeEmployeeView(); // Our first view in viewport
  String titleAppbar = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer2(context),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            titleAppbar: currentTab == 0
                ? listTitleAppBar()[0]
                : currentTab == 1
                    ? listTitleAppBar()[1]
                    : currentTab == 2
                        ? listTitleAppBar()[2]
                        : listTitleAppBar()[3],
            leading: buildDrawer(),
          )),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        child: Scaffold(
          body: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              // notchMargin: 5,
              color: Colors.white,
              // clipBehavior: Clip.antiAlias,
              child: Container(
                color: kMainColor,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ///lift  Tab bar icons
                    ///
                    SizedBox(width: 20),

                    ///home  => index 0
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[0];
                          // if user taps on this dashboard tab will be active
                          currentTab = 0;
                        });
                      },
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color:
                            currentTab == 0 ? Colors.white : Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 20),

                    ///notification  => index 1
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[1];

                          // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color:
                            currentTab == 1 ? Colors.white : Colors.grey[500],
                      ),
                    ),

                    SizedBox(width: 20),

                    /// Right Tab bar icons
                    /// messages  => index 2
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[2];
                          // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Icon(
                        Icons.mail,
                        size: 30,
                        color:
                            currentTab == 2 ? Colors.white : Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 20),

                    /// saved  => index 3
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = screens[
                              3]; // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Icon(
                        Icons.shopping_bag,
                        size: 30,
                        color:
                            currentTab == 3 ? Colors.white : Colors.grey[500],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Drawer buildDrawer2(BuildContext context, {currentScreen ,currentTab,screens}) {
  //   return Drawer(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         SizedBox(height: 50),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             CircleAvatar(
  //               radius: 40,
  //             ),
  //             SizedBox(width: 10),
  //             Text(
  //               'Amr Eltohamy',
  //               style: TextStyle(
  //                   fontSize: 20,
  //                   color: kMainColor,
  //                   letterSpacing: 1.2,
  //                   fontWeight: FontWeight.w700),
  //             )
  //           ],
  //         ),
  //         SizedBox(height: 20),
  //         Divider(
  //           height: 10,
  //           endIndent: 20,
  //           indent: 20,
  //           color: Colors.black54,
  //           thickness: 1,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(50),
  //           child: Column(
  //             children: [
  //               buttonItem(
  //                   onTap: () {
  //                     setState(() {
  //                       currentScreen = screens[0];
  //                       currentTab = 0;
  //                     });
  //
  //                     print('adf');
  //                     Navigator.pop(context);
  //                   },
  //                   text: 'Home',
  //                   iconData: Icons.home),
  //               SizedBox(height: 10),
  //               buttonItem(
  //                 onTap: () {
  //                   setState(() {
  //                     currentScreen = screens[3];
  //                     currentTab = 3;
  //                   });
  //
  //                   print('adf');
  //                   Navigator.pop(context);
  //                 },
  //                 text: 'My jobs',
  //                 iconData: Icons.shopping_bag_rounded,
  //               ),
  //               SizedBox(height: 10),
  //               buttonItem(
  //                 onTap: () {
  //                   setState(() {
  //                     currentScreen = screens[2];
  //                     currentTab = 2;
  //                   });
  //
  //                   print('adf');
  //                   Navigator.pop(context);
  //                 },
  //                 text: 'Messages',
  //                 iconData: Icons.markunread,
  //               ),
  //               SizedBox(height: 10),
  //               buttonItem(
  //                 onTap: () {
  //                   setState(() {
  //                     currentScreen = screens[1];
  //                     currentTab = 1;
  //                   });
  //
  //                   print('adf');
  //                   Navigator.pop(context);
  //                 },
  //                 text: 'Notification',
  //                 iconData: Icons.notifications,
  //               ),
  //               SizedBox(height: 10),
  //               buttonItem(
  //                 text: 'Saved',
  //                 iconData: Icons.bookmark,
  //               ),
  //               SizedBox(height: 10),
  //               buttonItem(
  //                 onTap: () {},
  //                 text: 'Settings',
  //                 iconData: Icons.settings,
  //               ),
  //               SizedBox(height: 30),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: 20),
  //         Divider(
  //           height: 10,
  //           endIndent: 20,
  //           indent: 20,
  //           color: Colors.black54,
  //           thickness: 1,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(50),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               CircleAvatar(
  //                 radius: 27,
  //                 backgroundColor: Colors.black38,
  //                 child: CircleAvatar(
  //                   radius: 25,
  //                   backgroundColor: Colors.white,
  //                   child: Icon(FontAwesomeIcons.facebookF),
  //                 ),
  //               ),
  //               CircleAvatar(
  //                 radius: 27,
  //                 backgroundColor: Colors.black38,
  //                 child: CircleAvatar(
  //                   radius: 25,
  //                   backgroundColor: Colors.white,
  //                   child: Icon(FontAwesomeIcons.twitter),
  //                 ),
  //               ),
  //               CircleAvatar(
  //                 radius: 27,
  //                 backgroundColor: Colors.black38,
  //                 child: CircleAvatar(
  //                   radius: 25,
  //                   backgroundColor: Colors.white,
  //                   child: Icon(
  //                     FontAwesomeIcons.instagram,
  //                     color: Color.lerp(Colors.yellow, Colors.red, 0.9),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Builder buildDrawer() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
          child: Container(
            decoration: BoxDecoration(
                color: kSecondColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> screens = [
    HomeEmployeeView(),
    NotificationsEmployeeView (),
    MessagesEmployee(),
    MyJobsEmployee(),
  ]; //
// List<Widget> _screens(){
//     return[
//       HomeEmployeeView(),
//       Messages(),
//       NotificationsView(),
//       MyJobsEmployee(),
//     ];
// }
  List<String> listTitleAppBar() {
    return [
      'Home',
      'Notification',
      'Messages',
      'My Jobs',
    ];
  }

  Widget buttonItem(
      {@required IconData iconData,
      @required String text,
      @required Function onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: kMainColor,
            size: 30,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: kMainColor,
              // letterSpacing: 1.2,
            ),
          )
        ],
      ),
    );
  }

  Drawer buildDrawer2(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: kSecondColor,
              ),
              SizedBox(width: 10),
              Text(
                'Amr Eltohamy',
                style: TextStyle(
                    fontSize: 20,
                    color: kMainColor,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(height: 20),
          Divider(
            height: 10,
            endIndent: 20,
            indent: 20,
            color: Colors.black54,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                buttonItem(
                    onTap: () {
                      setState(() {
                        currentScreen = screens[0];
                        currentTab = 0;
                      });

                      print(screens[0].toString());
                      Navigator.pop(context);
                    },
                    text: 'Home',
                    iconData: Icons.home),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = screens[3];
                      currentTab = 3;
                    });

                    print(screens[3].toString());
                    Navigator.pop(context);
                  },
                  text: 'My jobs',
                  iconData: Icons.shopping_bag_rounded,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = screens[2];
                      currentTab = 2;
                    });

                    print('adf');
                    Navigator.pop(context);
                  },
                  text: 'Messages',
                  iconData: Icons.markunread,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = screens[1];
                      currentTab = 1;
                    });

                    print('adf');
                    Navigator.pop(context);
                  },
                  text: 'Notification',
                  iconData: Icons.notifications,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () =>
                      Navigator.pushNamed(context, SavedEmployeeView.routeId),
                  text: 'Saved',
                  iconData: Icons.bookmark,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () =>
                      Navigator.pushNamed(context, EmployeeSettings.routeId),
                  text: 'Settings',
                  iconData: Icons.settings,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            height: 10,
            endIndent: 20,
            indent: 20,
            color: Colors.black54,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(FontAwesomeIcons.facebookF),
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(FontAwesomeIcons.twitter),
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Color.lerp(Colors.yellow, Colors.red, 0.9),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
