import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_hiring/View/employer_screens/profile/employer_profile.dart';
import 'package:medical_hiring/View/employer_screens/settings/employer_settings.dart';
import 'package:medical_hiring/core/cubit/cubit_nav_bar_employer/nav_bar_employer_cubit.dart';
import 'package:medical_hiring/core/cubit/cubit_nav_bar_employer/nav_bar_employer_state.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class DrawerEmployerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDrawer2(context);
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

  final urlFaceBook = 'https://flutter.dev';
  final urlInstagram = 'https://www.instagram.com/medicaltalks/';
  final urlTwitter = 'https://twitter.com/medical_vma?lang=ar';
  void launchURlFaceBook() async => await canLaunch(urlFaceBook)
      ? await launch(
          urlFaceBook,
          enableJavaScript: true,
          forceWebView: true,
        )
      : throw 'Could not launch $urlFaceBook';

  void launchURlInstagram() async => await canLaunch(urlInstagram)
      ? await launch(
          urlInstagram,
          enableJavaScript: true,
          forceWebView: true,
        )
      : throw 'Could not launch $urlInstagram';

  void launchURlTwitter() async => await canLaunch(urlTwitter)
      ? await launch(
          urlTwitter,
          enableJavaScript: true,
          forceWebView: true,
        )
      : throw 'Could not launch $urlTwitter';

  Widget buildDrawer2(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          InkWell(
            onTap: () => MagicRouter.navigateTo(EmployerProfile()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: kSecondColor,
                ),
                SizedBox(width: 10),
                Text(
                  'Company Name',
                  style: TextStyle(
                      fontSize: 20,
                      color: kMainColor,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700),
                )
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
          BlocConsumer<NavBarEmployerCubit, NavBarEmployerStates>(
              listener: (context, state) {},
              builder: (context, state) {
                NavBarEmployerCubit cubit = NavBarEmployerCubit.get(context);

                return Padding(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    children: [
                      buttonItem(
                          onTap: () {
                            cubit.changeIndex(0);
                            Navigator.pop(context);
                          },
                          text: 'Home',
                          iconData: Icons.home),
                      SizedBox(height: 10),
                      buttonItem(
                        onTap: () {
                          cubit.changeIndex(4);
                          Navigator.pop(context);
                        },
                        text: 'My jobs',
                        iconData: Icons.shopping_bag_rounded,
                      ),
                      SizedBox(height: 10),
                      buttonItem(
                        onTap: () {
                          cubit.changeIndex(3);
                          Navigator.pop(context);
                        },
                        text: 'Messages',
                        iconData: Icons.markunread,
                      ),
                      SizedBox(height: 10),
                      buttonItem(
                        onTap: () {
                          cubit.changeIndex(1);
                          Navigator.pop(context);
                        },
                        text: 'Notification',
                        iconData: Icons.notifications,
                      ),
                      SizedBox(height: 10),
                      buttonItem(
                        onTap: () => MagicRouter.navigateTo(EmployerSettings()),
                        text: 'Settings',
                        iconData: Icons.settings,
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                );
              }),
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
                InkWell(
                  onTap: () {
                    launchURlFaceBook();
                    MagicRouter.pop();
                  },
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.black38,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(FontAwesomeIcons.facebookF),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchURlTwitter();
                    MagicRouter.pop();
                  },
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.black38,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(FontAwesomeIcons.twitter),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchURlInstagram();
                    MagicRouter.pop();
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: CircleAvatar(
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
