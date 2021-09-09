import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/cubit/cubit_nav_bar_employer/nav_bar_employer_cubit.dart';
import 'package:medical_hiring/core/cubit/cubit_nav_bar_employer/nav_bar_employer_state.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/drewer_employer.dart';

class NavBarFABEmployer extends StatelessWidget {


  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarEmployerCubit(),
      child: BlocConsumer<NavBarEmployerCubit, NavBarEmployerStates>(
        listener: (context, states) {},
        builder: (context, states) {
          NavBarEmployerCubit cubit = NavBarEmployerCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            drawer: DrawerEmployerView(),
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: CustomAppBar(
                  titleAppbar: cubit.titleAppbar,
                  leading: buildDrawer(),
                )),
            body: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: PageStorage(
                  child: cubit.currentScreen,
                  bucket: bucket,
                ),

                /// Create New Job
                floatingActionButton: FloatingActionButton(
                  // mini: true,
                  backgroundColor: kMainColor,
                  child: Icon(
                    Icons.add,
                    color: cubit.changeColorIcon(2),
                    size: 30,
                  ),
                  onPressed: () {
                    cubit.changeIndex(2);
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: BottomAppBar(
                    shape: CircularNotchedRectangle(),
                    notchMargin: 5,
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      color: kMainColor,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ///lift  Tab bar icons
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ///home
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  cubit.changeIndex(0);
                                },
                                child: Icon(
                                  Icons.home,
                                  size: 30,
                                  color: cubit.changeColorIcon(0),
                                ),
                              ),
                              SizedBox(width: 20),

                              ///notification
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  cubit.changeIndex(1);
                                },
                                child: Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: cubit.changeColorIcon(1),
                                ),
                              )
                            ],
                          ),

                          /// Right Tab bar icons
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /// messages
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  cubit.changeIndex(3);
                                },
                                child: Icon(
                                  Icons.mail,
                                  size: 30,
                                  color: cubit.changeColorIcon(3),
                                ),
                              ),
                              SizedBox(width: 20),

                              /// My Job
                              MaterialButton(
                                minWidth: 40,
                                onPressed: () {
                                  cubit.changeIndex(4);
                                },
                                child: Icon(
                                  Icons.shopping_bag,
                                  size: 30,
                                  color: cubit.changeColorIcon(4),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Builder buildDrawer() {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => Scaffold.of(context).openDrawer(),
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

}

///________________________________________________________________________

// class NavBarApp extends StatefulWidget {
//   static String routeId = 'NavBarApp';
//
//   @override
//   _NavBarAppState createState() => _NavBarAppState();
// }
//
// class _NavBarAppState extends State<NavBarApp> {
//   PersistentTabController _controller =
//       PersistentTabController(initialIndex: 0);
//
//   String titleAppbar = 'Home';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: DrawerView(),
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(80),
//           child: CustomAppBar(
//             titleAppbar: titleAppbar,
//             leading: buildDrawer(),
//           )),
//       body: PersistentTabView(
//         context,
//
//         onItemSelected: (val) {
//           setState(() {
//             titleAppbar = listTitleAppBar()[val].toString();
//           });
//         },
//         controller: _controller,
//         screens: _buildScreens(),
//         navBarHeight: 60,
//         items: _navBarsItems(),
//         confineInSafeArea: true,
//         margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//
//         backgroundColor: kMainColor,
//         // Default is Colors.white.
//         handleAndroidBackButtonPress: true,
//         // Default is true.
//         resizeToAvoidBottomInset: true,
//         // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//         // stateManagement: true,
//         // Default is true.
//         hideNavigationBarWhenKeyboardShows: true,
//         // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//         decoration: NavBarDecoration(
//           borderRadius: BorderRadius.circular(50.0),
//           colorBehindNavBar: Colors.white,
//         ),
//         // popAllScreensOnTapOfSelectedTab: true,
//         // popActionScreens: PopActionScreensType.once,
//
//         itemAnimationProperties: ItemAnimationProperties(
//           // Navigation Bar's items animation properties.
//
//           duration: Duration(milliseconds: 200),
//
//           curve: Curves.fastLinearToSlowEaseIn,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimation(
//           // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         floatingActionButton: SizedBox(),
//
//         navBarStyle:
//             NavBarStyle.style15, // Choose the nav bar style with this property.
//       ),
//     );
//   }
//
//   Builder buildDrawer() {
//     return Builder(
//       builder: (context) => GestureDetector(
//         onTap: () {
//           Scaffold.of(context).openDrawer();
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30),
//           child: Container(
//             decoration: BoxDecoration(
//                 color: kSecondColor, borderRadius: BorderRadius.circular(10)),
//             child: Center(
//               child: Icon(
//                 CupertinoIcons.line_horizontal_3_decrease,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<String> listTitleAppBar() {
//     return [
//       'Home',
//       'Notification',
//       'add',
//       'Messages',
//       'Saved',
//     ];
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       HomeView(),
//       Notifications(),
//       Center(
//         child: Text(
//           'Search',
//           style: TextStyle(fontSize: 50),
//         ),
//       ),
//       Messages(),
//       Saved(),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(
//           CupertinoIcons.home,
//           // color: Colors.white,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: Colors.grey[500],
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(
//           Icons.notifications,
//           // color: Colors.black,
//           size: 30,
//         ),
//         // iconSize: 30,
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: Colors.grey[500],
//       ),
//       PersistentBottomNavBarItem(
//         icon: CircleAvatar(
//           radius: 50,
//           backgroundColor: Color(0xff000080),
//           child: Icon(
//             CupertinoIcons.add,
//             size: 30,
//             // color: Colors.pinkAccent,
//           ),
//         ),
//         // opacity: 0.9,
//         inactiveIcon: CircleAvatar(
//           radius: 30,
//           backgroundColor: Color(0xff000880),
//           child: Icon(
//             CupertinoIcons.add,
//             size: 30,
//             color: Colors.grey[500],
//           ),
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: Colors.grey[500],
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(
//           Icons.markunread_rounded,
//           size: 30,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: Colors.grey[500],
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(
//           CupertinoIcons.bag_fill,
//           size: 30,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: Colors.grey[500],
//       ),
//     ];
//   }
// }
